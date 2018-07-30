<?php
namespace App\Http\Controllers;


use App\Cart;
use App\CartDetail;
use App\Cash;
use App\Order;
use App\Constant\OrderStatus;
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
    $cash->closing_cash = 0;
    $cash->save();

    return response()->json(['data' => ['cash_id' => $cash->id], 'message' => ['OK']]);
  }

  public function closingCashier(Request $request) {
    $user_id = $request->get('user')->id;

    $cash_id = $request['cash_id'];

    $sales = Order::where('user_id','=',$user_id)
                    ->where('type','=','sembako')
                    ->where('status','=','7')
                    ->whereDate('updated_at', Carbon::now()->toDateString())
                    ->get();

    $topups = Order::where('user_id', '=', $user_id)
                    ->where('type', '=', 'Topup')
                    ->where('status','=','7')
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
    
    $cash = Cash::where('id','=',$cash_id)->first();
    $cash->user_id = $user_id;
    $cash->sales = $salestotal;
    $cash->topup = $topupstotal;
    $cash->closing_cash = $cash->starting_cash + $salestotal + $topupstotal;
    $cash->save();

    return response()->json(['data' => [], 'message' => ['OK']]);
    return response()->json(['data' => [$cash], 'message' => ['OK'], 'salestotal' => [$salestotal]]);
  }
  
  public function printClosing(Request $request)
    {
      $cash = Cash::where('id','=',$request['cash_id'])->first();

      $header = "\n\n\n\n\n\n\n\n\n\n Closing Kasir\n\t--------------\n\n";

      $items = $cash->starting_cash . "\n" .
               $cash->sales . "\n" .
               $cash->topup . "\n" .
               $cash->closing_cash . "\n";

      $footer = "\n\n\n\n\n\n Terima Kasih";

      $print = $header . $items . $footer;
      return response()->json(['data' => $print],200);
    }

  public function getCash(Request $request) {
    $user_id = $request->get('user')->id;

    $cash_id = $request['cash_id'];

    $getCash = Cash::where('id','=',$cash_id)
                ->first();

                $cashdone = Order::where('user_id','=',$user_id)
                ->where('status','=','7')
                ->whereDate('updated_at', Carbon::now()->toDateString())
                ->update(['status' => 9]);           

    return response()->json(['data' => $getCash, 'message' => ['OK']]);
  }
}