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
use App\Customer;
use App\Family;
use App\User;
use App\Agen;
use App\Cart;
use App\CartDetail;

class OrderController extends Controller
{

    private $marginRate = .05;
    private $pph = .02;

    public function orderPending(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $agen->id)
        ->where('order.status','=',1)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->where('order.status','=',1)
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

    public function orderProcess(Request $request) {
      $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $agen->id)
        ->where('order.status','=',2)
        ->orWhere('order.status','=',6)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->where('order.status','=',2)
        ->orWhere('order.status','=',6)
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

    public function orderDone(Request $request) {
            $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $agen->id)
        ->where('order.status','=',7)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.agen_id', '=', $parent->id)
        ->where('order.status','=',7)
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

    public function orderCancel(Request $request) {
            $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

      if($agen->parent == 1){
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('agen_id', '=', $agen->id)
        ->where('status','=',8)
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2')
        ->get();

        $relation = "Kepala Keluarga";
      }
      else{
        $parent = Family::where('child_id','=', $agen->id)->first();
        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('agen_id', '=', $parent->id)
        ->where('status','=',8)
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
        ->select('product.id as product_id', 'product.sku', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
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
      $order->status = OrderStatus::DELIVERY;
      $order->save();

      $this->_sendPushNotification($order->user_id, "Order Status", "Order sedang di antar oleh agen.");

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

      $this->_sendPushNotification($order->user_id, "Order Status", "Terima kasih transaksi selesai tolong berikan rating.");

      return response()->json(['message' => 'Order has been completed.'], 201);

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
