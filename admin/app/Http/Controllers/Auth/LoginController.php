<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\Role;
use App\Admin;

class LoginController extends Controller
{
    public function getLogin()
    {
        return view('login')->withTitle('Login');
    }

    public function doLogin(Request $request)
    {
        $this->validate($request, [
            'email' => 'required',
            'password' => 'required'
        ]);

        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
            'status' => 'active',
        ];

        if(Auth::attempt($credentials)) {

            $role = Role::where('id',Auth::user()->role_id)->first();

            if($role->name == 'Admin') {
                $admin = Admin::where('identifier',Auth::user()->id)->first();

                session()->put([
                    'user_id' => Auth::user()->id,
                    'name' => $admin->name,
                    'email' => Auth::user()->email, 
                    'role_id' => Auth::user()->role_id
                ]);

                return redirect('/dashboard');
            }
            else {
                return back()->withErrors('Email and password did not match. Please try again.');
            }
        }
        else {
            return back()->withErrors('Email and password did not match. Please try again.');
        }
    }

    public function doLogout()
    {
        session()->flush();
        return redirect('/');
    }
}
