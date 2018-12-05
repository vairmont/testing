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

    public function withdraw(Request $request)
    {
      if(empty($request->amount)) {
          return response()->json(['message' => ['Nominal tidak boleh kosong']]);
      }

      if(empty($request->password)) {
          return response()->json(['message' => ['Password tidak boleh kosong']]);
      }  

      $data = User::where('id', '=', $request->get('user')->id)->first();

      if( ! Hash::check( $request->password, $data->password  ) ){
          return response()->json(['message' => ['Password yang anda masukkan salah']]);
      }
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();
      #check saldo
        if($agen->wanee < $request->amount){
          return response()->json(['data' => [], 'message' => ['Saldo anda kurang']]);
        }

        if($request->amount < 10000){
          return response()->json(['message' => ['Penarikan minimal Rp 100.000.']]);
        }
      else{
            
            $withdraw = [
                'agen_id' =>$agen->identifier,
                'amount' => $request->amount,
                'saldo_awal' => $agen->wanee,
                'status' => 'process'
            ];
            $create = Withdraw::create($withdraw);

            return response()->json(['data' => ['withdraw_id' => $create->id], 'message' => ['OK']]);
          }
    }
}

