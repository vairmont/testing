<?php

namespace App\Http\Controllers;

use App\Commission;
use App\Constant\OrderStatus;
use Illuminate\Http\Request;
use Validator;
use DB;
use Carbon\Carbon;
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
use App\FCM;

class OrderControllerCustomer extends Controller
{

    private $marginRate = .05;
    private $pph = .02;

    public function orderProcess(Request $request) {

      $orders = Order::join('customer','customer.identifier','=','order.user_id')
      ->join('order_billing_detail','order_billing_detail.order_id','=','order.id')
      ->where('user_id', '=', $request->get('user')->id)
      ->whereIn('status',[1,2,6])
      ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes')
      ->orderBy('created_at', 'asc')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','product.price_for_customer','product.price_for_agen','product.img_url')
          ->get();

        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->created_at)->format('d M Y H:i')
        ];
      }
      

      return response()->json($result, 200);
    }

    public function orderDone(Request $request) {

      $orders = Order::join('order_billing_detail', 'order_billing_detail.order_id', '=', 'order.id')
      ->join('agen', 'agen.identifier', '=', 'order.agen_id')
      ->where('order.user_id', '=', $request->get('user')->id)
      ->where('status', '=', 7)
      ->select('order.*','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','product.price_for_customer','product.price_for_agen','product.img_url')
          ->get();


        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->created_at)->format('d M Y H:i')
        ];
      }

      return response()->json($result, 200);
    }

    public function orderCancel(Request $request) {

      $orders = Order::join('order_billing_detail', 'order_billing_detail.order_id', '=', 'order.id')
      ->join('order_cancel', 'order_cancel.order_id', '=', 'order.id')
      ->where('user_id', '=', $request->get('user')->id)
      ->where('status', '=', 8)
      ->select('order.*','order_billing_detail.*', 'order_cancel.reason')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','product.price_for_customer','product.price_for_agen','product.img_url')
          ->get();


        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->created_at)->format('d M Y H:i')
        ];
      }

      return response()->json($result, 200);
    }

    public function create(Request $request) {
     
            $latFrom = deg2rad(-6.243009);
            $lonFrom = deg2rad(106.629822);
            $earthRadius = 6371; // in km

            $latTo = deg2rad($request->lat);
            $lonTo = deg2rad($request->long);

            $latDelta = $latTo - $latFrom;
            $lonDelta = $lonTo - $lonFrom;

            $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) + cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

            // 1.6 for convert in miles to km
            // x2 for set exact distance
            $distance = (float)(($angle * $earthRadius) * 2);

            if($distance <= 10) {

      $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

      $agencust = Customer::join('agen','customer.agen_id','=','agen.id')
      ->where('customer.identifier','=',$request->get('user')->id)
      ->select('agen.identifier')
      ->first();

      if ($cart->total == 0) {
        return response()->json(['message' => 'Keranjang anda kosong.'], 400);
      }

      #ROLE AGEN / CUST

      $cartDetails = CartDetail::where('cart_id', '=', $cart->id)->get();

      // //get last record
      // $record = Order::latest()->first();
      // $expNum = explode('-', $record->invoice_no);

      // //check first day in a year
      // if ( date('l',strtotime(date('Y-01-01'))) ){
      //     $nextInvoiceNumber = date('Y').'-0001';
      // } else {
      //     //increase 1 with last invoice number
      //     $nextInvoiceNumber = $expNum[0].'-'. $expNum[1]+1;
      // }

      $order = new Order;
      $order->invoice_no = uniqid();
      $order->user_id = $cart->user_id;

      $order->subtotal = $cart->subtotal;
      $order->tax = $cart->tax;
      $order->discount = 0;
      if($cart->total < 50000) {
        $order->total = $cart->total + 5000;
      }
      else {
        $order->total = $cart->total;
      }
      $order->status = OrderStatus::CREATED;
      $order->agen_id = $agencust->identifier;
      $order->save();

      $items = [];
      foreach ($cartDetails as $cartDetail) {
        $product = Product::whereId($cartDetail->product_id)->first();
        $orderDetail = new OrderDetail;
        $orderDetail->order_id = $order->id;
        $orderDetail->product_id = $product->id;
        $orderDetail->category_id = $product->category_id;
        $orderDetail->qty = $cartDetail->qty;
        $orderDetail->price_for_customer = $product->price_for_customer;
        $orderDetail->price_for_agen = $product->price_for_agen;
        $orderDetail->save();

        $items[] = [
          'product_id' => $product->id,
          'sku' => $product->sku,
          'category_id' => $orderDetail->category_id,
          'qty' => $orderDetail->qty,
          'price_for_customer' => $orderDetail->price_for_customer,
          'price_for_agen' => $orderDetail->price_for_agen
        ];
      }

      #Input Billing Detail
      $orderbillingdetail = new OrderBillingDetail;

      $orderbillingdetail->order_id =  $order->id;
      $orderbillingdetail->customer_name = $request['customer_name'];
      $orderbillingdetail->customer_phone = $request['customer_phone'];
      $orderbillingdetail->customer_address = "";
      $orderbillingdetail->lat = $request['lat'];
      $orderbillingdetail->long = $request['long'];
      $orderbillingdetail->customer_address2 = $request['customer_address2'];
      $orderbillingdetail->notes = $request['notes'];
      $orderbillingdetail->save();

      // clear cart
      CartDetail::where('cart_id',$cart->id)->delete();
      Cart::where('id',$cart->id)->delete();

      return response()->json(['data' => [], 'message' => ['OK']]);

      $fcm_dealer = FCM::where('user_id', $orderbillingdetail->identifier)->select('fcm_token')->get();

      #send push notif ke agen
      $this->_sendPushNotification($agencust->agen_id, "Order Baru", "Ada order baru.");

    }

    return response()->json(['message' => 'Mohon maaf lokasi pengantaran anda terlalu jauh dari store.']);
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
        define('API_ACCESS_KEY', 'AIzaSyBdH8VG8-7pX0mJ3FSVo-cthDuCtJiSobY');

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
