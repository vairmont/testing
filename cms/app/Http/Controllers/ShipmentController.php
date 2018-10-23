<?php

namespace App\Http\Controllers;

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Agen;
use App\User;
use App\Order;
use App\OrderDetail;
use App\OrderBillingDetail;
use PDF;
use Carbon\Carbon;
use App\WaneeHistory;
use App\Commission;
use App\Stores\store;
use Excel;

class ShipmentController extends Controller
{

     public function orderProcess(Request $request) {

        $orders = Order::leftJoin('agen','agen.identifier','=','order.agen_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->join('users', 'users.id', '=', 'agen.identifier')
        ->join('store', 'store.id', '=', 'users.store_id')
        ->where('order.shipment', '=', 'courier')
        ->where('order.status', '=', 1)
        ->select('order.id as id', 'order.invoice_no as invoice','order_billing_detail.customer_name as name','store.store_name as sname', 'order.total as total', 'order_billing_detail.customer_address as address')
        ->get();

        foreach($orders as $order) {
            $barangs[$order->id] = OrderDetail::join('product','product.id','=','order_detail.product_id')
            ->where('order_detail.order_id', $order->id)
            ->select('product.product_name as pname','order_detail.qty as qty')
            ->get();
        }

      return view('shipment.shipment',compact('orders','barangs'))->withTitle('Shipment');
    }

    public function orderDeliver(Request $request) {

        $orders = Order::leftJoin('agen','agen.identifier','=','order.agen_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->join('users', 'users.id', '=', 'agen.identifier')
        ->join('store', 'store.id', '=', 'users.store_id')
        ->where('order.shipment', '=', 'courier')
        ->where('order.status', '=', 6)
        ->select('order.id as id', 'order.invoice_no as invoice','order_billing_detail.customer_name as name','store.store_name as sname', 'order.total as total', 'order_billing_detail.customer_address as address')
        ->get();

        foreach($orders as $order) {
          $barangs[$order->id] = OrderDetail::join('product','product.id','=','order_detail.product_id')
          ->where('order_detail.order_id', $order->id)
          ->select('product.product_name as pname','order_detail.qty as qty')
          ->get();
        }

      return view('shipment.delivery',compact('orders','barangs'))->withTitle('Delivery Order');
    }

    public function orderFinished(Request $request) {

        $orders = Order::leftJoin('agen','agen.identifier','=','order.agen_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->join('users', 'users.id', '=', 'agen.identifier')
        ->join('store', 'store.id', '=', 'users.store_id')
        ->where('order.shipment', '=', 'courier')
        ->where('order.status', '=', 7)
        ->select('order.id as id', 'order.invoice_no as invoice','order_billing_detail.customer_name as name','store.store_name as sname', 'order.total as total', 'order_billing_detail.customer_address as address')
        ->get();

        foreach($orders as $order) {
          $barangs[$order->id] = OrderDetail::join('product','product.id','=','order_detail.product_id')
          ->where('order_detail.order_id', $order->id)
          ->select('product.product_name as pname','order_detail.qty as qty')
          ->get();
        }

      return view('shipment.done',compact('orders','barangs'))->withTitle('Finished Order');
    }

    public function deliverOrder(Request $request) {

      $ord = Order::whereId($request['id'])->update([
          'status' => 6
        ]);

      return back();
      }

    public function finalizeOrder(Request $request) {
      // $orders = Order::leftJoin('agen','agen.identifier','=','order.agen_id')
      //   ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
      //   ->join()
      //   ->join('users', 'users.id', '=', 'agen.identifier')
      //   ->join('store', 'store.id', '=', 'users.store_id')
      //   ->where('order.shipment', '=', 'courier')
      //   ->where('order.status', '=', 6)
      //   ->select('order.id as id', 'order.invoice_no as invoice','order_billing_detail.customer_name as name','store.store_name as sname', 'order.total as total', 'order_billing_detail.customer_address as address')
      //   ->get();

      $ord = Order::whereId($request['id'])->update([
          'status' => 7
        ]);

      return back();
    }

    public function invoice(Request $request, $id) {

      $orders = Order::leftJoin('agen','agen.identifier','=','order.agen_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->join('order_detail', 'order_detail.order_id', '=', 'order.id')
        ->join('users', 'users.id', '=', 'agen.identifier')
        ->join('store', 'store.id', '=', 'users.store_id')
        ->where('order.shipment', '=', 'courier')
        ->where('order.id', '=', $id)
        ->where('order.status', '=', 1)
        ->select('order.id as id', 'order.invoice_no as invoice','order_billing_detail.customer_name as name','store.store_name as sname', 'order.total as total', 'order_billing_detail.customer_address as address', 'order_detail.qty as qty', 'order_detail.price_for_agen as price')
        ->get();

        foreach($orders as $order) {
          $barangs[$order->id] = OrderDetail::join('product','product.id','=','order_detail.product_id')
          ->where('order_detail.order_id', $order->id)
          ->select('product.product_name as pname','order_detail.qty as qty')
          ->get();
        }

        $pdf = PDF::loadView('pdf.shipmentinvoice',compact('orders', 'barangs'));
        return $pdf->download('shipmentinvoice.pdf');
      }    

    public function deleteOrder(Request $request,$id) {
      $billing = OrderBillingDetail::where('order_id', '=', $id)
                 ->delete();
                 
      $detail = OrderDetail::where('order_id', '=', $id)
                ->delete();

      $order = Order::whereId($id)
             ->delete();

      return back();
      }

}