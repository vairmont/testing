<?php
/**
 * Created by PhpStorm.
 * User: febrianjiuwira
 * Date: 28/03/18
 * Time: 00.30
 */

namespace App\Http\Controllers;


use App\Cart;
use App\CartDetail;
use Validator;
use Illuminate\Http\Request;
use DB;

class ApiCartControllerPOS extends Controller {

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
      ->select('product.id as product_id', 'product.sku', 'product.product_name', 'cart_detail.qty', 'product.price_for_customer', 'product.price_for_agen')
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
    $val = Validator::make($request->all(), [
      'product_id' => 'required|numeric|exists:product,id',
      'qty' => 'required|numeric'
    ]);

    if ($val->fails()) {
      return response()->json(['data' => [], 'message' => $val->errors()->all()], 400);
    }

    $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();

    if ($cart == null) {
      $cart = new Cart;
      $cart->user_id = $request->get('user')->id;
      $cart->subtotal = 0;
      $cart->tax = 0;
      $cart->total = 0;
      $cart->save();
    }

    $cartDetail = CartDetail::where('cart_id', '=', $cart->id)
      ->where('product_id', '=', $request['product_id'])->first();

    if (!$cartDetail) {
      $cartDetail = new CartDetail;
      $cartDetail->cart_id = $cart->id;
      $cartDetail->product_id = $request['product_id'];
    }

    $cartDetail->qty = $request['qty'];
    $cartDetail->save();

    $items = CartDetail::Join('product', 'cart_detail.product_id', '=', 'product.id')
      ->where('cart_detail.cart_id', '=', $cart->id)
      ->where('qty', '>', 0)
      ->select('product.id', 'product.sku', 'product.product_name', 'cart_detail.qty', 'product.price_for_customer', 'product.price_for_agen')
      ->get();

    $subtotal = 0;
    foreach ($items as $item) {
      $subtotal += $item->price_for_customer * $item->qty;
    }

    $cart->subtotal = $subtotal;
    $cart->total = $subtotal;
    $cart->save();

    return response()->json([
      'cart' => [
        'subtotal' => $cart->subtotal,
        'tax' => $cart->tax,
        'total' => $cart->total,
        'items' => $items
      ]
    ], 201);
  }

  public function deleteCartItem(Request $request) {
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

    $cartDetail = CartDetail::where('cart_id', '=', $cart->id)
      ->where('product_id', '=', $request['product_id'])
      ->delete();


    $items = CartDetail::Join('product', 'cart_detail.product_id', '=', 'product_id')
              ->where('cart_id', '=', $cart->id)
              ->where('qty', '>', 0)
              ->select('product.id', 'product.sku', 'product.product_name', 'cart_detail.qty', 'product.price_for_customer', 'product.price_for_agen')
              ->get();

    $subtotal = 0;
    $price = 0;
    $price_agen = 0;
    foreach ($items as $item) {
      if($item->promo_price <= $item->price_for_customer && $item->promo_price > 0){
        $price = $item->promo_price;
        $price_agen = $item->promo_price * 0.95;

    }
    else{
      $price = $item->price_for_customer;
      $price_agen = $item->price_for_agen;
    } 
      switch ($request->get('user')->role_id) {
        case 2:
          $subtotal += $item->price * $item->qty;
          break;
        case 3:
        case 4:
          $subtotal += $item->price_agen * $item->qty;
          break;
      }
    }

    $cart->subtotal = $subtotal;
    $cart->total = $subtotal;
    $cart->save();

    return response()->json([
      'cart' => [
        'subtotal' => $cart->subtotal,
        'tax' => $cart->tax,
        'total' => $cart->total,

        'items' => $items
      ]
    ], 201);
  }

  public function clearCartItems(Request $request) {

    $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();
    $cart->subtotal = 0;
    $cart->tax = 0;
    $cart->total = 0;
    $cart->save();

    $detail = CartDetail::where('cart_id', '=', $cart->id)
      ->delete();

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