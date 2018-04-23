<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderDetail;
use App\OrderCancel;
use App\Product;
use App\User;
use App\Agen;
use App\VoucherUse;
use App\Voucher;
use App\Chat;
use App\Cart;
use App\CartDetail;
use App\ProductCategory;
use App\FCM;

class OrderController extends Controller
{
    /*
    -Get Order (untuk agen)
    -Add Order (customer)
    -Add Order (agen)
    -Cancel Order (customer)
    -Cancel Order (agen)
    */

    public function index(Request $request) {
      $orders = Order::where('user_id', '=', $request->get('user')->id)->get();

      $result = [];
      foreach ($orders as $order) {
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
      }

      return response()->json($result, 200);
    }

    public function create(Request $request) {

      $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

      if ($cart->total == 0) {
        return response()->json(['message' => 'There is no item to order.'], 400);
      }

      $cartDetails = CartDetail::where('cart_id', '=', $cart->id)->get();

      $order = new Order;
      $order->invoice_no = $cart->id;
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

      $cartDetail = CartDetail::where('cart_id', '=', $cart->id)->update(['qty' => 0]);

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
}