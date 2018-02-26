<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Hash;
use App\Admin;
use App\User;
use App\Role;
use DB;

class RegisterController extends Controller
{
    public function create()
    {
    	return view('register')->withTitle('Registration');
    }

    public function store(Request $request)
    {
    	$this->validate($request, [
    		'name' => 'required',
    		'phone' => 'required',
    		'department' => 'required',
    		'email' => 'required|email|unique:users,email',
    		'password' => 'required',
    		'password_confirmation' => 'required|same:password'
    	]);

        DB::beginTransaction();

    	try
    	{
            $role = Role::where('name','Admin')->first();
            $api_key = 'key-'.uniqid();

            $item['role_id'] = $role->id;
            $item['email'] = $request->email;
            $item['password'] = Hash::make($request->password);
            $item['api_key'] = $api_key;
            $item['status'] = 'active';

            $createUser = User::create($item);

            $data['identifier'] = $createUser->id;
        	$data['name'] = $request->name;
        	$data['phone'] = $request->phone;
        	$data['department'] = $request->department;

        	$createAdmin = Admin::create($data);

    	}
    	catch(\Exception $e)
    	{
    		DB::rollback();
    		throw $e;
    	}

    	DB::commit();

    	return back()->withSuccess('Account has been created.');
    }
}
