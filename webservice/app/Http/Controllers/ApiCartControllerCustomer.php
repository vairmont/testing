<?php
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 28/03/18
 * Time: 00.30
 */

namespace App\Http\Controllers;

use App\Order;
use App\Cart;
use DB;
use App\Stock;
use App\CartDetail;
use App\Product;
use App\OrderBillingDetail;
use Validator;
use Illuminate\Http\Request;

class ApiCartControllerCustomer extends Controller {

  public function index(Request $request) {
    $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

    if ($cart == null) {
      $cart = new Cart;
      $cart->user_id = $request->get('user')->id;
      $cart->subtotal = 0;
      $cart->tax = 0;
      $cart->total = 0;
      $cart->save();
    }

    $items = CartDetail::Join('product', 'cart_detail.product_id', '=', 'product.id')
      ->where('cart_detail.cart_id', '=', $cart->id)
      ->where('qty', '>', 0)
      ->select('product.id', 'product.sku', 'product.product_name', 'cart_detail.qty','product.img_url', 'cart_detail.price as price_for_customer') 
      ->get();

    return response()->json([
      'cart' => [
        'subtotal' => $cart->subtotal,
        'tax' => $cart->tax,
        'total' => $cart->total,
        'items' => $items
      ]
    ], 201);
  }
  public function updateCart(Request $request) {
    $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

    if ($cart == null) {
      $cart = new Cart;
      $cart->user_id = $request->get('user')->id;
      $cart->subtotal = 0;
      $cart->tax = 0;
      $cart->total = 0;
      $cart->save();
    }

    $product = Product::where('id',$request->product_id)->first();

    $stock = Stock::where('product_id', $request->product_id)
              ->select('stock.quantity')
              ->first();

    if($request->qty > $stock->quantity){
      return response()->json(['message' => 'Mohon maaf, stok barang ditoko tidak mencukupi.'], 200);
    }

    $cartDetail = CartDetail::where('cart_id', '=', $cart->id)
      ->where('product_id', '=', $request['product_id'])->first();

    if (!$cartDetail) {
      $cartDetail = new CartDetail;
      $cartDetail->cart_id = $cart->id;
      $cartDetail->product_id = $request['product_id'];
      
    }
    $cartDetail->price = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price;
    $cartDetail->qty += $request['qty'];
    $cartDetail->save();

    $items = CartDetail::where('cart_id', $cart->id)->get();

    $subtotal = 0;
    foreach ($items as $item) {
      $subtotal += $item->price * $item->qty;
    }

    $cart->subtotal = $subtotal;
    $cart->total = $subtotal;
    $cart->save();

    $checkDetail = CartDetail::where('product_id', $request->product_id)->first();

    if($checkDetail->qty <= 0){
      $checkDetail->delete();
    }

    if($cart->total <= 0){
      $cart->delete();
    }

    return response()->json([
                'cart' => [
                  'message' => ['OK']
                ],
            ], 201);
  }
  public function aupdateCart(Request $request) {

    $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

    if ($cart == null) {
      // utk add to cart pertama kali 
      
      $cart = new Cart;
      $cart->user_id = $request->get('user')->id;
      $cart->subtotal = 0;
      $cart->tax = 0;
      $cart->total = 0;
      $cart->save();

      $product = Product::where('id',$request->product_id)->first();

      $stock = Stock::where('product_id', $request->product_id)
                ->select('stock.quantity')
                ->first();

        if($request->qty > $stock->quantity){
          return response()->json(['message' => 'Mohon maaf, stok barang ditoko tidak mencukupi.'], 200);
        }

      $cd = new CartDetail;
      $cd->cart_id = $cart->id;
      $cd->product_id = $request->product_id;
      $cd->qty = $request->qty;
      $cd->price = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price;
      $cd->save();

      $details = CartDetail::where('cart_id', $cart->id)->get();

      $subtotal = 0;
      foreach($details as $d) {
        $subtotal += (int) ($d->price * $d->qty);
      }

      $updateCart = Cart::where('id', $cart->id)->update([
          'subtotal' => $subtotal,
          'total' => $subtotal 
        ]);
 
    }
    elseif($cart != null) {
      // update cart

      $checkDetail = CartDetail::where('product_id', $request->product_id)->first();
      
      if($checkDetail) {
        $qty = (int) ($checkDetail->qty + $request->qty);

        $stock = Stock::where('product_id', $request->product_id)
                ->select('stock.quantity')
                ->first();
       
        if($request->qty + $qty > $stock->quantity){
          return response()->json(['message' => 'Mohon maaf, stok barang ditoko tidak mencukupi.'], 200);
        }

        $checkDetail->update(['qty' => $qty]);

        $details = CartDetail::where('cart_id', $cart->id)->get();
        $subtotal = 0;
        foreach($details as $d) {
          $subtotal += (int) ($d->price * $d->qty);
        }

        $cart = Cart::find($checkDetail->cart_id);

        $cart->update([
            'subtotal' => $subtotal,
            'total' => $subtotal 
          ]);

        if($checkDetail->qty <= 0){
          $checkDetail->delete();
        }

        if($cart->total <= 0){

          $cart->delete();
        }     
      }
      else{
        $product = Product::where('id',$request->product_id)->first();

        $cd = new CartDetail;
        $cd->cart_id = $cart->id;
        $cd->product_id = $request->product_id;
        $cd->qty = $request->qty;
        $cd->price = ($product->promo_price == 0) ? $product->price_for_customer : $product->promo_price;
        $cd->save();

        $details = CartDetail::where('cart_id', $cart->id)->get();
        $subtotal = 0;
        foreach($details as $d) {
          $subtotal += (int) ($d->price * $d->qty);
        }

        $cart = Cart::where('id',$cart->id)->first();

        $cart->update([
            'subtotal' => $subtotal,
            'total' => $subtotal 
          ]);

        $checkDetail = CartDetail::where('product_id', $request->product_id)->first();

        if($checkDetail->qty <= 0){
          $checkDetail->delete();
        }

        if($cart->total <= 0){

          $cart->delete();
        }     
      }

    }
    return response()->json([
                'cart' => [
                  'message' => ['OK']
                ],
            ], 201);
}

  
  public function clearCartItems(Request $request) {

    $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();
    $cart->subtotal = 0;
    $cart->tax = 0;
    $cart->total = 0;
    $cart->save();

    $detail = CartDetail::where('cart_id', '=', $cart->id)
      ->update(['qty' => 0]);

    return response()->json([
      'message' => 'Cart items has been removed.',
      'cart' => [
          'subtotal' => $cart->subtotal,
          'tax' => $cart->tax,
          'total' => $cart->total,
          'items' => []
        ]
      ], 200);
  }

}