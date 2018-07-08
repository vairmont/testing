<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Order;

class RankingController extends Controller
{
    public function index(Request $request) {

          $items = Order::Join('agen', 'order.agen_id', '=', 'agen.identifier')
          ->where('order.status','7')
          ->select(DB::raw('SUM(total) as total_sales'), 'agen.name')
          ->groupBy('agen.name')
          ->orderBy('total_sales', 'desc')
          ->get();

      return response()->json($items, 200);
    }
}

