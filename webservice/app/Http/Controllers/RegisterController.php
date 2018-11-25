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

        if(empty($request->phone)) {
            return response()->json(['data' => [], 'message' => ['Nomor Ponsel tidak boleh kosong']]);
        }

        $val = Validator::make($request->all(), [
            'business_name' => 'unique:agen,business_name',
            'phone' => 'unique:users,phone'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            
             //Regis Nomor VA & get terminal ID dari Jatelindo
            $datax = [
            "kodetransaksi"=> "07",
            "user"=> "grosirone",
            "password"=> "5b8598bed42b271cb8ec62c4bdd4f3ck",
            "nova"=> "",
            "idtrx"=> "",
            "idmerchant"=> "18",
            "nominal"=> "0",
            "keterangan"=> "0|".$request->phone."|".$request->name."|info@grosir.one",
            "kodemitra"=> "004",
            "kodebank"=> "",
            "noref"=> "0",
            "tglexpired"=> ""
          ];
          
          $data = json_encode($datax);
          $URL   = 'http://182.23.53.58:20128/';
            $ch = curl_init($URL);

          curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
          curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
          curl_setopt($ch, CURLOPT_POST, 1);
          curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
          curl_setopt($ch, CURLOPT_POSTFIELDS, "$data");
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
          curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY); 
          curl_setopt($ch, CURLOPT_TIMEOUT, 120);

          $datay = curl_exec($ch);
          $curl_errno = curl_errno($ch);
          $curl_error = curl_error($ch);
            

          curl_close($ch);
            $res = json_decode($datay, true);
            $nova = json_decode($datay, true);   

            $user =[
				'phone' => $request->phone,
				'password' => Hash::make('123456'),
				'api_token' => uniqid(),
				'role_id' => 5,
				'status' => 'inactive'
			];
			$save = User::create($user);

            $agen = [
                'identifier' =>$save->id,
                'business_name' => $request->business_name,
                'name' => $request->name,
                'phone' => $request->phone,
                'address' => $request->address,
                'no_va' => $nova['nova'],
                'terminal_id' => $res['keterangan'],
                'ktp_photo' => '',
                'kk_photo' => ''
            ];
            $create = Agen::create($agen);

            return response()->json(['data' => ['agen_id' => $create->id], 'message' => ['OK']]);
        }
    }

    public function uploadKTP(Request $request)
	{
		// upload photos will store in storage/app/photos
		if(empty($request->ktp_photo)) {
            return response()->json(['data' => [], 'message' => ['Foto Ktp tidak boleh kosong']]);
        }
		else {
			$path = $request->file('ktp_photo')->store('photo_ktp');

			Agen::where('id', $request->header('agenid'))
			->update([
				'ktp_photo' => "storage/app/".$path
			]);

			return response()->json(['data' => [], 'message' => ['OK']]);
		}
    }
    
    public function uploadKK(Request $request)
	{
		// upload photos will store in storage/app/photos
		if(empty($request->kk_photo)) {
            return response()->json(['data' => [], 'message' => ['Foto KK tidak boleh kosong']]);
        }
		else {
			$path = $request->file('kk_photo')->store('photo_kk');

			Agen::where('id', $request->header('agenid'))
			->update([
				'kk_photo' => "storage/app/".$path
			]);

			return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}
}
