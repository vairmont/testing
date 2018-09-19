<?php
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 08/04/18
 * Time: 14.04
 */

namespace App\Http\Controllers;


use App\Agen;
use App\User;
use App\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Store;

class DashboardController extends Controller {


  public function getDashboard1(Request $request) {

      $data = Order::leftjoin('users','order.agen_id','=','users.id')
                    ->join('store','store.id','=','users.store_id')
                    ->select(DB::raw('date_format(order.created_at,"%Y-%m") as period'))
                    ->groupBy('period')
                    ->get();

      $stores = Store::all();

      foreach ($data as $datas) {
        $item = [];
        foreach($stores as $store) {
          $total[$store->store_name] = Order::leftjoin('users','order.agen_id','=','users.id')
                    ->join('store','store.id','=','users.store_id')
                    ->where('store.store_name',$store->store_name)
                    ->select(DB::raw('COUNT(order.id) as total'))
                    ->where('order.created_at','like',$datas->period.'%')
                    ->first();
          
          array_push($item, [$store->store_name => $total[$store->store_name]->total]);
        }

        $query[] = [
          'period' => $datas->period,
          'store' => $item
         ];
      }

      $agen = User::join('agen','agen.identifier','=','users.id')
              ->where('users.status','=','active')
              ->count();

      $customer = User::join('customer','customer.identifier','=','users.id')
              ->where('users.status','=','active')
              ->count();

      $inactive = User::where('status','=','inactive')
              ->count();

      return response()->json([
      'data' => [
        'query' => $query,
        'agen' => $agen,
        'customer' => $customer,
        'inactive' => $inactive
      ]
    ], 200);
    
  }


}