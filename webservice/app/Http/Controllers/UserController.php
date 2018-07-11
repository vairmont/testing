<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Agen;
use App\Rating;
use Hash;
use Auth;
use Validator;
use DB;
use Illuminate\Support\Facades\Mail;
use App\Mail\ResetPassword;

class UserController extends Controller
{
    public function uploadPhoto(Request $request)
    {
        // upload photos will store in storage/app/photos
        if(empty($request->photo)) {
            return response()->json(['data' => [], 'message' => ['Foto tidak boleh kosong']]);
        }
        else {

            $path = $request->file('photo')->store('photo_agen');

            Agen::where('id', $request->header('agen_id'))
            ->update([
                'photo' => "storage/app/".$path
            ]);

            return response()->json(['data' => [], 'message' => ['OK']]);
        }
    }

	public function getProfile(Request $request)
	{
            if($request->get('user')->role_id == 5){

                $item = Rating::select('rating')
                            ->where('agen_id', '=', $request->get('user')->id)
                            ->avg('rating');

                $rating = number_format($item, 1, '.', '');

                $rate = [
                'rating' => $rating
                ];

                $save = Agen::where('identifier','=', $request->get('user')->id)
                ->update($rate);

                $data = User::join('role','users.role_id','=','role.id')
                            ->join('agen', 'users.id', '=', 'agen.identifier')
                            ->select('agen.*', 'users.phone')
                            ->where('users.id',$request->get('user')->id)
                            ->first();
                return response()->json(['data' => $data, 'message' => ['OK']]);
            }
            if($request->get('user')->role_id == 2){

                $data = User::join('role','users.role_id','=','role.id')
                            ->join('customer', 'users.id', '=', 'customer.identifier')
                            ->join('agen', 'customer.agen_id', '=', "agen.id")
                            ->select('customer.*', 'users.phone', 'agen.name as nama_agen')
                            ->where('users.id',$request->get('user')->id)
                            ->first();
                return response()->json(['data' => $data, 'message' => ['OK']]);
            }
    }
    
   
    public function changePassword(Request $request) {
        
        $val = Validator::make($request->all(), [
            'old_password' => 'required',
            'password' => 'required|min:6',
            'confirm_password' => 'required|same:password'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        } 
        else {
            $user = User::select('password')
            ->where('id', "=", $$request->get('user')->id)
            ->first();

            if(Hash::check($request->old_password, $user->password)){
                $data = array(
                    'password' => Hash::make($request->password)
                );

                User::where('id', $request->user_id)->update($data);

                return response()->json(['data' => [], 'message' => ['Password berhasil diubah.']]);
            }
            else{
                return response()->json(['data' => [], 'message' => ['Password lama anda salah.']]);  
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
            $newpassword = Hash::make('123456');

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
                    return response()->json(['data' => [], 'message' => ['Nomor HP yang anda masukkan salah']]);  
            }
        }
    }

    public function getCustomerList(Request $request){
        $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

        $customer = User::Join('customer', 'users.id', '=', 'customer.identifier')
                    ->select('customer.name', 'customer.address', 'users.phone', 'customer.lat', 'customer.long', 'customer.photo')
                    ->where('customer.agen_id', '=', $agen->id)
                    ->get();

        return response()->json(['data' => $customer, 'message' => ['OK']]);            
    }
	
}
