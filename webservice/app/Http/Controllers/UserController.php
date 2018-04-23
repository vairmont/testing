<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Agen;
use Hash;
use Auth;
use Validator;
use DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPassword;

class UserController extends Controller
{

	public function getProfile(Request $request)
	{
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $user = User::select('role_id')
                ->where('id', "=", $request->user_id)
                ->first();

            $profile = User::where('users.id', $request->user_id);

            if($user->role_id == 2) {
                $profile = $profile->select('users.email', 'customer.name', 'customer.phone', 'customer.city_id', 'customer.address_1 as map_address', 'customer.lat', 'customer.lng', 'customer.address_2 as detail_address', 'city.name as city_name')
                ->Join('customer', 'users.id', '=', 'customer.identifier')
                ->Join('city', 'customer.city_id', '=', 'city.id');
            }
            else {
                return response()->json(['data' => [], 'message' => ['You are not authorized']]);
            }

            $profile = $profile->first();

            return response()->json(['data' => $profile, 'message' => ['OK']]);
        }
    }
   
    public function editProfile(Request $request) {

        $val = Validator::make($request->all(), [
            'user_id' => 'required',
            'address_1' => 'required',
            'address_2' => 'required',
            'lat' => 'required',
            'lng' => 'required',
            'city_id' => 'required'

        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {

            $user = User::select('role_id')
            ->where('id', "=", $request->user_id)
            ->first();

            $data = array(
                'phone' => $request->phone,
                'address_1' =>  $request->address_1,
                'address_2' =>  $request->address_2,
                'lat' =>  $request->lat,
                'lng' =>  $request->lng,
                'city_id'	=> $request->city_id
            );

            if($user->role_id == 2) {
                Customer::where('identifier', $request->user_id)->update($data);
            }

            elseif($user->role_id == 3 || $user->role_id == 4) {
                Reseller::where('identifier', $request->user_id)->update($data);
            }

            elseif($user->role_id == 5) {
                Dealer::where('identifier', $request->user_id)->update($data);
            }

            return response()->json(['data' => [], 'message' => ['OK']]);
        }

    }

    public function changePassword(Request $request) {
        
        $val = Validator::make($request->all(), [
            'user_id' => 'required',
            'old_password' => 'required',
            'password' => 'required|min:6',
            'confirm_password' => 'required|same:password'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {
            $user = User::select('password')
            ->where('id', "=", $request->user_id)
            ->first();

            if(Hash::check($request->old_password, $user->password)){
                $data = array(
                    'password' => Hash::make($request->password)
                );

                User::where('id', $request->user_id)->update($data);

                return response()->json(['data' => [], 'message' => ['OK']]);
            }
            else{
                return response()->json(['data' => [], 'message' => ['Invalid Old Password']]);  
            }
        }
    }

    public function forgotPassword(Request $request) {
        $val = Validator::make($request->all(), [
            'email' => 'required'
        ]);
        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {
            $newpassword = rand(111111,999999);

            $user = User::where('email', "=", $request->email)
            ->whereIn('role_id',['2','3','4', '5']);
                if(count($user->first())>0)
                {
                    $data = [
                        'email' => $request->email,
                        'password' => $newpassword
                    ];
                    $user->update(['password' => Hash::make($newpassword)]);
                    Mail::to($request->email)->send(new ResetPassword($data));
                    return response()->json(['data' => [], 'message' => ['OK']]);
                }
                else
                {
                    return response()->json(['data' => [], 'message' => ['Invalid Email']]);  
            }
        }
    }
	
}
