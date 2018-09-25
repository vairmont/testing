<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Customer;
use App\Order;
use App\Agen;
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

	   	if($salestoday->total_sales == null){
	   		$salestoday->total_sales = 0;
	   	}


        return view('dashboard',compact('ordertoday','customertoday','agentoday','salestoday'))->withTitle('Dashboard');
    }
 
}
