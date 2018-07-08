<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Order;
use App\Agen;
use App\User;
use App\WaneeHistory;

class WithdrawController extends Controller
{
    public function index(Request $request) {
          $items = WaneeHistory::where('wanee_history.user_id', '=', $request->get('user')->id)
          ->select('wanee_history.*')
          ->get();
      
      return response()->json($items, 200);
    }
}

