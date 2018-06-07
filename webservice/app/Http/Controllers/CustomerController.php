<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Hash;
use Auth;
use DB;
use App\User;
use App\Customer;
use App\FCM;

class CustomerController extends Controller
{
	public function getCustomer(Request $request)
	{
			$customer = Customer::select('name', 'phone', 'address', 'email', 'gender')
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

        if(empty($request->password)) {
            return response()->json(['data' => [], 'message' => ['Password baru anda tidak boleh kosong']]);
        }

        if(empty($request->gender)) {
            return response()->json(['data' => [], 'message' => ['Gender tidak boleh kosong']]);
        }

        if(empty($request->address)) {
            return response()->json(['data' => [], 'message' => ['Nomor HP tidak boleh kosong']]);
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
				'password' => Hash::make($request->password),
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
				'gender' => $request->gender
            	];
            $create = Customer::create($customer);

            return response()->json(['customer_id' => $create->id, 'message' => ['OK']]);
    		}
    }		
}

