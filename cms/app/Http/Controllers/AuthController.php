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
				$data = User::join('role','users.role_id','=','role.id')
			    			->join('admin', 'users.id', '=', 'admin.identifier')
			    			->select('users.id as user_id', 'users.role_id', 'users.api_token', 'role.name as role', 'admin.name','users.store_id', 'users.phone')
			    			->where('users.id',Auth::user()->id)
			    			->first();

                            session()->put('role',$data->role);
                            session()->put('name',$data->name);
                            return redirect ('dashboard');
        }
        else {
            return back()->withErrors('Phone and Password did not match.');
        }
        
    }
    public function doLogout()
    {
        session()->flush();
        Auth::logout(); // log the user out of our application
        return redirect('/'); // redirect the user to the login screen
    }

}

