<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\City;
use App\User;

class CustomerController extends Controller
{
    public function create(Request $request)
    {
    	$customers = Customer::join('city','city.id','=','customer.city_id')
    	->join('users','users.id','=','customer.identifier')
    	->orderBy('customer.name','asc')
    	->select('customer.*', 'city.name as city_name', 'users.email', 'users.status');

    	if(isset($request->keyword) && $request->keyword != "") {
    		$customers = $customers->where('customer.name','like','%'.$request->keyword.'%');
    	}

    	$customers = $customers->paginate(20);

    	$cities = City::orderBy('name','asc')->get();

        return view('customer.create', compact('customers', 'request', 'cities'))->withTitle('Customer');
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required',
            'status' => 'required'
        ]);

        $customer['name'] = $request->name;
        $customer['phone'] = $request->phone;
        $customer['address_2'] = $request->address;
        $customer['city_id'] = $request->city;
        $updateCustomer = Customer::where('identifier',$id)->update($customer);

        $user['email'] = $request->email;
        $user['status'] = $request->status;
        $updateUser = User::where('id',$id)->update($user);

        return back()->withSuccess('Customer data has been updated.');
    }

    public function delete($id)
    {
        if(!empty($id)) {
            $deleteCustomer = Customer::where('identifier',$id)->delete();
            $deleteUser = User::where('id',$id)->delete();

            return back()->withSuccess('Customer Data has been deleted.');
        }
    }
}