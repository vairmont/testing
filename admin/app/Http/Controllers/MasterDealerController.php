<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use App\City;
use App\Dealer;
use App\User;
use Hash;

class MasterDealerController extends Controller
{
    public function create(Request $request)
    {
    	$dealers = Dealer::select('dealer.*', 'users.email', 'users.status', 'users.role_id', 'city.name as city_name')
    	->join('users','dealer.identifier','=','users.id')
    	->join('role', 'users.role_id', '=', 'role.id')
    	->join('city', 'dealer.city_id', '=', 'city.id')
    	->orderBy('dealer.name','asc');

    	if(isset($request->keyword) && $request->keyword != "") {
    		$dealers = $dealers->where('dealer.name','like','%'.$request->keyword.'%')
    		->orWhere('dealer.store_name','like', '%'.$request->keyword.'%');
    	}

    	$dealers = $dealers->paginate(20);

    	$cities = City::orderBy('name','asc')->get();

        return view('masterDealer.create', compact('request','dealers','cities'))->withTitle('Master Dealer');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'shop_name' => 'required',
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
            'confirmation_password' => 'required|same:password',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required'
        ]);

        $api_key = 'key-'.uniqid();
        $role = Role::where('name','Master Dealer')->first();

        $user['role_id'] = $role->id;
        $user['email'] = $request->email;
        $user['password'] = Hash::make($request->password);
        $user['api_key'] = $api_key;
        $user['status'] = 'active';

        $createUser = User::create($user);

        $dealer['identifier'] = $createUser->id;
        $dealer['store_name'] = $request->shop_name;
        $dealer['name'] = $request->name;
        $dealer['phone'] = $request->phone;
        $dealer['city_id'] = $request->city;
        $dealer['address_1'] = "";
        $dealer['address_2'] = $request->address;
        $dealer['printer_inkjet'] = empty($request->printer_inkjet)? 0 : $request->printer_inkjet;
        $dealer['printer_laser'] = empty($request->printer_laser)? 0 : $request->printer_laser;
        $dealer['printer_label'] = empty($request->printer_label)? 0 : $request->printer_label;
        $dealer['scanner'] = empty($request->scanner)? 0 : $request->scanner;
        $dealer['mesin_jahit'] = empty($request->mesin_jahit)? 0 : $request->mesin_jahit;
        $dealer['lain_lain'] = empty($request->lain_lain)? 0 : $request->lain_lain;

        $createDealer = Dealer::create($dealer);

        return back()->withSuccess('New Dealer has been created.');
    }

    public function update(Request $request,$id)
    {
        $this->validate($request, [
            'shop_name' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required',
            'status' => 'required'
        ]);

        $user['email'] = $request->email;
        $user['status'] = $request->status;

        $updateUser = User::where('id',$id)->update($user);

        $dealer['store_name'] = $request->shop_name;
        $dealer['name'] = $request->name;
        $dealer['phone'] = $request->phone;
        $dealer['city_id'] = $request->city;
        $dealer['address_2'] = $request->address;
        $dealer['printer_inkjet'] = empty($request->printer_inkjet)? 0 : $request->printer_inkjet;
        $dealer['printer_laser'] = empty($request->printer_laser)? 0 : $request->printer_laser;
        $dealer['printer_label'] = empty($request->printer_label)? 0 : $request->printer_label;
        $dealer['scanner'] = empty($request->scanner)? 0 : $request->scanner;
        $dealer['mesin_jahit'] = empty($request->mesin_jahit)? 0 : $request->mesin_jahit;
        $dealer['lain_lain'] = empty($request->lain_lain)? 0 : $request->lain_lain;

        $updateDealer = Dealer::where('identifier',$id)->update($dealer);

        return back()->withSuccess('Dealer data has been updated.');
    }

    public function delete($id)
    {
        if(!empty($id)) {
            $deleteDealer = Dealer::where('identifier',$id)->delete();
            $deleteUser = User::where('id',$id)->delete();

            return back()->withSuccess('Master Dealer Data has been deleted.');
        }
    }
}
