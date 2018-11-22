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
			$customer = Customer::leftJoin('agen', 'agen.id', '=', 'customer.agen_id')
                        ->join('users', 'users.id', '=', 'customer.identifier')
                        ->select('customer.*', 'agen.name as agen', 'agen.photo as foto_agen', 'agen.rating as rating', 'users.phone as phone')
						->where('customer.identifier', "=", $request->get('user')->id)
                        ->first();

            $ag = Agen::leftJoin('customer', 'customer.agen_id', '=', 'agen.id')
                        ->where('agen.id','=', $customer->agen_id)
                        ->select('agen.identifier')
                        ->first();

            if($customer->agen_id != 0){
                $agen = User::select('users.phone as agen_phone')
                        ->where('users.id', '=', $ag->identifier)
                        ->first();
            }
            else {
                $agen = [
                    'agen_phone' => ''                    
                ];
            }

            return response()->json(['data' => $customer, 'agen' => $agen, 'message' => ['OK']]);
    }
    
    public function addCustomer (Request $request)
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

        if(empty($request->agen_id)) {
            return response()->json(['data' => [], 'message' => ['Agen harus dipilih']]);
        }   

        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Alamat wajib diisi']]);
        }

        if(empty($request->lat)) {
            return response()->json(['data' => [], 'message' => ['Alamat Map wajib dicari']]);
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
                'password' => Hash::make('123456'),
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
                'long' => $request->long,
                'gender' => $request->gender
                ];
            $create = Customer::create($customer);

            return response()->json(['customer_id' => $create->id, 'message' => ['OK']]);
            }
        }

	public function addCustomer2 (Request $request)
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

        $val = Validator::make($request->all(), [
            'phone' => 'unique:users,phone'

        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
    
		else{
			$user =[
				'phone' => $request->phone,
				'password' => '',
				'api_token' => uniqid(),
				'role_id' => 2,
				'store_id' => 0,
				'status' => 'inactive'
			];
			$save = User::create($user);

			$customer = [
				'identifier' =>$save->id,
				'agen_id' => 0,
				'name' => $request->name,
				'address' => '',
                'lat' => '',
                'long' => '',
				'gender' => $request->gender
            	];
            $create = Customer::create($customer);

            return response()->json(['customer_id' => $create->id, 'message' => ['OK']]);
    		}
        }

    public function checkData(Request $request){
        $check = Customer::where('identifier', $request->user_id)->first();

        if($check->agen_id == 0){
            return response()->json(['data' => [], 'message' => ['Lengkapi data anda untuk dapat berbelanja.']]);
        }
        else{
            return response()->json(['message' => ['OK']]);
        }
    }

    public function updateCustomer (Request $request)
    {
        if(empty($request->agen_id)) {
            return response()->json(['data' => [], 'message' => ['Agen harus dipilih']]);
        }   

        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Alamat wajib diisi']]);
        }

        if(empty($request->lat)) {
            return response()->json(['data' => [], 'message' => ['Alamat Map wajib dicari']]);
        }
    
        else{
            User::where('id', $request->get('user')->id)

            ->update([
                'store_id' => $request->store_id
            ]);
            Customer::where('identifier', $request->get('user')->id)
            ->update([
                'agen_id' => $request->agen_id,
                'address' => $request->address,
                'lat' => $request->lat,
                'long' => $request->long
                ]);

            return response()->json(['data' => [], 'message' => ['OK']]);
            }
        }

        public function uploadPhotoCustomer(Request $request)
    {
        // upload photos will store in storage/app/photos
        if(empty($request->photo)) {
            return response()->json(['data' => [], 'message' => ['Foto tidak boleh kosong']]);
        }
        else {

            $path = $request->file('photo')->store('photo_customer');

            Customer::where('id', $request->header('customerid'))
            ->update([
                'photo' => "storage/app/".$path
            ]);

            return response()->json(['data' => [], 'message' => ['OK']]);
        }
    }

        public function getStore(Request $request)
        {
            $latFrom = deg2rad($request->lat);
            $lonFrom = deg2rad($request->long);
            $earthRadius = 6371; // in km

            $stores = Store::get();
            
            $listStores = [];
            foreach($stores as $store) {
                // LatLng TOKO
                $latTo = deg2rad($store->lat);
                $lonTo = deg2rad($store->long);

                $latDelta = $latTo - $latFrom;
                $lonDelta = $lonTo - $lonFrom;

                $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) + cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

                // 1.6 for convert in miles to km
                // x2 for set exact distance
                $distance = (float)(($angle * $earthRadius) * 2);

                // jika radius < 10km masuk ke list toko
                if($store->store_name == 'GrosirOne Cikupamas') {
                    if($distance <= 25) {
                        array_push($listStores, [
                            'id' => $store->id,
                            'store_name' => $store->store_name,
                            'address' => $store->address 
                        ]);
                    }
                }
                else {
                    if($distance <= 15) {
                        array_push($listStores, [
                            'id' => $store->id,
                            'store_name' => $store->store_name,
                            'address' => $store->address 
                        ]);
                    }
                }
            }
            return response()->json(['data' => $listStores, 'message' => ['OK']]);
        }

        public function getAgen(Request $request)
        {            
            $agen = Agen::join('users', 'users.id', '=', 'agen.identifier')
                        ->select('agen.name', 'users.phone', 'agen.address', 'agen.photo', 'agen.rating', 'agen.id')
                        ->where('users.store_id', $request->store_id);

            if(isset($request->name) && !empty($request->name)) {
                $agen = $agen->where('agen.name','like',$request->name."%");
            }   

            $agen = $agen->orderBy('agen.rating','desc')->get();            

            return response()->json(['data' => $agen, 'message' => ['OK']]);
        }

       public function addCustomerNew (Request $request)
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

        $val = Validator::make($request->all(), [
            'phone' => 'unique:users,phone'

        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
    
        else{
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
                'password' => '',
                'api_token' => uniqid(),
                'role_id' => 2,
                'store_id' => 0,
                'status' => 'inactive'
            ];
            $save = User::create($user);

            $customer = [
                'identifier' =>$save->id,
                'agen_id' => 0,
                'name' => $request->name,
                'address' => '',
                'no_va' => $nova['nova'],
                'terminal_id' => $res['keterangan'],
                'gender' => $request->gender
                ];
            $create = Customer::create($customer);

            return response()->json(['customer_id' => $create->id, 'message' => ['OK']]);
            }
        } 

}

