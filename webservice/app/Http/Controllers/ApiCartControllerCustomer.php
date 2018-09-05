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

      if (!in_array($request->get('user')->role_id, [2,3,4])) {
      return response()->json(['error' => 'Unauthorized role access.'], 401);
    }

    $val = Validator::make($request->all(), [
      'product_id' => 'required|numeric|exists:product,id',
      'qty' => 'required|numeric'
    ]);

    if ($val->fails()) {
      return response()->json(['data' => [], 'message' => $val->errors()->all()], 400);
    }

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
    else {

      // update cart

      $checkDetail = CartDetail::where('product_id', $request->product_id)->first();
      
      if($checkDetail) {
        $qty = (int) ($checkDetail->qty + $request->qty);
        $checkDetail->update(['qty' => $qty]);

        $details = CartDetail::where('cart_id', $cart->id)->get();
        $subtotal = 0;
        foreach($details as $d) {
          $subtotal += (int) ($d->price * $d->qty);
        }

        $cart = Cart::where('id',$checkDetail->cart_id)->first();

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

    }

    // $cartDetail = CartDetail::where('cart_id', '=', $cart->id)
    //   ->where('product_id', '=', $request['product_id'])->first();

    //  $items = CartDetail::Join('product', 'cart_detail.product_id', '=', 'product.id')
    //   ->where('cart_detail.cart_id', '=', $cart->id)
    //   ->where('qty', '>', 0)
    //   ->select('product.id', 'product.sku', 'product.product_name', 'cart_detail.qty', 'product.price_for_customer', 'product.price_for_agen', 'product.promo_price')
    //   ->get();

    //   $subtotal = 0;
    //   $price = 0;
    //   $price_agen = 0;
    //   foreach ($items as $item) {
    //       if($item->promo_price > 0 && $item->promo_price < $item->price_for_customer){
    //         $price = $item->promo_price;
    //         $price_agen = $item->promo_price * 0.95;
    //       }
    //       else{
    //         $price = $item->price_for_customer;
    //         $price_agen = $item->price_for_customer * 0.95;
    //       }
    //     switch ($request->get('user')->role_id) {
    //       case 2:
    //         $subtotal += $item->price * $item->qty;
    //         break;
    //       case 3:
    //       case 4:
    //         $subtotal += $item->price_agen * $item->qty;
    //         break;
    //     }
    //   }

      
    //   if (!$cartDetail) {
    //     $cartDetail = new CartDetail;
    //     $cartDetail->cart_id = $cart->id;
    //     $cartDetail->product_id = $request['product_id'];
    //     $cartDetail->qty += $request['qty'];
    //     $cartDetail->price = $price;
    //     $cartDetail->save();
    //   }

    //   if($cartDetail->qty <= 0){

    //     $cartDetail->delete();
    //   }

    //   if($cart->total = 0){

    //     $cart->delete();
    //   }

    return response()->json([
        'data' => [], 'message' => ['OK']
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