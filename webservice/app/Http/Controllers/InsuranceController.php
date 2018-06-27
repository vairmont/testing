<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use Hash;
use App\User;
use App\Agen;
use App\FCM;

class InsuranceController extends Controller
{
	public function index(Request $request)
	{
		

		return response()->json(['data' => $agen, 'message' => ['OK']]);
    }
  	
}

