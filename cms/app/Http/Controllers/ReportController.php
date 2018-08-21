<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Order;
use App\User;
use App\Customer;
use App\Commission;
use DB;

class ReportController extends Controller
{
    public function getByItem(){



        return view('report.byitem')->withTitle('By item');   
    }
    public function getByStore(){



        return view('report.bystore')->withTitle('By store');   
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
