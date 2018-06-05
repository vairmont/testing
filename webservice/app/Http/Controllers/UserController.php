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
                    
            $agen = Agen::join('users', 'agen.identifier', '=', 'users.id')
                        ->select('agen.*', 'users.phone')
                        ->where('users.id', "=", $request->get('user')->id)
                        ->first();

            return response()->json(['data' => $agen, 'message' => ['OK']]);
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
	
}
