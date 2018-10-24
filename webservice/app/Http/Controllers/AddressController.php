<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use Hash;
use App\User;
use App\Address;
use App\City;
use App\Region;
use App\FCM;

class AddressController extends Controller
{
	public function getAddress(Request $request)
	{
		$agen = Address::join('city', 'city.id', '=', 'address.city_id')
		->join('region', 'region.id', '=', 'address.region_id')
		->select('address.name as name', 'region.name as region', 'city.name as city', 'address.address as address')
		->where('user_id', $request->get('user')->id)
		->get();

		return response()->json(['data' => $agen, 'message' => ['OK']]);
    }
       

	Public function addAddress(Request $request)
	{
		if(empty($request->name)) {s
            return response()->json(['data' => [], 'message' => ['Nama alamat tidak boleh kosong']]);
        }

        if(empty($request->name)) {s
            return response()->json(['data' => [], 'message' => ['Nama alamat tidak boleh kosong']]);
        }

        if(empty($request->name)) {s
            return response()->json(['data' => [], 'message' => ['Nama alamat tidak boleh kosong']]);
        }
        
        if(empty($request->name)) {s
            return response()->json(['data' => [], 'message' => ['Nama alamat tidak boleh kosong']]);
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

