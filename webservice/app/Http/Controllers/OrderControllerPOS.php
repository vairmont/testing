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
             ->increment('point_kredit', $amount);

    $poin = Agen::select('point_kredit')
            ->where('identifier', '=', $user->id)
            ->first();         

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

      $cartDetails = CartDetail::where('cart_id', '=', $cart->id)->get();
      $order = new Order;
      $order->invoice_no = uniqid();
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
        $product = Product::whereId($cartDetail->product_id)->first();
        $orderDetail = new OrderDetail;
        $orderDetail->order_id = $order->id;
        $orderDetail->product_id = $product->id;
        $orderDetail->category_id = $product->category_id;
        $orderDetail->qty = $cartDetail->qty;
        $orderDetail->base_price = $product->price_for_customer;
        $orderDetail->nego_price = $product->price_for_agen;
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

      $orderbillingdetail = new OrderBillingDetail;

      $orderbillingdetail->order_id =  $order->id;
      $orderbillingdetail->customer_name ="";
      $orderbillingdetail->customer_phone = "";
      $orderbillingdetail->customer_address = "";
      $orderbillingdetail->lat = "";
      $orderbillingdetail->long = "";
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


      #change order status
      $order = Order::whereId($request['order_id'])->first();

      $amount = $order->total;

      if($order->agen_id != 0)
      {
      $order->status = OrderStatus::DELIVERY;
      $topup = Agen::where('id', '=', $order->agen_id)
             ->decrement('point_kredit', $amount);
      $order->save();
      }
      else{
      $order->status = OrderStatus::COMPLETED;
      $order->payment = $request['payment'];
      $order->save();
      }

      return response()->json(['data' => $order],200);

      // return response()->json(['message' => 'Order has been completed.'], 201);

    }
}
