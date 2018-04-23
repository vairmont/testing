<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderDetail;
use App\OrderCancel;
use App\User;
use App\Agen;
use App\FCM;

class RankingController extends Controller
{

    public function index(Request $request) {
        $items = Order::Join('agen', 'order.agen_id', '=', 'agen.id')
          ->where('order.status', 'LIKE', '%finish%')
          ->select(DB::raw('SUM(total) as total_sales'), 'agen.name')
          ->groupBy('agen.name')
          ->orderBy('total_sales', 'desc')
          ->get();

      return response()->json($items, 200);
    }

}
