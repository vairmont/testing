<?php

namespace App\Http\Controllers;

use App\Withdraw;
use App\WaneeHistory;
use App\Agen;
use Illuminate\Http\Request;
use Excel;
use Carbon\Carbon;
use PDF;
use App\Order;
use App\OrderDetail;

class JneController extends Controller
{
    public function getByJne(Request $request){

        $jne = Order::leftjoin('order_detail','order_id','=','order.id')
        ->leftjoin('product','product.id','=','order_detail.product_id')
        ->leftjoin('users','users.id','=','order.user_id')
        ->leftjoin('agen','agen.identifier','=','order.agen_id')
        ->join('customer','customer.identifier','=','order.user_id')
        ->leftjoin('address','address.id','=','order.address_id')
        ->where('order.status','=','1')
        ->select('order.airway_bill as bill','order_detail.id as oid','order.id as id','order.invoice_no as invoice','customer.name as name','address.address as address','product.product_name as proname','order_detail.qty as qty','order.total as total');
        
        $jne = $jne->orderby('order.id','asc')->get();  
        return view('jne.jne',compact('jne'))->withTitle('By jne');
        }
        public function updateStatus(Request $request,$id){
            
            $jne = Order::Join('users','users.id','=','order.user_id')
            ->join('customer','customer.identifier','=','order.user_id')
            ->Join('agen','agen.identifier','=','order.agen_id')
            ->leftJoin('address','address.id','=','order.address_id')
            ->select('order.id as id','order.invoice_no as invoice','customer.name as name','address.address as address','order.total as total','order.airway_bill as bill')
            ->where('order.invoice_no',$id)
            ->first();
        
            $itemDetail = OrderDetail::join('product','product.id','=','order_detail.product_id')
            ->where('order_detail.order_id', $jne->id)
            ->select('product.product_name','order_detail.qty')
            ->get();
            
                $pdf = PDF::loadView('pdf.invoice',compact('jne','itemDetail','barcode'));
                return view('pdf.invoice',compact('jne','itemDetail'));
                // return $pdf->download(uniqid().'_invoice.pdf');
        }
}