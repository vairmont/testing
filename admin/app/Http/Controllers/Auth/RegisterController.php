<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use App\Admin;
use App\User;
use App\Agen;
use App\Role;
use Validator;
use DB;

class RegisterController extends Controller
{
    public function create()
    {
        return view('register')->withTitle('Registration');
    }

    public function addAgen(Request $request)
    {

        if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama tidak boleh kosong']]);
        }

        if(empty($request->phone)) {
            return response()->json(['data' => [], 'message' => ['Nomor Ponsel tidak boleh kosong']]);
        }

        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Alamat tidak boleh kosong']]);
        }

        if(empty($request->email)) {
            return response()->json(['data' => [], 'message' => ['E-mail tidak boleh kosong']]);
        }

        if(empty($request->password)) {
            return response()->json(['data' => [], 'message' => ['Password tidak boleh kosong']]);
        }

        if(empty($request->confirm_password)) {
            return response()->json(['data' => [], 'message' => ['Konfirmasi Password tidak boleh kosong']]);
        }

        $val = Validator::make($request->all(), [
            'phone' => 'unique:agen,phone',
            'email' => 'unique:users,email',
            'password' => 'min:6',
            'confirm_password' => 'same:password'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
        
            $user =[
				'email' => $request->email,
				'password' => Hash::make($request->password),
				'api_token' => 'key-'.uniqid(),
				'role_id' => 2,
				'status' => 'active'
			];
			$save = User::create($user);

            $agen = [
                'identifier' =>$save->id,
                'name' => $request->name,
                'phone' => $request->phone,
                'address' => $request->address
            ];
            Agen::create($agen);

            return response()->json(['data' => ['registration_id' => $save->id], 'message' => ['OK']]);
        }
    }
}
