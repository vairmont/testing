<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\City;
use App\Reseller;
use App\User;
use Hash;

class ResellerController extends Controller
{
    public function create(Request $request)
    {
    	$resellers = Reseller::select('reseller.*', 'users.email', 'users.status', 'users.role_id', 'city.name as city_name', 'role.name as role_name')
    	->join('users','reseller.identifier','=','users.id')
    	->join('role', 'users.role_id', '=', 'role.id')
    	->join('city', 'reseller.city_id', '=', 'city.id')
    	->orderBy('reseller.name','asc');

    	if(isset($request->keyword) && $request->keyword != "") {
    		$resellers = $resellers->where('reseller.name','like','%'.$request->keyword.'%')
    		->orWhere('reseller.store_name','like', '%'.$request->keyword.'%');
    	}
        if(isset($request->role_type) && $request->role_type != "") {
            $resellers = $resellers->where('users.role_id','=',$request->role_type);
        }

    	$resellers = $resellers->paginate(20);

    	$cities = City::orderBy('name','asc')->get();
    	$roles = Role::orderBy('name','asc')->whereNotIn('name',['Admin','Customer','Master Dealer'])->get();

        return view('reseller.create', compact('request','resellers','cities','roles'))->withTitle('Reseller');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'shop_name' => 'required',
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
            'confirmation_password' => 'required|same:password',
            'role' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required'
        ]);

        $api_key = 'key-'.uniqid();

        $user['role_id'] = $request->role;
        $user['email'] = $request->email;
        $user['password'] = Hash::make($request->password);
        $user['api_key'] = $api_key;
        $user['status'] = 'active';

        $createUser = User::create($user);

        $reseller['identifier'] = $createUser->id;
        $reseller['store_name'] = $request->shop_name;
        $reseller['name'] = $request->name;
        $reseller['phone'] = $request->phone;
        $reseller['store_photo'] = "";
        $reseller['city_id'] = $request->city;
        $reseller['address_1'] = "";
        $reseller['address_2'] = $request->address;
        $reseller['printer_inkjet'] = empty($request->printer_inkjet)? 0 : $request->printer_inkjet;
        $reseller['printer_laser'] = empty($request->printer_laser)? 0 : $request->printer_laser;
        $reseller['printer_label'] = empty($request->printer_label)? 0 : $request->printer_label;
        $reseller['scanner'] = empty($request->scanner)? 0 : $request->scanner;
        $reseller['mesin_jahit'] = empty($request->mesin_jahit)? 0 : $request->mesin_jahit;
        $reseller['lain_lain'] = empty($request->lain_lain)? 0 : $request->lain_lain;

        $createReseller = Reseller::create($reseller);

        return back()->withSuccess('New Reseller has been created.');
    }

    public function update(Request $request,$id)
    {
        $this->validate($request, [
            'shop_name' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'role' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required',
            'status' => 'required'
        ]);

        $user['email'] = $request->email;
        $user['status'] = $request->status;

        $updateUser = User::where('id',$id)->update($user);

        $reseller['store_name'] = $request->shop_name;
        $reseller['name'] = $request->name;
        $reseller['phone'] = $request->phone;
        $reseller['city_id'] = $request->city;
        $reseller['address_2'] = $request->address;
        $reseller['printer_inkjet'] = empty($request->printer_inkjet)? 0 : $request->printer_inkjet;
        $reseller['printer_laser'] = empty($request->printer_laser)? 0 : $request->printer_laser;
        $reseller['printer_label'] = empty($request->printer_label)? 0 : $request->printer_label;
        $reseller['scanner'] = empty($request->scanner)? 0 : $request->scanner;
        $reseller['mesin_jahit'] = empty($request->mesin_jahit)? 0 : $request->mesin_jahit;
        $reseller['lain_lain'] = empty($request->lain_lain)? 0 : $request->lain_lain;

        $updateReseller = Reseller::where('identifier',$id)->update($reseller);

        return back()->withSuccess('Reseller data has been updated.');
    }

    public function delete($id)
    {
        if(!empty($id)) {
            $deleteReseller = Reseller::where('identifier',$id)->delete();
            $deleteUser = User::where('id',$id)->delete();

            return back()->withSuccess('Reseller Data has been deleted.');
        }
    }
}
