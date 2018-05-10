<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use App\User;
use App\FCM;
use Validator;

class AuthController extends Controller
{
    public function doLogin(Request $request) 
    {
    	if(empty($request->phone)) {
            return response()->json(['data' => [], 'message' => ['Nomor Telepon tidak boleh kosong']]);
        }

        if(empty($request->password)) {
            return response()->json(['data' => [], 'message' => ['Password tidak boleh kosong']]);
        }

        else
    	$val = Validator::make($request->all(), [
			'phone' => 'required',
			'password' => 'required'
		]);

		if($val->fails()) {
			return response()->json(['data' => [], 'message' => $val->errors()->all()]);
		}
		else {
			$credentials = [
				'phone' => $request->phone,
				'password' =>  $request->password,
				'status' => 'active'
			];

			if(Auth::attempt($credentials)) {
			    $data = User::leftjoin('role','users.role_id','=','role.id')
			    			->select('users.id as user_id','users.api_token')
			    			->where('users.id',Auth::user()->id)
			    			->first();
				return response()->json(['data' => $data, 'message' => ['OK']]);
			}
			else {
				return response()->json(['data' => [], 'message' => ['Nomor Telepon atau Password Salah.']]);
			}
    	}
    }

    public function doLogout(Request $request)
    {
    	$data = FCM::where('fcm_token',$request->fcm_token)->delete();

    	return response()->json(['data' => [], 'message' => ['OK']]);
    }
}
