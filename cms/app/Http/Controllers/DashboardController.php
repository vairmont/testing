<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Customer;
use App\Order;
use App\OrderDetail;
use App\Agen;
use App\OrderDigital;
use Carbon\Carbon;
use DB;

class DashboardController extends Controller
{
    public function getDashboard() {
    	$ordertoday = Order::whereDate('created_at', Carbon::today())->count();

      	$customertoday = Customer::whereDate('created_at', Carbon::today())->count();

	    $agentoday = Agen::whereDate('created_at', Carbon::today())->count();

	    $salestoday = Order::whereDate('created_at', Carbon::today())
	    				->select(DB::raw('SUM(total) as total_sales'))
	    				->first();

	  	$salesactive = Order::select('order.agen_id')
	  					->whereYear('order.created_at','=',Carbon::now()->format('Y'))
	  					->whereMonth('order.created_at','=',Carbon::now()->format('m'))
	  					->groupBy('order.agen_id')
	  					->get();

	  	$totalsales = count($salesactive);

	  	$package100 = OrderDetail::select('product_id')
  					->whereYear('created_at','=',Carbon::now()->format('Y'))
  					->whereMonth('created_at','=',Carbon::now()->format('m'))
  					->where('product_id','=',146)
  					->count();

  		$pulsa = OrderDigital::whereYear('created_at','=',Carbon::now()->format('Y'))
  					->whereMonth('created_at','=',Carbon::now()->format('m'))
  					->count();

  		$margin = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
		    ->join('product','product.id','=','order_detail.product_id')
		    ->join('incentive_category','incentive_category.id','=','product.incentive_id')
		    ->join('agen','agen.identifier','=','order.agen_id')
		    ->join('users','users.id','=','agen.identifier')
		    ->join('store','store.id','=','users.store_id')
		    ->whereIn('order.status',[7,9])
		    ->select('store.store_name as stoname','agen.source as source','product.cost as cost','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price');
		    $qry = $margin->get();
		    
		    $total1 = 0;
		    foreach($qry as $q) {
		        $total1 += (($q->customer_price * $q->qty * 0.95)-($q->cost * $q->qty))-(($q->customer_price * $q->qty * 0.95 * $q->rate / 100));
		    }

	   	if($salestoday->total_sales == null){
	   		$salestoday->total_sales = 0;
	   	}

        return view('dashboard',compact('ordertoday','customertoday','agentoday','salestoday','totalsales','package100','total1','pulsa'))->withTitle('Dashboard');
    }
 
}
