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
        if(empty($request->business_name)) {
            return response()->json(['data' => [], 'message' => ['Nama usaha tidak boleh kosong']]);
        }

        if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama lengkap tidak boleh kosong']]);
        }

        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Alamat tidak boleh kosong']]);
        }

        if(empty($request->province)) {
            return response()->json(['data' => [], 'message' => ['Provinsi tidak boleh kosong']]);
        }

        if(empty($request->city)) {
            return response()->json(['data' => [], 'message' => ['Kota tidak boleh kosong']]);
        }

        if(empty($request->district)) {
            return response()->json(['data' => [], 'message' => ['Kecamatan tidak boleh kosong']]);
        }

        if(empty($request->phone)) {
            return response()->json(['data' => [], 'message' => ['Nomor Ponsel tidak boleh kosong']]);
        }

        if(empty($request->ktp_photo)) {
            return response()->json(['data' => [], 'message' => ['Photo KTP tidak boleh kosong']]);
        }

        if(empty($request->kk_photo)) {
            return response()->json(['data' => [], 'message' => ['Photo Password tidak boleh kosong']]);
        }

        $val = Validator::make($request->all(), [
            'business_name' => 'unique:agen,business_name',
            'phone' => 'unique:agen,phone'

        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
        
            $user =[
				'phone' => $request->phone,
				'password' => Hash::make($request->password),
				'api_token' => 'key-'.uniqid(),
				'role_id' => 5,
				'status' => 'active'
			];
			$save = User::create($user);

            $agen = [
                'identifier' =>$save->id,
                'business_name' => $request->bu siness_name,
                'name' => $request->name,
                'phone' => $request->phone,
                'address' => $request->address,
                'province' => $request->province,
                'district' => $request->district,
                'ktp_photo' => '',
                'kk_photo' => ''
            ];
            $create = Agen::create($agen);

            return response()->json(['data' => ['agen_id' => $create->id], 'message' => ['OK']]);
        }
    }
}
