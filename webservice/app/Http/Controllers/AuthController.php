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
		else {
			$credentials = [
				'phone' => $request->phone,
				'password' =>  $request->password,
				'status' => 'active'
			];

			if(Auth::attempt($credentials)) {
				if(Auth::user()->role_id == 5){

				$data = User::join('role','users.role_id','=','role.id')
			    			->join('agen', 'users.id', '=', 'agen.identifier')
			    			->select('users.id as user_id','users.api_token', 'role.name', 'agen.name','users.store_id')
			    			->where('users.id',Auth::user()->id)
			    			->first();
				return response()->json(['data' => $data, 'message' => ['OK']]);
			}
				if(Auth::user()->role_id == 2){

				$data = User::join('role','users.role_id','=','role.id')
			    			->join('customer', 'users.id', '=', 'customer.identifier')
			    			->select('users.id as user_id','users.api_token', 'role.name', 'customer.name')
			    			->where('users.id',Auth::user()->id)
			    			->first();
				return response()->json(['data' => $data, 'message' => ['OK']]);
			}

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
