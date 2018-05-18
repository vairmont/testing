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
    $user_id = $request->get('user')->id)->first();

    $cash = new Cash;
    $cash->user_id = $user_id;
    $cash->starting_cash = $request['starting_cash'];
    $cash->sales = 0;
    $cash->cash_out = 0;
    $cash->closing_cash = 0;
    $cash->save();

    return response()->json(['data' => [ 'cash_id' => $cash->id], 'message' => ['OK']]);
  }

  public function closingCashier(Request $request) {
    $user_id = $request->get('user')->id)->first();

    $cash_id = $request['cash_id'];

    $sales = Order::where('user_id','=',$user_id)
                    ->where('status','=','7')
                    ->whereDate('order.updated_at', Carbon::now()->toDateString())
                    ->get();

    $salestotal = 0;

    foreach ($sales as $sale) {
        $salestotal += $sale->total;
    }

    $cash = Cash::find($cash_id);
    $cash->user_id = $user_id;
    $cash->sales = $salestotal;
    $cash->cash_out = $request['cash_out'];
    $cash->closing_cash = ($cash->starting_cash + $salestotal)-$cash_out;
    $cash->update();

    return response()->json(['data' => [], 'message' => ['OK']]);
  }

  public function getCash(Request $request) {

    $user_id = $request->get('user')->id)->first();

    $getCash = Cash::where('user_id','=',$user_id)
                ->whereDate('cash.created_at', Carbon::now()->toDateString())
                ->get();

    $result[] = [
      'starting_cash' => $getCash->starting_cash,
      'sales' => $getCash->sales,
      'closing_cash' => $getCash->closing_cash,
      'cash_out' => $getCash->cash_out
    ];
    return response()->json($result, 200);
  }
}