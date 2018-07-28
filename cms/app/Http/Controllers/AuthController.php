<?php

namespace App\Http\Controllers;
use Illuminate\Foundation\Auth\User;
use Illuminate\Notifications\Notifiable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class AuthController extends Controller
{
    public function getLogin() {
        return view('login');   
    }
    public function doLogin(Request $request) {

        $this->validate($request, [
            'phone' => 'required',
            'password' => 'required'
        ]);
    
        $credentials = [
            'phone' => $request->phone,
            'password' => $request->password
        ];
      
        if(Auth::attempt($credentials)) {
            if(Auth::user()->role_id == 1){

				$data = User::join('role','users.role_id','=','role.id')
			    			->join('agen', 'users.id', '=', 'agen.identifier')
			    			->select('users.id as user_id', 'users.role_id', 'users.api_token', 'role.name as role', 'agen.name','users.store_id', 'users.phone')
			    			->where('users.id',Auth::user()->id)
			    			->first();
                            return redirect ('dashboard');
            }
            if(Auth::user()->role_id == 8){

				$data = User::join('role','users.role_id','=','role.id')
			    			->join('agen', 'users.id', '=', 'agen.identifier')
			    			->select('users.id as user_id', 'users.role_id', 'users.api_token', 'role.name as role', 'agen.name','users.store_id', 'users.phone')
			    			->where('users.id',Auth::user()->id)
			    			->first();
                            return redirect ('dashboard');
            }
            if(Auth::user()->role_id == 9){

				$data = User::join('role','users.role_id','=','role.id')
			    			->join('agen', 'users.id', '=', 'agen.identifier')
			    			->select('users.id as user_id', 'users.role_id', 'users.api_token', 'role.name as role', 'agen.name','users.store_id', 'users.phone')
			    			->where('users.id',Auth::user()->id)
			    			->first();
                            return redirect ('dashboard');
            }
        }
        else {
            return back()->withErrors('Phone and Password did not match.');
        }
        
    }

}

