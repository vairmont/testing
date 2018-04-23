<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use App\Family;
use App\User;
use App\Agen;
use App\FCM;

class FamilyController extends Controller
{
	public function getFamily(Request $request)
	{
            $agen = Family::select('name')
                ->where('agen_id', "=", $request->get('user')->id)
                ->first();

            return response()->json(['data' => $agen, 'message' => ['OK']]);
    }
       

	Public function addFamily (Request $request)
	{
			if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama tidak boleh kosong']]);
        }

		else{
			$family = [
				'agen_id' => $request->get('user')->id,
				'phone' => $request->phone,
				'password' => $request->password,
				'relation' => $request->relation,
                'name' => $request->name
            	];
            Family::create($family);

            return response()->json(['data' => $family, 'message' => ['OK']]);
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

		Family::where('id', $request->header('user_id'))
		->update([
			'store_photo' => "storage/app/".$path
		]);

		return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}

}
