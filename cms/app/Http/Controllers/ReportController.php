<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Order;
use App\User;
use App\Customer;
use App\Commission;
use App\OrderDetail;
use App\Product;

use DB;

class ReportController extends Controller
{
    public function getByItem(){
        $totalsales = Order::join('order_detail','order.id','=','order_detail.order_id')
        ->join('product','product.id','=','order_detail.product_id')
        ->join('users','users.id','=','order.user_id')
        ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id')
        ->get();
        
        return view('report.byitem',compact('totalsales'))->withTitle('By withdraw');
        
    }
    public function getByStore(){
        $flowreport = Order::join('order_detail','order.id','=','order_detail.order_id')
        ->join('product','product.id','=','order_detail.product_id')
        ->join('incentive_category','incentive_category.id','=','product.category_id')
        ->join('agen','agen.id','=','order.agen_id')
        ->select('order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order.id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price')
        ->orderBy('order.id','asc')
        ->get();

        
        // $total = DB::table('product')
        //    ->Join('order_detail', 'product.id', '=', 'order_detail.product_id')
        //    ->sum(DB::raw('product.price_for_agen * order_detail.qty'));
        
           
           
        return view('report.bystore',compact('flowreport','total'))->withTitle('By store'); 
    }
    public function getByCategory(){


        return view('report.bycategory')->withTitle('By Category');   
    }
    public function getByEmployee(){
        $byagen = User::Join('order', 'order.agen_id', '=', 'users.id')
                   ->join('agen', 'agen.identifier', '=', 'users.id')
                   ->join('store', 'store.id', '=', 'users.store_id')
                   ->where('order.status', '7')
                   ->select(DB::raw('SUM(total) as total_sales , COUNT(order.id) as total_order'), 'agen.name', 'store.store_name', 'agen.photo','order.agen_id') 
                   ->groupBy('agen.name','store.store_name','agen.photo','order.agen_id')
                   ->orderBy('total_sales', 'desc')
                   ->get();

        foreach ($byagen as $agen) {
                    $customer = Customer::where('agen_id','=',$agen->agen_id)
                    ->count();
                    $temp[$agen->agen_id] = $customer;
        }

        foreach ($byagen as $agen) {
                    $commission = Commission::where('agen_id','=',$agen->agen_id)
                    ->sum('commission_netto');
                    $coms[$agen->agen_id] = $commission;
        }

        return view('report.byemployee',compact('byagen','temp','coms'))->withTitle('by employee');
    }
    public function getByChasier(){


        return view('report.bychasier')->withTitle('by Chasier');
    }
}
