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
                    
            $agen = Agen::join('users', 'agen.identifier', '=', 'users.id')
                        ->select('agen.*', 'users.phone')
                        ->where('users.id', "=", $request->get('user')->id)
                        ->first();

            return response()->json(['data' => $agen, 'message' => ['OK']]);
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
            'phone' => 'required'
        ]);
        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {
            $newpassword = 123456;

            $user = User::where('phone', "=", $request->phone)
            ->whereIn('role_id',['2','3','4', '5'])->first();

                if($user != null)
                {
                    $user->update(['password' => Hash::make($newpassword)]);
                    // Mail::to($request->email)->send(new ResetPassword($data));
                    return response()->json(['data' => [], 'message' => ['OK']]);
                }
                else
                {
                    return response()->json(['data' => [], 'message' => ['Invalid Email']]);  
            }
        }
    }
	
}
