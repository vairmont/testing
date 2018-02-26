<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cart;
use App\CartDetail;
use App\Product;
use App\User;
use Validator;
use DB;

class CartController extends Controller
{
	/*
		2 = Customer
		3 & 4 = Reseller
	*/

    public function getCart(Request $request) 
    {
    	$val = Validator::make($request->all(), [
    		'cart_id' => 'required',
    		'user_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {

	    	$cart_id = $request->cart_id;
	    	$user_id = $request->user_id;
	    	$user = User::find($user_id);

	    	$data = Cart::Join('cart_detail','cart.id','=','cart_detail.cart_id')
	    			->Join('product','cart_detail.product_id','=','product.id')
                    ->Join('product_category','product.category_id','=','product_category.id')
	    			->LeftJoin('voucher','cart.voucher_id','=','voucher.id')
	    			->where('cart.user_id',$user_id);

            if($cart_id == "") {
                $data =  $data->orderBy('cart.id','DESC');
            }
            else {
                $data = $data->where('cart.id',$cart_id);
            }

	    	if($user->role_id == 2) {
	    		$data = $data->select(
	    			DB::raw(
	    				'cart.id AS cart_id, voucher.voucher_code, cart.subtotal, cart.discount, cart.tax, cart.total, cart_detail.product_id, product.product_name, product.price_for_customer AS price, FORMAT(product.price_for_customer, "C", "en-us") AS formatted_price, product.img_url, product.description, cart_detail.qty, product.category_id, product_category.name as category_name'
	    			)
	    		);
	    	}
	    	elseif($user->role_id == 3 || $user->role_id == 4) {
	    		$data = $data->select(
	    			DB::raw(
	    				'cart.id AS cart_id, voucher.voucher_code, cart.subtotal, cart.discount, cart.tax, cart.total, cart_detail.product_id, product.product_name, product.price_for_reseller AS price, FORMAT(product.price_for_reseller, "C", "en-us") AS formatted_price, product.img_url, product.description, cart_detail.qty, product.category_id, product_category.name as category_name'
	    			)
	    		);
	    	}
	    	else {
	    		return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
	    	}

	    	$data = $data->get();

	    	return response()->json(['data' => $data, 'message' => ['OK']]);
    	}
    }

    public function addCart(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'product_id' => 'required',
    		'user_id' => 'required',
    		'qty' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {
       		// check cart exist or not
    		$cart = Cart::where('user_id',$request->user_id)->first();
    		$product = Product::find($request->product_id);
    		$user = User::find($request->user_id);

    		if(count($cart) == 0) {
    			DB::beginTransaction();
    			try {
	    			// save to Cart
		    		$cartItem['user_id'] = $request->user_id;
		    		$cartItem['voucher_id'] = 0;
		    		$cartItem['discount'] = 0;
		    		$cartItem['tax'] = 0;

	    			if($user->role_id == 2) {
	    				$cartItem['subtotal'] = (float)($product->price_for_customer * $request->qty);
	    				$cartItem['total'] = (float)($product->price_for_customer * $request->qty);
	    			}
	    			elseif($user->role_id == 3 || $user->role_id == 4) {
	    				$cartItem['subtotal'] = (float)($product->price_for_reseller * $request->qty);
	    				$cartItem['total'] = (float)($product->price_for_reseller * $request->qty);
	    			}
	    			else {
	    				return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
	    			}

	    			$storeToCart = Cart::create($cartItem);

	    			// save to Cart Detail
	    			$cartItemDetail['cart_id'] = $storeToCart->id;
	    			$cartItemDetail['product_id'] = $request->product_id;
	    			$cartItemDetail['qty'] = $request->qty;

	    			$storeToCartDetail = CartDetail::create($cartItemDetail);
    			}
    			catch(\Exception $e) {
    				DB::rollback();
    				throw $e;
    			}

    			DB::commit();
    			return response()->json(['data' => ['cart_id' => $storeToCart->id], 'message' => ['OK']]);
	    	}
	    	else {
	    		DB::beginTransaction();

	    		try {
		    		$cartData = Cart::where('user_id',$request->user_id);
		    		$data = $cartData->first();

		    		if($user->role_id == 2) {
		    			$update['subtotal'] = (float)($data->subtotal + ($product->price_for_customer * $request->qty));
		    			$update['total'] = (float)($data->total + ($product->price_for_customer * $request->qty));
		    		}
		    		elseif($user->role_id == 3 || $user->role_id == 4) {
		    			$update['subtotal'] = (float)($data->subtotal + ($product->price_for_reseller * $request->qty));
		    			$update['total'] = (float)($data->total + ($product->price_for_reseller * $request->qty));
		    		}
		    		else {
	    				return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
	    			}

		    		$cartData->update($update);

		    		$qry = CartDetail::where('product_id',$request->product_id)->where('cart_id', $data->id);
		    		$cartDetailCheck = $qry->first();

		    		if(count($cartDetailCheck) > 0) {
		    			$updateCartDetail = $qry->update([
		    				'qty' => (float)($cartDetailCheck->qty + $request->qty)
		    			]);
		    		}
		    		else {
		    			$cartItemDetail['cart_id'] = $data->id;
			    		$cartItemDetail['product_id'] = $request->product_id;
			    		$cartItemDetail['qty'] = $request->qty;

			    		$storeToCartDetail = CartDetail::create($cartItemDetail);
		    		}
		    	}catch(\Exception $e) {
		    		DB::rollback();
		    		throw $e;
		    	}

		    	DB::commit();
	    		return response()->json(['data' => ['cart_id' => $data->id], 'message' => ['OK']]);
	    	}
    	}
    }

    public function updateQty(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'cart_id' => 'required',
    		'product_id' => 'required',
    		'qty' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
    	}
    	else {
    		/*
    			qty can be (-) or (+)
    		*/
    		$cart_id = $request->cart_id;
    		$product_id = $request->product_id;
    		$qty = $request->qty;

    		$cart = Cart::find($cart_id);
    		$user = User::find($cart->user_id);
    		$product = Product::where('id',$product_id);

    		if($user->role_id == 2) {
    			$product = $product->select('price_for_customer AS price')->first();
    		}
    		elseif($user->role_id == 3 || $user->role_id == 4) {
    			$product = $product->select('price_for_reseller AS price')->first();
    		}

    		DB::beginTransaction();

    		try
    		{
	    		$cartDetail = CartDetail::where('cart_id',$cart_id)->where('product_id',$product_id)->first();

	    		if((float)($cartDetail->qty + $qty) >= 0) {
	    			$updateCartDetail = $cartDetail->update(['qty' => (float)($cartDetail->qty + $qty)]);
	    		}
	    		else {
	    			return response()->json(['data' => [], 'message' => ["Invalid qty"]]);
	    		}

	    		// if current product.qty = 0 remove the product from cart
	    		if($cartDetail->qty == 0) {
	    			$removeCartDetail = $cartDetail->delete();
	    		}

	    		$cart = Cart::where('id',$cart_id)->first();
	    		
    			$item['subtotal'] = (float)($cart->subtotal + ($product->price * $qty));
    			$item['total'] = (float)($cart->total + ($product->price * $qty));

	    		$updateCart = $cart->update($item);

                if($cart->total == 0) {
                    $cart->delete();
                }
    		}
    		catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();
    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }

    public function removeProduct(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'cart_id' => 'required',
    		'product_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
    	}
    	else {
    		$cart_id = $request->cart_id;
    		$product_id = $request->product_id;

    		$cart = Cart::find($cart_id);
    		$user = User::find($cart->user_id);
    		$product = Product::where('id',$product_id);

    		if($user->role_id == 2) {
    			$product = $product->select('price_for_customer AS price')->first();
    		}
    		elseif($user->role_id == 3 || $user->role_id == 4) {
    			$product = $product->select('price_for_reseller AS price')->first();
    		}

    		DB::beginTransaction();

    		try
    		{
                $cartDetail = CartDetail::where('cart_id',$cart_id)->where('product_id',$product_id)->first();
	    		$cart = Cart::where('id',$cart_id)->first();
	    		
    			$data['subtotal'] = (float)($cart->subtotal - ($product->price * $cartDetail->qty));
    			$data['total'] = (float)($cart->total - ($product->price * $cartDetail->qty));

	    		$updateCart = $cart->update($data);

                $removeCartDetail = $cartDetail->delete();

                if($cart->total == 0) {
                    $cart->delete();
                }
    		}
    		catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();
    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }
}
