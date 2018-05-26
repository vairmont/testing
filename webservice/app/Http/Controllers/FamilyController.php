<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use Hash;
use App\Family;
use App\User;
use App\Agen;
use App\FCM;

class FamilyController extends Controller
{
	public function getFamily(Request $request)
	{
		$agen = Family::join('agen', 'agen.id','=','family.child_id')
		->join('users', 'users.id', '=', 'agen.identifier')
		->select('agen.name', 'family.relation', 'agen.ktp_photo', 'users.phone')
		->where('family.parent_id', $request->get('user')->id)
		->get();

		return response()->json(['data' => $agen, 'message' => ['OK']]);
    }
       

	Public function addFamily(Request $request)
	{
		if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama tidak boleh kosong']]);
        }

		else {

			$user = [
				'role_id' => 5,
				'phone' => $request->phone,
				'password' => Hash::make('123456'),
				'api_token' => uniqid(),
				'status' => 'active'
			];

			$createUser = User::create($user);

			$dataAgen = Agen::where('id', $request->agen_id)->first();

			$agen = [
				'identifier' => $createUser->id,
				'parent' => 0,
				'business_name' => $dataAgen->business_name,
				'name' => $request->name,
				'address' => $dataAgen->address,
				'ktp_photo' => '',
				'kk_photo' => $dataAgen->kk_photo
			];

			$createAgen = Agen::create($agen);

			$family = [
				'parent_id' => $dataAgen->id,
				'child_id' => $createAgen->id,
				'relation' => $request->relation
            ];
            $create = Family::create($family);

            return response()->json(['family_id' => $createAgen->id, 'message' => ['OK']]);
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

			Agen::where('id', $request->header('family_id'))
			->update([
				'ktp_photo' => "storage/app/".$path
			]);

			return response()->json(['data' => [], 'message' => ['OK']]);
		}
	}

}

