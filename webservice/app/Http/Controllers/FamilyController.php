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
			$agen = Agen::join('user', 'agen.identifier', '=', 'user.id')
				->join('family', 'agen.id', '=', 'family.parent_id')
                ->where('identifier', "=", $request->get('user')->id)
				->select('agen.name', 'user.phone', 'family.relation');

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
            $create = Family::create($family);

            return response()->json(['family_id' => $create->id, 'message' => ['OK']]);
    		}
    }		

    public function uploadKtpPhoto(Request $request)
	{
		// upload photos
		// will store in storage/app/photos
		if(empty($request->ktp_photo)) {
            return response()->json(['data' => [], 'message' => ['Foto Ktp tidak boleh kosong']]);
        }

		else {
		var_dump($request);die;
		$path = $request->file('ktp_photo')->store('photo_ktp');

		Family::where('id', $request->family_id)
		->update([
			'ktp_photo' => "storage/app/".$path
		]);

		return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}

}

