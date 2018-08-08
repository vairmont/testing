<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\BannerPromo;
use DB;

class PromoController extends Controller
{

    public function index(Request $request)
    {
        $promo = BannerPromo::orderBy('id','asc')->select('name', 'photo', 'description', 'period', 'terms')->get();
        
        return response()->json(['data' => $promo, 'message' => ['OK']]);
    }

}

