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
use App\Address;
use App\User;
use App\Agen;
use App\Cart;
use App\Chat;
use App\Store;
use App\WaneeHistory;
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
      ->whereIn('status', [1,2,6])
      ->where('airway_bill', '!=', null)
      ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes')
      ->orderBy('created_at', 'desc')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','order_detail.price_for_customer','product.img_url')
          ->get();

        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->created_at)->format('d M Y H:i'),
          'agen_phone' => User::where('id', '=', $order->agen_id)->select('phone as agen_phone')->first()
        ];
      }
      return response()->json($result, 200);
    }

    public function orderDone(Request $request) {

      $orders = Order::join('customer','customer.identifier','=','order.user_id')
      ->join('order_billing_detail','order_billing_detail.order_id','=','order.id')
      ->where('user_id', '=', $request->get('user')->id)
      ->where('status', '=', 7)
      ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes')
      ->orderBy('created_at', 'asc')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','order_detail.price_for_customer','product.img_url')
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
      $customer = User::where('id', '=', $request->get('user')->id)->first();


      $storelocation = Store::join('users', 'users.store_id', '=', 'store.id')
                       ->select('store.lat', 'store.long', 'store.store_name')
                       ->where('store.id', '=', $customer->store_id)
                       ->first();  
                     
      $latFrom = deg2rad($storelocation->lat);
      $lonFrom = deg2rad($storelocation->long);
      $earthRadius = 6371; // in km

      $latTo = deg2rad($request->lat);
      $lonTo = deg2rad($request->long);

      $latDelta = $latFrom - $latTo;
      $lonDelta = $lonFrom - $lonTo;

      $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) + cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
      // 1.6 for convert in miles to km
      // x2 for set exact distance
      $distance = (float)(($angle * $earthRadius) * 2);

      if($storelocation->store_name == 'Cikupamas') {
        if($distance <= 25) {
          $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

    $agencust = Customer::join('agen','customer.agen_id','=','agen.id')
    ->where('customer.identifier','=',$request->get('user')->id)
    ->select('agen.identifier')
    ->first();

    if ($cart->total == 0) {
      return response()->json(['message' => 'Keranjang anda kosong.'], 400);
    }

    $cartDetails = CartDetail::where('cart_id', '=', $cart->id)->get();

    $today = date("Ymd");
    $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
    $unique = $today . $rand;

    $order = new Order;
    $order->invoice_no = $unique;
    $order->user_id = $cart->user_id;
    $order->subtotal = $cart->subtotal;
    $order->voucher_code = $request->voucher_code;
    $order->tax = $cart->tax;
    $order->discount = 0;
    if($cart->total < 50000) {
      $order->total = $cart->total + 5000;
    }
    else {

      if ($request->voucher_code != '' && $request->discount != 0) {
          $order->total = $cart->total - $request->discount;
      }

      elseif ($request->voucher_code != '' && $request->discountrate != 0) {
          $order->total = $cart->total - ($cart->total * $request->discountrate);
      }

      else{
      $order->total = $cart->total;
      }
    }
    $order->status = OrderStatus::CREATED;
    $order->agen_id = $agencust->identifier;
    $order->address_id = $request->address_id;
    $order->save();

    $items = [];
    foreach ($cartDetails as $cartDetail) {
      $product = Product::whereId($cartDetail->product_id)->first();
      $orderDetail = new OrderDetail;
      $orderDetail->order_id = $order->id;
      $orderDetail->product_id = $product->id;
      $orderDetail->category_id = $product->category_id;
      $orderDetail->qty = $cartDetail->qty;
      // if($cartDetail->qty >= 3){
      //   $orderDetail->price_for_customer = $product->price_for_customer * 0.98;
      //   $orderDetail->price_for_agen = $product->price_for_agen;
      // }
      // else{
      $orderDetail->price_for_customer = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price;
      $orderDetail->price_for_agen = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price;
      // }
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
    $add = Address::join('city', 'city.id', '=', 'address.city_id')
                ->join('region', 'region.id', '=', 'address.region_id')
                ->select('address.address as address2', 'region.name as region', 'city.name as city', 'address.zip as zip', 'region.code as code')
                ->where('address.id', '=', $request->address_id)
                ->first();

    $orderbillingdetail = new OrderBillingDetail;

    $orderbillingdetail->order_id =  $order->id;
    $orderbillingdetail->customer_name = $request['customer_name'];
    $orderbillingdetail->customer_phone = $request['customer_phone'];
    $orderbillingdetail->customer_address = "";
    $orderbillingdetail->customer_address2 = $request->customer_address2;
    $orderbillingdetail->notes = $request['notes'];
    $orderbillingdetail->save();

    // clear cart
    CartDetail::where('cart_id',$cart->id)->delete();
    Cart::where('id',$cart->id)->delete();

    #send push notif ke ag->e2
    $this->_sendPushNotification($order->agen_id, "Order Baru", "Ada order baru.");

    return response()->json(['data' => [], 'message' => ['OK']]);
        }
        else {
          // if > 25
          return response()->json(['message' => 'Mohon maaf lokasi pengantaran anda terlalu jauh dari store.']);
        }
      }
      else {
        if($distance <= 15) {
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

      $today = date("Ymd");
      $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
      $unique = $today . $rand;

      $order = new Order;
      $order->invoice_no = $unique;
      $order->user_id = $cart->user_id;
      $order->subtotal = $cart->subtotal;
      $order->voucher_code = $request->voucher_code;
      $order->tax = $cart->tax;
      $order->discount = 0;
      if($cart->total < 50000) {
        $order->total = $cart->total + 5000;
      }
      else {
        
        if ($request->voucher_code != '' && $request->discount != 0) {
            $order->total = $cart->total - $request->discount;
        }

        elseif ($request->voucher_code != '' && $request->discountrate != 0) {
            $order->total = $cart->total - ($cart->total * $request->discountrate);
        }

        else{
        $order->total = $cart->total;
        }
      }
      $order->status = OrderStatus::CREATED;
      $order->agen_id = $agencust->identifier;
      $order->address_id = $request->address_id;
      $order->save();

      $items = [];
      foreach ($cartDetails as $cartDetail) {
        $product = Product::whereId($cartDetail->product_id)->first();
        $orderDetail = new OrderDetail;
        $orderDetail->order_id = $order->id;
        $orderDetail->product_id = $product->id;
        $orderDetail->category_id = $product->category_id;
        $orderDetail->qty = $cartDetail->qty;
        // if($cartDetail->qty >= 3){
        //   $orderDetail->price_for_customer = $product->price_for_customer * 0.98;
        //   $orderDetail->price_for_agen = $product->price_for_agen;
        // }
        // else{
        $orderDetail->price_for_customer = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price;
        $orderDetail->price_for_agen = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price * 0.95;
        // }
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
    $add = Address::join('city', 'city.id', '=', 'address.city_id')
                ->join('region', 'region.id', '=', 'address.region_id')
                ->select('address.address as address2', 'region.name as region', 'city.name as city', 'address.zip as zip', 'region.code as code')
                ->where('address.id', '=', $request->address_id)
                ->first();

    $orderbillingdetail = new OrderBillingDetail;

    $orderbillingdetail->order_id =  $order->id;
    $orderbillingdetail->customer_name = $request['customer_name'];
    $orderbillingdetail->customer_phone = $request['customer_phone'];
    $orderbillingdetail->customer_address = "";
    $orderbillingdetail->customer_address2 = $request->customer_address2;
    $orderbillingdetail->notes = $request['notes'];
    $orderbillingdetail->save();


    // clear cart
    CartDetail::where('cart_id',$cart->id)->delete();
    Cart::where('id',$cart->id)->delete();

    #send push notif ke agen
    $this->_sendPushNotification($order->agen_id, "Order Baru", "Ada order baru.");

    return response()->json(['data' => [], 'message' => ['OK']]);
        }
        else {
          // if >= 10
          return response()->json(['message' => 'Mohon maaf lokasi pengantaran anda terlalu jauh dari store.']);
        }
      }
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
        define('API_ACCESS_KEY', 'AAAA6cPylp8:APA91bFB5i1sBcapzkGUd23jb8V7ojwjnoonnBlX317_IeVt-jxk5_WjSNHlhVrVn882ZcTWH4Nn5KOfr6onBetNT4PoVVn7olWyA7uSCXiy1DY7KVPEdYPgtNEkMfl8nhgvcYefNcxm');

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

    public function createNew(Request $request) {

      $data = $request->json()->all();
    $customer = User::where('id', '=', $request->get('user')->id)->first();

    $agencust = Customer::join('agen','customer.agen_id','=','agen.id')
    ->where('customer.identifier','=',$request->get('user')->id)
    ->select('agen.identifier')
    ->first();

    if ($data['total'] == 0) {
      return response()->json(['message' => 'Keranjang anda kosong.'], 400);
    }

    $today = date("Ymd");
    $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
    $unique = $today . $rand;

    $order = new Order;
    $order->invoice_no = $unique;
    $order->user_id = $request->get('user')->id;
    $order->subtotal = $data['subtotal'];
    $order->discount = $data['discount'];
    $order->total = $data['total'];
    $order->voucher_code = $data['voucher_code'];
    $order->tax = '0';
    $order->payment = '';
    $order->payment_status = 'pending';
    $order->status = OrderStatus::CREATED;
    $order->agen_id = $agencust->identifier;
    $order->address_id = $data['address_id'];
    $order->save();

    foreach ($data['items'] as $items) {
      $product = Product::whereId($items['product_id'])->first();
      $orderDetail = new OrderDetail;
      $orderDetail->order_id = $order->id;
      $orderDetail->product_id = $product->id;
      $orderDetail->category_id = $product->category_id;
      $orderDetail->qty = $items['qty'];
      // if($cartDetail->qty >= 3){
      //   $orderDetail->price_for_customer = $product->price_for_customer * 0.98;
      //   $orderDetail->price_for_agen = $product->price_for_agen;
      // }
      // else{
      $orderDetail->price_for_customer = $items['price'];       
      $orderDetail->price_for_agen = $items['price'] * 0.93;
      // }
      $orderDetail->save();
    }

    #Input Billing Detail
    $custo = Customer::where('identifier', '=', $request->get('user')->id)->first();
    $add = Address::join('city', 'city.id', '=', 'address.city_id')
                ->join('region', 'region.id', '=', 'address.region_id')
                ->select('address.address as address2', 'region.name as region', 'city.name as city', 'address.zip as zip', 'region.code as code', 'address.name as name', 'address.phone as phone')
                ->where('address.id', '=', $data['address_id'])
                ->first();

    $orderbillingdetail = new OrderBillingDetail;

    $orderbillingdetail->order_id =  $order->id;
    $orderbillingdetail->customer_name = $add->name;
    $orderbillingdetail->customer_phone = $add->phone;
    $orderbillingdetail->customer_address = "";
    $orderbillingdetail->customer_address2 = $add->address2;
    $orderbillingdetail->notes = $data['notes'];
    $orderbillingdetail->save();

    #send push notif ke ag->e2
    $this->_sendPushNotification($order->agen_id, "Order Baru", "Ada order baru.");

    return response()->json(['data' => $order->invoice_no, 'message' => ['OK']]);
    }

}
