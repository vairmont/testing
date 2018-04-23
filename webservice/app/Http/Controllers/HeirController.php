<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use App\Heir;
use App\User;
use App\Agen;
use App\FCM;

class HeirController extends Controller
{
	public function getHeir(Request $request)
	{
            $agen = Heir::select('name')
                ->where('user_id', "=", $request->get('user')->id)
                ->first();

            return response()->json(['data' => $agen, 'message' => ['OK']]);
    }
       

	Public function addHeir (Request $request)
	{
			if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama tidak boleh kosong']]);
        }

		else{
			$heir = [
				'user_id' => $request->user_id,
                'name' => $request->name
            	];
            Heir::create($heir);

            return response()->json(['data' => $heir, 'message' => ['OK']]);
    		}
    }		

    public function uploadKtpPhoto(Request $request)
	{
		// upload photos
		// will store in storage/app/photos
		if(empty($request->ktp_photo)) {
            return response()->json(['data' => [], 'message' => ['Foto Ktp tidak boleh kosong']]);
        }

		else{
		$path = $request->file('ktp_photo')->store('photos');

		Heir::where('id', $request->header('user_id'))
		->update([
			'store_photo' => "storage/app/".$path
		]);

		return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}

	public function uploadKkPhoto(Request $request)
	{
		// upload photos
		// will store in storage/app/photos
		if(empty($request->kk_photo)) {
            return response()->json(['data' => [], 'message' => ['Foto KK tidak boleh kosong']]);
        }

		else{

		$path = $request->file('kk_photo')->store('photos');

		Heir::where('id', $request->header('agen_id'))
		->update([
			'store_photo' => "storage/app/".$path
		]);

		return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}

	public function uploadAktaPhoto(Request $request)
	{
		// upload photos
		// will store in storage/app/photos
		if(empty($request->akta_photo)) {
            return response()->json(['data' => [], 'message' => ['Foto Akta tidak boleh kosong']]);
        }

		else{

		$path = $request->file('akta_photo')->store('photos');

		Heir::where('id', $request->header('agen_id'))
		->update([
			'store_photo' => "storage/app/".$path
		]);

		return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}

}

