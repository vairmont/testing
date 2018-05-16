<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use App\Customer
use App\FCM;

class FamilyController extends Controller
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

        $val = Validator::make($request->all(), [
            'phone' => 'unique:customer,phone'

        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
    
		else{
			$customre = [
				'identifier' =>$save->id,
				'name' => $request->name,
				'phone' => $request->phone,
				'address' => $request->address,
				'email' => $request->password,
				'gender' => $request->gender
            	];
            $create = Customer::create($customer);

            return response()->json(['customer_id' => $create->id, 'message' => ['OK']]);
    		}
    }		
}

