<?php

namespace App\Http\Controllers;

use App\Commission;
use App\Constant\OrderStatus;
use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderDetail;
use App\OrderBillingDetail;
use App\OrderCancel;
use App\Product;
use App\Family;
use App\Customer;
use App\User;
use App\Agen;
use App\Cart;
use App\Chat;
use App\CartDetail;

class OrderControllerCustomer extends Controller
{

    private $marginRate = .05;
    private $pph = .02;

    public function orderPending(Request $request) {

      $orders = Order::where('user_id', '=', $request->get('user')->id)->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->where('status','=','1')
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
      }

      return response()->json($result, 200);
    }

    public function orderProcess(Request $request) {

      $orders = Order::where('user_id', '=', $request->get('user')->id)->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          // ->where('status','=','2')
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

      $orders = Order::where('user_id', '=', $request->get('user')->id)->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          // ->where('status','=','3')
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

      $orders = Order::where('user_id', '=', $request->get('user')->id)->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          // ->where('status','=','4')
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

    public function create(Request $request) {

      $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

      $agencust = Customer::where('identifier','=',$request->get('user')->id)->first();

      if ($cart->total == 0) {
        return response()->json(['message' => 'There is no item to order.'], 400);
      }

      #ROLE AGEN / CUST

      $cartDetails = CartDetail::where('cart_id', '=', $cart->id)->get();

      $order = new Order;
      $order->invoice_no = $cart->id;
      $order->user_id = $cart->user_id;

      $order->subtotal = $cart->subtotal;
      $order->tax = $cart->tax;
      $order->discount = 0;
      $order->total = $cart->total;
      $order->status = OrderStatus::CREATED;
      $order->agen_id = $agencust->agen_id;
      $order->save();
 
      $cart->subtotal = 0;
      $cart->tax = 0;
      $cart->total = 0;
      $cart->save();

      $items = [];
      foreach ($cartDetails as $cartDetail) {
        $product = Product::whereId($cartDetail->product_id)->first();
        $orderDetail = new OrderDetail;
        $orderDetail->order_id = $order->id;
        $orderDetail->product_id = $product->id;
        $orderDetail->category_id = $product->category_id;
        $orderDetail->qty = $cartDetail->qty;
        $orderDetail->base_price = $product->price_for_customer;
        $orderDetail->save();

        $items[] = [
          'product_id' => $product->id,
          'sku' => $product->sku,
          'category_id' => $orderDetail->category_id,
          'qty' => $orderDetail->qty,
          'base_price' => $orderDetail->base_price,
          'nego_price' => $orderDetail->nego_price
        ];
      }

      $cartDetail = CartDetail::where('cart_id', '=', $cart->id)->update(['qty' => 0]);

      #Input Billing Detail

      $orderbillingdetail = new OrderBillingDetail;

      $orderbillingdetail->order_id =  $order->id;
      $orderbillingdetail->customer_name = $request['customer_name'];
      $orderbillingdetail->customer_name = $request['customer_phone'];
      $orderbillingdetail->customer_name = $request['customer_province'];
      $orderbillingdetail->customer_name = $request['customer_city'];
      $orderbillingdetail->customer_name = $request['customer_disctrict'];
      $orderbillingdetail->customer_name = $request['customer_address'];
      $orderbillingdetail->save();

      #send push notif ke agen
      $this->_sendPushNotification($agencust->agen_id, "Order Baru", "Ada order baru.");

      return response(['data' => [
        'message' => 'Order created with Invoice No: '. $order->id,
        'order' => [
            'order_id' => $order->id,
            'invoice_no' => $order->invoice_no,
            'subtotal' => $order->subtotal,
            'tax' => $order->tax,
            'discount' => $order->discount,
            'total' => $order->total,
            'items' => $items
          ]
        ]
      ], 201);
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
    
    protected function _sendPushNotification($user_id, $title, $body) {
        // API access key from Google API's Console
        define('API_ACCESS_KEY', ' ');

        $registrationIds = array();

        $recipients = FCM::where('user_id',$user_id)->select('fcm_token')->get();

        foreach ($recipients as $recipient) {
            array_push($registrationIds, $recipient->fcm_token);
        }

        $msg = array
        (
            'title' => $title,
            'body' => $body,
            'vibrate' => "1",
            'sound' => 'default',
            'badge' => "1"
        );

        $fields = array
        (
            'registration_ids'  => $registrationIds,
            'notification'  => $msg,
            'priority' => 'high'
        );
         
        $headers = array
        (
            'Authorization: key=' . API_ACCESS_KEY,
            'Content-Type: application/json'
        );
         
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch,CURLOPT_POST, true);
        curl_setopt($ch,CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch,CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        curl_close($ch);
    }

   
}
