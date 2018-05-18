<?php

namespace App\Http\Controllers;

use App\Commission;
use App\Constant\OrderStatus;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderDetail;
use App\OrderCancel;
use App\Product;
use App\Family;
use App\User;
use App\Agen;
use App\Cart;
use App\CartDetail;

class OrderController extends Controller
{
    /*
    -Get Order (untuk agen)
    -Add Order (customer)
    -Add Order (agen)
    -Cancel Order (customer)
    -Cancel Order (agen)
    */

    private $marginRate = .05;
    private $pph = .02;

    public function orderPending(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::where('agen_id', '=', $agen->id)->get();
        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::where('agen_id','=', $parent->parent_id)->get();
        $relation = $parent->relation;
      }

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->where('status','=','1')
          ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
          ->get();


        $result[] = [
          'relation' => $relation,
          'order_id' => $order->id,
          'invoice_no' => $order->invoice_no,
          'subtotal' => $order->subtotal,
          'tax' => $order->tax,
          'discount' => $order->discount,
          'items' => $items
        ];
      }

      return response()->json($result, 200);
    }

        public function orderProcess(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::where('agen_id', '=', $agen->id)->get();
        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::where('agen_id','=', $parent->parent_id)->get();
        $relation = $parent->relation;
      }

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->where('status','=','2')
          ->orWhere('status','=','6')
          ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
          ->get();


        $result[] = [
          'relation' => $relation,
          'order_id' => $order->id,
          'invoice_no' => $order->invoice_no,
          'subtotal' => $order->subtotal,
          'tax' => $order->tax,
          'discount' => $order->discount,
          'items' => $items
        ];
      }

      return response()->json($result, 200);
    }

    public function orderDone(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::where('agen_id', '=', $agen->id)->get();
        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::where('agen_id','=', $parent->parent_id)->get();
        $relation = $parent->relation;
      }

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->where('status','=','7')
          ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
          ->get();


        $result[] = [
          'relation' => $relation,
          'order_id' => $order->id,
          'invoice_no' => $order->invoice_no,
          'subtotal' => $order->subtotal,
          'tax' => $order->tax,
          'discount' => $order->discount,
          'items' => $items
        ];
      }

      return response()->json($result, 200);
    }

    public function orderCancel(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::where('agen_id', '=', $agen->id)->get();
        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::where('agen_id','=', $parent->parent_id)->get();
        $relation = $parent->relation;
      }

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->where('status','=','8')
          ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
          ->get();


        $result[] = [
          'relation' => $relation,
          'order_id' => $order->id,
          'invoice_no' => $order->invoice_no,
          'subtotal' => $order->subtotal,
          'tax' => $order->tax,
          'discount' => $order->discount,
          'items' => $items
        ];
      }

      return response()->json($result, 200);
    }

    public function assignOrderAgent(Request $request) {
      $validator = Validator::make($request->all(), [
        'order_id' => 'required|numeric|exists:order,id',
        'agen_id' => 'required|numeric|exists:agen,id'
      ]);

      if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()->all()]);
      }

      $cancelOrder = OrderCancel::where('order_id', '=', $request['order_id'])
        ->where('agen_id', '=', $request['agen_id'])
        ->first();
      if ($cancelOrder) {
        return response()->json(['error' => 'Selected agent has already rejected this order.'], 400);
      }

      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::ASSIGNED;
      $order->agen_id = $request['agen_id'];
      $order->save();

      $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
        ->where('order_id', '=', $order->id)
        ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
        ->get();

      $result[] = [
        'order_id' => $order->id,
        'invoice_no' => $order->invoice_no,
        'subtotal' => $order->subtotal,
        'tax' => $order->tax,
        'discount' => $order->discount,
        'items' => $items
      ];

      $agent = Agen::whereId($request['agen_id'])->first();

      return response()->json([
        'order' => $result,
        'agen' => $agent
      ]);
    }

    public function cancelOrder(Request $request) {

      $validator = Validator::make($request->all(), [
        'order_id' => 'required|numeric|exists:order,id',
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ], 400);
      }

      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::CANCELLED;
      $order->save();

      return response()->json(['message' => 'Order '.$order->id .' has been succesfully cancelled'], 200);
    }

    public function cancelOrderAgent(Request $request) {
      $validator = Validator::make($request->all(),[
        'order_id' => 'required|numeric|exists:order,id',
        'reason' => 'required'
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ]);
      }

      $order = Order::whereId($request['order_id'])
        ->first();
      $order->status = OrderStatus::REASSIGN;
      $order->save();

      $orderCancel = new OrderCancel;
      $orderCancel->order_id = $order->id;
      $orderCancel->cancel_by = $request->get('user')->id;
      $orderCancel->agen_id = $order->agen_id;
      $orderCancel->reason = $request['reason'];
      $orderCancel->save();

      return response()->json(['message' => 'Order status has been updated.'], 200);
    }

    public function deliveryOrder(Request $request) {

      $validator = Validator::make($request->all(),[
        'order_id' => 'required|numeric|exists:order,id'
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ]);
      }

      #change order status
      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::DELIVERY;
      $order->save();

      return response()->json(['message' => 'Order has been on delivery.'], 201);

    }

    public function finalizeOrder(Request $request) {

      $validator = Validator::make($request->all(),[
        'order_id' => 'required|numeric|exists:order,id'
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ]);
      }

      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::COMPLETED;
      $order->save();

      $incentiveDetails = OrderDetail::Join('incentive_category', 'order_detail.category_id', '=', 'incentive_category.id')
                    ->where('order_id', '=', $order->id)
                    ->select('base_price', 'incentive_category.rate')
                    ->get();

      $incentive = 0;
      $margin = 0;

      foreach ($incentiveDetails as $detail) {
        $incentive += $detail->base_price * $detail->rate;
        $margin += $detail->base_price * $this->marginRate;
      }
      $commission_pph = ($incentive + $margin) * $this->pph;
      $commission_netto = ($incentive + $margin) - $commission_pph;

      $commission = new Commission;
      $commission->order_id = $order->id;
      $commission->agen_id = $order->agen_id;
      $commission->commission_pph = $commission_pph;
      $commission->commission_netto = $commission_netto;
      $commission->incentive = $incentive;
      $commission->margin_penjualan = $margin;
      $commission->save();

      return response()->json(['message' => 'Order has been completed.'], 201);

    }

}
