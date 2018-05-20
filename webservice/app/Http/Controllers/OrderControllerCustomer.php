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
use App\User;
use App\Agen;
use App\Cart;
use App\Chat;
use App\CartDetail;

class OrderController extends Controller
{

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
          ->where('status','=','3')
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
          ->where('status','=','4')
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

    public function chatList(Request $request)
    {
        $val = Validator::make($request->all(), [
            'order_id' => 'required',
            'category_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $chats = Chat::where('order_id',$request->order_id)
                    ->where('category_id',$request->category_id)
                    ->orderBy('id','asc')
                    ->select('id','sender_id','recipient_id','message','created_at')
                    ->get();

            return response()->json(['data' => $chats, 'message' => ['OK']]);
        }
    }

    public function orderChat(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'order_id' => 'required',
            'category_id' => 'required',
    		'sender_id' => 'required',
    		'message' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {
    		$order = Order::leftJoin('order_action','order_action.order_id','=','order.id')
    				->where('order.id',$request->order_id)
                    ->where('order_action.category_id',$request->category_id)
    				->first();

            $orderProgress = OrderProgress::where('order_id',$request->order_id)
            ->where('category_id',$request->category_id)
            ->first();

    		$user = User::find($request->sender_id);

            $chat['order_progress_id'] = $orderProgress->id;
    		$chat['order_id'] = $request->order_id;
            $chat['category_id'] = $request->category_id;
    		$chat['sender_id'] = $request->sender_id;
    		if($user->role_id == 2) {
    			$chat['recipient_id'] = $order->take_by;
    		}
    		elseif($user->role_id == 3 || $user->role_id == 4 || $user->role_id == 5) {
    			$chat['recipient_id'] = $order->user_id;
    		}
    		$chat['message'] = nl2br($request->message);
    		Chat::create($chat);

            // send push notification
            $this->_sendPushNotification($chat['recipient_id'], "New Message", nl2br($chat['message']));

    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }
}