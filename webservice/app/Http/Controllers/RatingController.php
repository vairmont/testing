<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\User;
use App\Agen;
use App\Customer;
use App\Rating;
use App\FCM;

class RatingController extends Controller
{

    public function index(Request $request)
	{
    $products = "babi";

    return response()->json(['data' => $products, 'message' => ['OK']]);
  }

}

