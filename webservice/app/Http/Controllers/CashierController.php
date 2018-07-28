<?php
namespace App\Http\Controllers;


use App\Cart;
use App\CartDetail;
use App\Cash;
use App\Order;
use Carbon\Carbon;
use Validator;
use Illuminate\Http\Request;

class CashierController extends Controller {

  public function createCashier(Request $request) {
    $user_id = $request->get('user')->id;

    $cash = new Cash;
    $cash->user_id = $user_id;
    $cash->starting_cash = $request['starting_cash'];
    $cash->sales = 0;
    $cash->topup = 0;
    $cash->cash_out = 0;
    $cash->closing_cash = 0;
    $cash->save();

    return response()->json(['data' => ['cash_id' => $cash->id], 'message' => ['OK']]);
  }

  public function closingCashier(Request $request) {
    $user_id = $request->get('user')->id;

    $cash_id = $request['cash_id'];

    $sales = Order::where('user_id','=',$user_id)
                    ->where('type','=','sembako')
                    ->whereDate('updated_at', Carbon::now()->toDateString())
                    ->get();

    $topups = Order::where('user_id', '=', $user_id)
                    ->where('type', '=', 'Topup')
                    ->whereDate('updated_at', Carbon::now()->toDateString())
                    ->get();
    $salestotal = 0;
    $topupstotal = 0;

    foreach ($sales as $sale) { 
        $salestotal += $sale->total;
    }
    foreach ($topups as $topup) {
        $topupstotal += $topup->total;
    }
    $starting = Cash::where('user_id', '=', $user_id)
    ->whereDate('updated_at', Carbon::now()->toDateString())
    ->select('starting_cash')
    ->first();

    $cash = Cash::find($cash_id);
    $cash->user_id = $user_id;
    $cash->sales = $salestotal;
    $cash->topup = $topupstotal;
    $cash->closing_cash = $starting->starting_cash + $salestotal + $topupstotal;
    $cash->save();

    return response()->json(['data' => [$sales, $topups, 'message' => ['OK']]]);
  }

  public function getCash(Request $request) {
    $user_id = $request->get('user')->id;

    $cash_id = $request['cash_id'];

    $getCash = Cash::where('id','=',$cash_id)
                ->first();

    return response()->json(['data' => $getCash, 'message' => ['OK']]);
  }
}