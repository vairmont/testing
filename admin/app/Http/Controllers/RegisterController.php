<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Reseller;
use Validator;
use Hash;
use App\Customer;

class RegisterController extends Controller
{
	public function addReseller(Request $request)
	{
		 $val = Validator::make($request->all(), [
			'store_name' => 'required',
			'name' => 'required',
			'phone' => 'required|unique:reseller,phone',
			'city_id' => 'required',
			'address_1' => 'required',
			'address_2' => 'required',
			'email' => 'required|unique:users,email',
			'password' => 'required|min:6',
			'confirm_password' => 'required|same:password'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
		}
		else {
		
			$user = [
				'email' => $request->email,
				'password' => Hash::make($request->password),
				'api_key' => 'key-'.uniqid(),
				'role_id' => 4,
				'status' => 'inactive'
			];
			$save = User::create($user);

	    	$reseller = [
				'identifier' =>$save->id,
				'store_name' => $request->store_name,
				'name' => $request->name,
				'phone' => $request->phone,
				'store_photo' => "",
				'city_id' => $request->city_id,
				'address_1' => $request->address_1,
				'address_2' => $request->address_2,
				'printer_inkjet' => empty($request->printer_inkjet)? 0 : $request->printer_inkjet,
				'printer_laser' => empty($request->printer_laser)? 0 : $request->printer_laser,
				'printer_label' => empty($request->printer_label)? 0 : $request->printer_label,
				'scanner' => empty($request->scanner)? 0 : $request->scanner,
				'mesin_jahit' => empty($request->mesin_jahit)? 0 : $request->mesin_jahit,
				'lain_lain' => empty($request->lain_lain)? 0 : $request->lain_lain,
				'lat'=> $request->lat,
				'lng' => $request ->lng
			];
			Reseller::create($reseller);

			return response()->json(['data' => ['registration_id' => $save->id], 'message' => ['OK']]);
		}
	}

	public function uploadStorePhoto(Request $request)
	{
		// upload image
		// will store in storage/app/image
		$path = $request->file('photo')->store('image');

		Reseller::where('identifier', $request->header('registration_id'))
		->update([
			'store_photo' => "storage/app/".$path
		]);

		return response()->json(['data' => [], 'message' => ['OK']]);
	}
	
	public function addCustomer(Request $request)
	{
		 $val = Validator::make($request->all(), [
			'name' => 'required',
			'phone' => 'required|unique:customer,phone',
			'city_id' => 'required',
			'address_1' => 'required',
			'address_2' => 'required',
			'email' => 'required|unique:users,email',
			'password' => 'required|min:6',
			'confirm_password' => 'required|same:password'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
		}
		else {
		
			$user =[
				'email' => $request->email,
				'password' => Hash::make($request->password),
				'api_key' => 'key-'.uniqid(),
				'role_id' => 2,
				'status' => 'inactive'
			];
			$save = User::create($user);

	    	$customer =[
				'identifier' =>$save->id,
				'name' => $request->name,
				'phone' => $request->phone,
				'city_id' => $request->city_id,
				'address_1' => $request->address_1,
				'address_2' => $request->address_2,
				'lat'=> $request->lat,
				'lng' => $request ->lng
			];
			Customer::create($customer);

			return response()->json(['data' => ['registration_id' => $save->id], 'message' => ['OK']]);
		}
	}
}