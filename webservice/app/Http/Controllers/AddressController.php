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
		$address = Address::join('city', 'city.id', '=', 'address.city_id')
		->join('region', 'region.id', '=', 'address.region_id')
		->select('address.name as name', 'region.name as region', 'city.name as city', 'address.address as address', 'address.zip')
		->where('user_id', $request->get('user')->id)
		->get();

		return response()->json(['data' => $address, 'message' => ['OK']]);
    }
       

	public function addAddress(Request $request)
	{
		if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama alamat tidak boleh kosong.']]);
        }

        if(empty($request->city_id)) {
            return response()->json(['data' => [], 'message' => ['Kota harus dipilih.']]);
        }

        if(empty($request->region_id)) {
            return response()->json(['data' => [], 'message' => ['Kecamatan harus dipilih.']]);
        }
        
        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Alamat lengkap tidak boleh kosong']]);
        }

        if(empty($request->zip)) {
            return response()->json(['data' => [], 'message' => ['Kode pos tidak boleh kosong']]);
        }


		else {

            $code = Region::where('id', '=', $request->region_id)
                    ->select('code')
                    ->first();

			$address = [
				'name' => $request->name,
				'user_id' => $request->get('user')->id,
				'city_id' => $request->city_id,
				'region_id' => $request->region_id,
                'region_code' => $code->code,
				'address' => $request->address,
				'zip' => $request->zip
			];

			$createAddress = Address::create($address);

            return response()->json(['family_id' => $createAddress->id, 'message' => ['OK']]);
    	}
    }

    public function editAddress(Request $request)
    {
        $code = Region::where('id', '=', $request->region_id)
                    ->select('code')
                    ->first();

            $address = [
                'name' => $request->name,
                'user_id' => $request->get('user')->id,
                'city_id' => $request->city_id,
                'region_id' => $request->region_id,
                'region_code' => $code->code,
                'address' => $request->address,
                'zip' => $request->zip
            ];

        $save = Address::where('user_id', '=', $request->get('user')->id)
        ->update($data);

        return response()->json(['message' => ['OK']]);        
    }		

}

