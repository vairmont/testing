<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderDetail;
use App\OrderCancel;
use App\OrderBillingDetail;
use App\Product;
use App\User;
use App\Agen;
use App\VoucherUse;
use App\Voucher;
use App\Cart;
use App\CartDetail;
use App\ProductCategory;
use App\FCM;
use App\Stock;
use App\StockHistory;
use App\Constant\OrderStatus;

class OrderControllerPOS extends Controller
{
    public function getOrderById(Request $request) {
      // $order = OrderDetail::Join('product', 'order_detail.product_id', '=', 'product.id')
      //     ->where('order_id', '=', $request->order_id)
      // $order = OrderDetail::where('order_detail.order_id','=',$request->order_id)
      // ->leftjoin('product','order_detail.product_id','=','product.id')
      // ->get();
      $order = OrderDetail::leftJoin('product', 'order_detail.product_id', '=', 'product.id')
          ->where('order_detail.order_id', '=', $request->order_id)
          ->select(DB::raw('product.id, product.product_name, product.price_for_customer as price, product.price_for_agen,order_detail.qty as qty'))
          ->get();

      return response()->json(['data' => $order, 'message' => ['OK']]);
     }

   public function topUp(Request $request) {
    $amount = $request->amount;

    $user = User::where('phone',$request->phone)->first();

    $topup = Agen::where('identifier', '=', $user->id)
             ->increment('wanee', $amount);

    $poin = Agen::select('wanee')
            ->where('identifier', '=', $user->id)
            ->first();  

    $agen = Agen::where('agen.identifier', '=', $request->get('user')->id)
                    ->select('agen.wanee')
                    ->first();

    $history = new WaneeHistory;
    $history->user_id = $request->get('user')->id;
    $history->amount = $amount;
    $history->saldo_akhir = $agen->wanee + $amount;
    $history->reason = 'Topup Wanee';
    $history->save();               

    return response()->json(['data' => $poin, 'message' => ['OK']]);         
   }

    // public function index(Request $request) {
    //   $orders = Order::where('user_id', '=', $request->get('user')->id)->get();

    //   $result = [];
    //   foreach ($orders as $order) {
    //     $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
    //       ->where('order_id', '=', $order->id)
    //       ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
    //       ->get();

    //     $result[] = [
    //       'order_id' => $order->id,
    //       'invoice_no' => $order->invoice_no,
    //       'subtotal' => $order->subtotal,
    //       'tax' => $order->tax,
    //       'discount' => $order->discount,
    //       'items' => $items
    //     ];
    //   }

    //   return response()->json($result, 200);
    // }

    public function create(Request $request) {

      $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

      if ($cart == null) {
        return response()->json(['message' => 'There is no item to order.'], 400);
      }

      $today = date("Ymd");
      $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
      $unique = $today . $rand;

      $cartDetails = CartDetail::where('cart_id', '=', $cart->id)->get();
      $order = new Order;
      $order->invoice_no = $unique;
      $order->user_id = $cart->user_id;
      $order->subtotal = $cart->subtotal;
      $order->tax = $cart->tax;
      $order->discount = 0;
      $order->total = $cart->total;
      $order->save();

      $cart->subtotal = 0;
      $cart->tax = 0;
      $cart->total = 0;
      $cart->save();

      $items = [];
      foreach ($cartDetails as $cartDetail) {
        $product = Product::where('id','=',$cartDetail->product_id)->first();
        $orderDetail = new OrderDetail;
        $orderDetail->order_id = $order->id;
        $orderDetail->product_id = $cartDetail->product_id;
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
      
      $orderbillingdetail = new OrderBillingDetail;

      $orderbillingdetail->order_id =  $order->id;
      $orderbillingdetail->customer_name ="";
      $orderbillingdetail->customer_phone = "";
      $orderbillingdetail->customer_address = "";
      $orderbillingdetail->lat = "";
      $orderbillingdetail->long = "";
      $orderbillingdetail->notes = "";
      $orderbillingdetail->customer_address2 = "";
      $orderbillingdetail->save();

      $cartDetail = CartDetail::where('cart_id', '=', $cart->id)->delete();
      $cart->delete();

      return response()->json(
        [
            'order_id' => $order->id,
            'invoice_no' => $order->invoice_no,
            'subtotal' => $order->subtotal,
            'tax' => $order->tax,
            'discount' => $order->discount,
            'total' => $order->total,
            'items' => $items
      ], 201);
    }

    public function print(Request $request)
    {
      $header = "\n\n\n\n\n\n\n\n\n\n Grosir One Receipt\n\t--------------\n\n";
      $order = Order::whereId($request['order_id'])->first();
      $orderDetail = OrderDetail::where('order_id','=',$request['order_id'])
      ->get();
      $items = "" ;
      foreach ($orderDetail as $od) {
        $product = Product::where('id','=',$od->product_id)->first();
        $items = $items . $product->product_name . "\t\t" . $od->price_for_customer . "\n";
      }

      $footer = "\n\n\n\n\n\n Total \t = ".$order->total."\n\n\n Terima Kasih Telah berbelanja\n\n\n\n";

      $print = $header . $items . $footer;
      return response()->json(['data' => $print],200);
    }

    public function finalizeOrder(Request $request) {

      $validator = Validator::make($request->all(),[
        'order_id' => 'required|numeric|exists:order,id',
        'store_id' => 'required'
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ]);
      }

      #change order status
      $order = Order::whereId($request['order_id'])->first();
      if($order->status == OrderStatus::DELIVERY ){
          return response()->json(['data' => [], 'message' => ['Transaksi sudah pernah diproses']]);
      }
      $amount = $order->total;

      if($order->agen_id != 0)
      {
        #check saldo
        $agen = Agen::where('agen.identifier', '=', $order->agen_id)
                      ->first();
        if($agen->wanee < $amount){
          return response()->json(['data' => [], 'message' => ['Saldo anda kurang']]);
        }
        else
        {
          $order->status = OrderStatus::DELIVERY;
          $topup = Agen::where('identifier', '=', $order->agen_id)
                 ->decrement('wanee', round($amount));
          $order->save();
        }

      }
      else{
      $order->status = OrderStatus::COMPLETED;
      $order->payment = $request['payment'];
      $order->save();
      }


      #kurangin stock
      $orderDetail = OrderDetail::where('order_id','=',$request['order_id'])
      ->get();

      foreach ($orderDetail as $orderdetails) {
        $stock = Stock::where('store_id','=',$request['store_id'])
                ->where('product_id','=',$orderdetails->product_id)
                ->first();

        $stock->quantity -= $orderdetails->qty;
        $stock->save();

        $stockhistory = new StockHistory;
        $stockhistory->product_id = $orderdetails->product_id;
        $stockhistory->store_id = $request['store_id'];
        $stockhistory->created_by = $request->get('user')->id;
        $stockhistory->reason = 'Terjual';
        $stockhistory->updated_by = $request->get('user')->id;
        $stockhistory->quantity = $orderdetails->qty;
        $stockhistory->save();

      }

      $this->_sendPushNotification($order->user_id, "Order Status", "Order sedang di antar oleh agen.");
      return response()->json(['data' => [$order], 'message' => ['Transaksi Berhasil']],200);

      // return response()->json(['message' => 'Order has been completed.'], 201);

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
}
