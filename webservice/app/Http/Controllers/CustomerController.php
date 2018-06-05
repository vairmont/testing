<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Hash;
use Auth;
use DB;
use App\User;
use App\Agen;
use App\Rating;
use App\Customer;
use App\FCM;
use App\Store;

class CustomerController extends Controller
{
	public function getCustomer(Request $request)
	{
			$customer = Customer::select('name', 'phone', 'address', 'gender', 'photo')
						->where('identifier', "=", $request->get('user')->id);

            return response()->json(['data' => $customer, 'message' => ['OK']]);
    }
       
	Public function addCustomer (Request $request)
	{
		if(empty($request->name)) {
            return response()->json(['data' => [], 'message' => ['Nama tidak boleh kosong']]);
        }	

       	if(empty($request->phone)) {
            return response()->json(['data' => [], 'message' => ['Nomor HP tidak boleh kosong']]);
        }

        if(empty($request->gender)) {
            return response()->json(['data' => [], 'message' => ['Gender tidak boleh kosong']]);
        }

        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Alamat rumah tidak boleh kosong']]);
        }

        if(empty($request->agen_id)) {
            return response()->json(['data' => [], 'message' => ['Agen tidak boleh kosong']]);
        }

        $val = Validator::make($request->all(), [
            'phone' => 'unique:users,phone'

        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
    
		else{

			$user =[
				'phone' => $request->phone,
				'password' => 123456,
				'api_token' => uniqid(),
				'role_id' => 2,
				'store_id' => $request->store_id,
				'status' => 'active'
			];
			$save = User::create($user);

			$customer = [
				'identifier' =>$save->id,
				'agen_id' => $request->agen_id,
				'name' => $request->name,
				'address' => $request->address,
                'lat' => $request->lat,
                'lng' => $request->lng,
				'gender' => $request->gender
            	];
            $create = Customer::create($customer);

            return response()->json(['customer_id' => $create->id, 'message' => ['OK']]);
    		}
        }

        public function uploadPhotoCustomer(Request $request)
    {
        // upload photos will store in storage/app/photos
        if(empty($request->photo)) {
            return response()->json(['data' => [], 'message' => ['Foto tidak boleh kosong']]);
        }
        else {

            $path = $request->file('photo')->store('photo_agen');

            Customer::where('id', $request->customer_id)
            ->update([
                'photo' => "storage/app/".$path
            ]);

            return response()->json(['data' => [], 'message' => ['OK']]);
        }
    }

        public function getStore(Request $request)
        {
            $latFrom = deg2rad($request->lat);
            $lonFrom = deg2rad($request->lng);
            $earthRadius = 6371; // in km

            $stores = Store::get();
            
            $listStores = [];
            foreach($stores as $store) {
                // LatLng TOKO
                $latTo = deg2rad($store->lat);
                $lonTo = deg2rad($store->lnng);

                $latDelta = $latTo - $latFrom;
                $lonDelta = $lonTo - $lonFrom;

                $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) + cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

                // 1.6 for convert in miles to km
                // x2 for set exact distance
                $distance = (float)(($angle * $earthRadius) * 2);

                // jika radius < 10km masuk ke list toko

                if($distance <= 10) {
                    array_push($listStores, [
                        'id' => $store->id,
                        'store_name' => $store->store_name,
                        'address' => $store->address 
                    ]);
                }
            }

            return response()->json(['data' => $listStores, 'message' => ['OK']]);
        }

        public function getAgen(Request $request)
        {            
            $agen = Agen::join('users', 'users.id', '=', 'agen.identifier')
                        ->select('agen.name', 'users.phone', 'agen.address', 'agen.photo', 'agen.rating')
                        ->where('users.store_id', $request->store_id)
                        ->orderBy('agen.rating', 'desc')
                        ->get();

            return response()->json(['data' => $agen, 'message' => ['OK']]);
        }
}

