<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Order;
use App\Agen;
use App\User;
use App\WaneeHistory;
use App\Withdraw;

class WithdrawController extends Controller
{
    public function index(Request $request) {
          $items = WaneeHistory::where('wanee_history.user_id', '=', $request->get('user')->id)
          ->select('wanee_history.amount', 'wanee_history.saldo_akhir', 'wanee_history.reason', 'wanee_history.created_at')
          ->orderBy('created_at', 'desc')
          ->get();
      
      return response()->json($items, 200);
    }

    public function pending(Request $request) {
          $items = Withdraw::where('withdraw.agen_id', '=', $request->get('user')->id)
          ->select('withdraw.amount', 'withdraw.created_at', 'withdraw.saldo_awal')
          ->where('withdraw.status', '=', 'process')
          ->get();
      
      return response()->json($items, 200);
    }
}

