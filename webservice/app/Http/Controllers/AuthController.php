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
    	$val = Validator::make($request->all(), [
			'email' => 'required',
			'password' => 'required'
		]);

		if($val->fails()) {
			return response()->json(['data' => [], 'message' => $val->errors()->all()]);
		}
		else {
			$credentials = [
				'email' => $request->email,
				'password' =>  $request->password,
				'status' => 'active'
			];

			if(Auth::attempt($credentials)) {
			    $data = User::leftjoin('role','users.role_id','=','role.id')
			    			->select('users.id as user_id','users.role_id','users.email','users.api_key','role.name as role_name')
			    			->where('users.id',Auth::user()->id)
			    			->first();
				return response()->json(['data' => $data, 'message' => ['OK']]);
			}
			else {
				return response()->json(['data' => [], 'message' => ['Email and Password Incorrect.']]);
			}
    	}
    }

    public function doLogout(Request $request)
    {
    	$data = FCM::where('fcm_token',$request->fcm_token)->delete();

    	return response()->json(['data' => [], 'message' => ['OK']]);
    }
}
