<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Order;
use App\User;
use App\Store;

class RankingController extends Controller
{
    public function index(Request $request) {

          $store = User::Join('order', 'order.agen_id', '=', 'users.id')
          		   ->join('agen', 'agen.identifier', '=', 'users.id')
          		   ->join('store', 'store.id', '=', 'users.store_id')
          		   ->where('order.status', '7')
          		   ->select(DB::raw('SUM(total) as total_sales'), 'agen.name', 'store.store_name', 'agen.photo')
          		   ->groupBy('agen.name','store.store_name','agen.photo')
		           ->orderBy('total_sales', 'desc')
		           ->get();

      return response()->json($store, 200);
    }
}

