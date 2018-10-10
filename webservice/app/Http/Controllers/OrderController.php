<?php

namespace App\Http\Controllers;

use App\Commission;
use App\Constant\OrderStatus;
use Illuminate\Http\Request;
use Validator;
use DB;
use Hash;
use Carbon\Carbon;
use App\Order;
use App\OrderDetail;
use App\OrderBillingDetail;
use App\OrderCancel;
use App\Product;
use App\Withdraw;
use App\Customer;
use App\Store;
use App\Family;
use App\User;
use App\Agen;
use App\WaneeHistory;
use App\FCM;
use App\Cart;
use App\CartDetail;

class OrderController extends Controller
{

  private $marginRate = 0.05;
     private $pph = 0.02;

    public function orderPending(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $request->get('user')->id)
        ->where('order.status','=',1)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->orderBy('created_at', 'asc')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $request->get('user')->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->where('order.status','=',1)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->orderBy('created_at', 'asc')
        ->get();

        $relation = $parent->relation;
      } 

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

    public function orderProcess(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $request->get('user')->id)
        ->whereIn('order.status',[2,6])
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes', 'order.shipment')
        ->get();
        
        $relation = "Kepala Keluarga";

      }
      else{
        $parent = Family::where('child_id','=', $request->get('user')->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->whereIn('order.status',[2,6])
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes', 'order.shipment')
        ->get();

        $relation = $parent->relation;
      } 

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
            $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->leftjoin('rating', 'rating.order_id', '=', 'order.id')
        ->where('order.agen_id', '=', $request->get('user')->id)
        ->where('order.status','=',7)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes', 'rating.rating', 'rating.notes')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $request->get('user')->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->leftjoin('rating', 'rating.order_id', '=', 'order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->where('order.status','=',7)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes', 'rating.rating', 'rating.notes')
        ->get();

        $relation = $parent->relation;
      } 

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
            $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $request->get('user')->id)
        ->where('order.status','=',8)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $request->get('user')->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->where('order.status','=',8)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->get();

        $relation = $parent->relation;
      } 

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
      $order->save();

      $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
        ->where('order_id', '=', $order->id)
        ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.price_for_customer', 'order_detail.nego_price')
        ->get();

      #send push notif ke customer
      $this->_sendPushNotification($order->user_id, "Order Status", "Order telah di terima agen.");

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
      DB::beginTransaction();
        try {
      $order = Order::whereId($request['order_id'])
        ->first();
      $order->status = OrderStatus::CANCELLED;
      $order->save();

      $orderCancel = new OrderCancel;
      $orderCancel->order_id = $order->id;
      $orderCancel->cancel_by = $request->get('user')->id;
      // $orderCancel->agen_id = $order->agen_id;
      $orderCancel->reason = $request['reason'];
      $orderCancel->save();
      } catch(\Exception $e) {
          DB::rollback();
          throw $e;
      }
      DB::commit();
      #send push notif ke customer
      $this->_sendPushNotification($order->user_id, "Order Status", "Order di cancel oleh agen.");

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
      // $order->status = OrderStatus::DELIVERY;
      $order->save();

      $this->_sendPushNotification($order->user_id, "Order Status", "Order sedang di antar oleh agen.");

      return response()->json(['message' => 'Order is on delivery.'], 201);

    }

    public function acceptOrder(Request $request) {

      $validator = Validator::make($request->all(),[
        'order_id' => 'required|numeric|exists:order,id'
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ]);
      }

      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::ASSIGNED;
      $order->save();

      $this->_sendPushNotification($order->user_id, "Order", "Order anda telah diambil oleh agen.");
      return response()->json(['message' => 'Order berhasil anda ambil.'], 201);

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

            // $latFrom = deg2rad($request->lat);
            // $lonFrom = deg2rad($request->long);
            // $earthRadius = 6371; // in km

            // $orderlocation = OrderBillingDetail::select('lat', 'long')
            //                 ->where('order_id', $request->order_id)
            //                 ->first();  

            // $latTo = deg2rad($orderlocation->lat);
            // $lonTo = deg2rad($orderlocation->long);

            // $latDelta = $latTo - $latFrom;
            // $lonDelta = $lonTo - $lonFrom;

            // $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) + cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

            // // 1.6 for convert in miles to km
            // // x2 for set exact distance
            // $distance = (float)(($angle * $earthRadius) * 2);

            // if($distance <= 0.5) {
      DB::beginTransaction();
        try {
      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::COMPLETED;
      $order->save();
      $incentiveDetails = OrderDetail::join('product', 'product.id', '=', 'order_detail.product_id')
                    ->join('incentive_category', 'incentive_category.id', '=', 'product.incentive_id')
                    ->where('order_id', '=', $order->id)
                    ->select('order_detail.price_for_customer', 'incentive_category.rate', 'order_detail.qty', 'product.promo_price', 'product.category_id')
                    ->get();

      $incentive = 0;
      $margin = 0;
      $prices = 0;

          

      foreach ($incentiveDetails as $detail) {
        if($detail->category_id == 5){
          $prices += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty;
          $margin += 0;
          $incentive += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty * $detail->rate / 100;  
          }

          else{
          $prices += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty;
          $margin += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty * $this->marginRate;
          $incentive += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty * 0.95 * $detail->rate / 100;        
          }
       }
      $commission_pph = ($incentive + $margin) * $this->pph;
      $commission_netto = $incentive - $commission_pph;
      
      $commission = new Commission;
      $commission->order_id = $order->id;
      $commission->agen_id = $order->agen_id;
      $commission->incentive = $incentive;
      $commission->commission_pph = $commission_pph;
      $commission->commission_netto = $commission_netto;
      $commission->margin_penjualan = $margin;
      $commission->save();

      $agen = Agen::where('agen.identifier', '=', $request->get('user')->id)
                    ->select('agen.wanee')
                    ->first();

      $history = new WaneeHistory;
      $history->user_id = $request->get('user')->id;
      $history->amount = $commission_netto;
      $history->saldo_akhir = $agen->wanee + $commission_netto;
      $history->reason = 'Komisi Agen';
      $history->save();

      $komisi = Agen::where('agen.identifier', '=', $request->get('user')->id)
                    ->update([
                'wanee' => $history->saldo_akhir
            ]);

      } catch(\Exception $e) {
          DB::rollback();
          throw $e;
      }
      DB::commit();

      $this->_sendPushNotification($order->user_id, "Order Status", "Terima kasih transaksi selesai tolong berikan rating.");

      return response()->json(['message' => 'Order has been completed.'], 201);
      }
   
      public function purchaseDone(Request $request) {

      $orders = Order::join('order_billing_detail', 'order_billing_detail.order_id', '=', 'order.id')
      ->join('agen', 'agen.identifier', '=', 'order.agen_id')
      ->where('user_id', '=', $request->get('user')->id)
      ->where('status', 7)
      ->orderBy('order.created_at', 'desc')
      ->select('order.id', 'order.invoice_no as invoice', 'order.created_at as date', 'order.payment as payment', 'order.status as status', 'order.total as total', 'order_billing_detail.notes as notes')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','product.price_for_agen','product.img_url', 'product.promo_price')
          ->get();

        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->date)->format('d M Y H:i')
        ];
      }

      return response()->json($result, 200);
    }

      public function purchase(Request $request) {
       DB::beginTransaction();
      try {

      $customer = User::where('id', '=', $request->get('user')->id)->first();

      $storelocation = Store::join('users', 'users.store_id', '=', 'store.id')
                       ->select('store.lat', 'store.long', 'store.store_name')
                       ->where('store.id', '=', $customer->store_id)
                       ->first();  

    $agencust = Agen::where('agen.identifier','=',$request->get('user')->id)
    ->select('agen.identifier as identifier', 'agen.name', 'agen.address')
    ->first();

    #ROLE AGEN / CUST

    $today = date("Ymd");
    $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
    $unique = $today . $rand;

    $order = new Order;
    $order->invoice_no = $unique;
    $order->user_id = $agencust->identifier;
    $order->subtotal = 0;
    $order->tax = 0;
    $order->discount = 0;
    $order->total = 0;
    $order->status = OrderStatus::COMPLETED;
    $order->agen_id = $agencust->identifier;
    $order->shipment = 'courier';
    $order->payment = 'transfer';
    $order->save();

    $product = Product::where('id',$request->product_id)->first();

      $orderDetail = new OrderDetail;
      $orderDetail->order_id = $order->id;
      $orderDetail->product_id = $request->product_id;
      $orderDetail->category_id = $product->category_id;
      $orderDetail->qty = $request->qty;
      $orderDetail->price_for_customer = (($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price);
      $orderDetail->price_for_agen = (($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price) * 0.95;
      $orderDetail->save();

      $details = OrderDetail::where('order_id', $order->id)->get();

      $subtotal = 0;
      foreach($details as $d) {
        $subtotal += (int) ($d->price_for_customer * 0.95 * $d->qty);
      }
      $updateOrder = Order::where('id', $order->id)->update([
          'subtotal' => $subtotal,
          'total' => $subtotal 
        ]);

    $agen = Agen::where('agen.identifier', '=', $request->get('user')->id)
                      ->first();
        if($agen->plafon_kredit < $subtotal){
          return response()->json(['data' => [], 'message' => ['Saldo anda kurang']]);
        }
        else
        {
          $topup = Agen::where('agen.identifier','=',$request->get('user')->id)
                 ->decrement('plafon_kredit', round($subtotal));
        }
    #Input Billing Detail
    $orderbillingdetail = new OrderBillingDetail;

    $orderbillingdetail->order_id =  $order->id;
    $orderbillingdetail->customer_name = $agencust->name;
    $orderbillingdetail->customer_phone = $request->get('user')->phone;
    $orderbillingdetail->customer_address = $agencust->address;
    $orderbillingdetail->customer_address2 = $agencust->address;
    $orderbillingdetail->lat = $storelocation->lat;
    $orderbillingdetail->long = $storelocation->long;
    $orderbillingdetail->notes = $request->notes;
    $orderbillingdetail->save();
    
    } catch(\Exception $e) {
          DB::rollback();
          throw $e;
      }
      DB::commit();

    return response()->json(['data' => [], 'message' => ['OK']]);
        
  }

    public function manualNotif(Request $request){
       
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


    public function withdraw(Request $request)
    {
      if(empty($request->amount)) {
          return response()->json(['message' => ['Nominal tidak boleh kosong']]);
      }

      if(empty($request->password)) {
          return response()->json(['message' => ['Password tidak boleh kosong']]);
      }  

      $data = User::where('id', '=', $request->get('user')->id)->first();

      if( ! Hash::check( $request->password, $data->password  ) ){
          return response()->json(['message' => ['Password yang anda masukkan salah']]);
      }
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();
      #check saldo
        if($agen->wanee < $request->amount){
          return response()->json(['data' => [], 'message' => ['Saldo anda kurang']]);
        }

        if($request->amount < 10000){
          return response()->json(['message' => ['Penarikan minimal Rp 10.000.']]);
        }
      else{
            
            $withdraw = [
                'agen_id' =>$agen->identifier,
                'amount' => $request->amount,
                'saldo_awal' => $agen->wanee,
                'status' => 'process'
            ];
            $create = Withdraw::create($withdraw);

            return response()->json(['data' => ['withdraw_id' => $create->id], 'message' => ['OK']]);
          }
    }

}
