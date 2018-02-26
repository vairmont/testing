<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\Order;
use App\OrderProgress;
use App\OrderBillingDetail;
use App\OrderDetail;
use App\OrderItemDetail;
use App\OrderAction;
use App\OrderCancel;
use App\Product;
use App\User;
use App\Reseller;
use App\Dealer;
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
        3 & 4 Reseller
        5 Dealer
    */

    public function getOrderNew(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'user_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {
    		$user = User::find($request->user_id);

            $orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('product_category','order_progress.category_id','=','product_category.id')
                ->join('users','users.id','=','order.user_id')
                ->join('role','role.id','=','users.role_id')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'product_category.name as category_name',
                    'role.name as role_name','users.email as user_email'
                );

            if($user->role_id == 3 || $user->role_id == 4) {
                $check = Reseller::where('identifier',$request->user_id)
                    ->select('printer_inkjet','printer_laser','printer_label','scanner','mesin_jahit','lain_lain')
                    ->first();

                $category_id = [];
                if($check->printer_inkjet == 1) {
                    $category = ProductCategory::where('slug', 'printer_inkjet')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->printer_laser == 1) {
                    $category = ProductCategory::where('slug', 'printer_laser')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->printer_label == 1) {
                    $category = ProductCategory::where('slug', 'printer_label')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->scanner == 1) {
                    $category = ProductCategory::where('slug', 'scanner')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->mesin_jahit == 1) {
                    $category = ProductCategory::where('slug', 'mesin_jahit')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->lain_lain == 1) {
                    $category = ProductCategory::where('slug', 'lain_lain')->select('id')->first();
                    array_push($category_id, $category->id);
                }

                $orders = $orders->whereIn('order_progress.category_id',$category_id);
            }
            else if($user->role_id == 5) {
                $check = Dealer::where('identifier',$request->user_id)
                    ->select('printer_inkjet','printer_laser','printer_label','scanner','mesin_jahit','lain_lain')
                    ->first();

                $category_id = [];
                if($check->printer_inkjet == 1) {
                    $category = ProductCategory::where('slug', 'printer_inkjet')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->printer_laser == 1) {
                    $category = ProductCategory::where('slug', 'printer_laser')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->printer_label == 1) {
                    $category = ProductCategory::where('slug', 'printer_label')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->scanner == 1) {
                    $category = ProductCategory::where('slug', 'scanner')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->mesin_jahit == 1) {
                    $category = ProductCategory::where('slug', 'mesin_jahit')->select('id')->first();
                    array_push($category_id, $category->id);
                }
                if($check->lain_lain == 1) {
                    $category = ProductCategory::where('slug', 'lain_lain')->select('id')->first();
                    array_push($category_id, $category->id);
                }

                $orders = $orders->whereIn('order_progress.category_id',$category_id);
            }
            else {
                return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
            }

            $orders = $orders->where('order_progress.status_order','new')
                    ->where('order.user_id','!=',$request->user_id)
                    ->orderBy('order.id','desc')
                    ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
    	}
    }

    public function getOrderProgress(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {

            $orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('order_action','order_progress.id','=','order_action.order_progress_id')
                ->join('product_category','order_progress.category_id','=','product_category.id')
                ->join('customer','order.user_id','=','customer.identifier')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'customer.phone', 'product_category.name as category_name', 'order.user_id as buyer_id'
                )
                ->where('order_progress.status_order','progress')
                ->where('order_action.take_by',$request->user_id)
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function getOrderCancel(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {

            $user = User::find($request->user_id);

            $orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('order_action','order_progress.id','=','order_action.order_progress_id')
                ->join('order_cancel','order_progress.id','=','order_cancel.order_progress_id')
                ->join('product_category','order_progress.category_id','=','product_category.id')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'order_cancel.reason', 'product_category.name as category_name'
                )
                ->where('order_progress.status_order','cancel')
                ->where('order_action.take_by',$request->user_id)
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function getOrderFinish(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {

            $user = User::find($request->user_id);

            $orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('order_action','order_progress.id','=','order_action.order_progress_id')
                ->join('product_category','order_progress.category_id','=','product_category.id')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'product_category.name as category_name'
                )
                ->where('order_progress.status_order','finish')
                ->where('order_action.take_by',$request->user_id)
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function orderCheckout(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'cart_id' => 'required',
    		'user_id' => 'required',
    		'name' => 'required',
    		'email' => 'required',
    		'phone' =>  'required',
    		'address_1' => 'required',
    		'lat' => 'required',
    		'lng' => 'required',
    		'address_2' => 'required',
    		'city_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {

    		DB::beginTransaction();

    		try {

	    		// get cart & detail
	    		$user = User::find($request->user_id);
	    		$cart = Cart::find($request->cart_id);
	    		$cartDetail = CartDetail::where('cart_id',$request->cart_id)->get();
                $discount = 0;

	    		// move data to order
	    		$order['invoice_no'] = uniqid();
	    		$order['user_id'] = $request->user_id;
	    		$order['subtotal'] = $cart->subtotal;
	    		if(!empty($request->voucher_id)) {
	    			$voucher = Voucher::find($request->voucher_id);
                    foreach($cartDetail as $key => $val) {
                        $qry = Product::where('id',$val->product_id)->where('category_id',$request->voucher_category_id)->first();

                        if($qry) {
                            if($user->role_id == 2) {
                                $price = $qry->price_for_customer;
                            }
                            elseif($user->role_id == 3 || $user->role_id == 4) {
                                $price = $qry->price_for_reseller;
                            }
                        }
                        $discount = (float)(($price * $val->qty * $voucher->discount_rate) / 100);

                        $order['discount'] = $discount;
                        $order['total'] = (float)($cart->subtotal - $discount);
                    }
	    		}
	    		else {
	    			$order['discount'] = $cart->discount;
	    			$order['total'] = $cart->total;
	    		}
	    		$order['tax'] = $cart->tax;
	    		$createOrder = Order::create($order);

                // store voucher use
                if(!empty($request->voucher_id)) {
                    $voucherUse['order_id'] = $createOrder->id;
                    $voucherUse['voucher_id'] = $request->voucher_id;
                    $createVoucherUse = VoucherUse::create($voucherUse);
                }

	    		// move data to order detail
	    		foreach($cartDetail as $key => $val) {

	    			$product = Product::find($val->product_id);
	    			if($user->role_id == 2) {
	    				$price = $product->price_for_customer;
	    			}
	    			elseif($user->role_id == 3 || $user->role_id == 4) {
	    				$price = $product->price_for_reseller;
	    			}

                    // check if orderId & categoryId already exists do not create new record
                    $checkOrderProgress = OrderProgress::where('order_id', $createOrder->id)->where('category_id',$product->category_id)->first();

                    if(count($checkOrderProgress) == 0) {
                        $orderProgress['order_id'] = $createOrder->id;
                        $orderProgress['category_id'] = $product->category_id;
                        $orderProgress['status_order'] = 'new';
                        $orderProgress['status_payment'] = 'pending';
                        $orderProgress['status_progress'] = 'waiting';
                        $createOrderProgress = orderProgress::create($orderProgress);
                    }

                    $orderDetail['order_progress_id'] = $createOrderProgress->id;
	    			$orderDetail['order_id'] = $createOrder->id;
		    		$orderDetail['product_id'] = $val->product_id;
		    		$orderDetail['qty'] = $val->qty;
                    $orderDetail['base_price'] =  $price;
                    $orderDetail['nego_price'] =  $price;
                    $orderDetail['category_id'] = $product->category_id;
		    		$createOrderDetail = OrderDetail::create($orderDetail);

		    		// create order item detail from order detail
		    		for($i = 0; $i < $createOrderDetail->qty; $i++) {
		    			$orderItemDetail['order_detail_id'] = $createOrderDetail->id;
		    			$orderItemDetail['product_id'] = $createOrderDetail->product_id;
		    			$orderItemDetail['serial_number'] = "";
		    			$createOrderItemDetail = OrderItemDetail::create($orderItemDetail);
		    		}
	    		}

	    		// create billing detail
	    		$orderBilling['order_id'] = $createOrder->id;
	    		$orderBilling['name'] = $request->name;
	    		$orderBilling['email'] = $request->email;
	    		$orderBilling['phone'] = $request->phone;
	    		$orderBilling['address_1'] = $request->address_1;
	    		$orderBilling['lat'] = $request->lat;
	    		$orderBilling['lng'] = $request->lng;
	    		$orderBilling['address_2'] = $request->address_2;
	    		$orderBilling['city_id'] = $request->city_id;
	    		$orderBilling['zip_code'] = $request->zip_code;
	    		$createOrderBilling = OrderBillingDetail::create($orderBilling);

	    		// remove cart & detail
	    		Cart::where('id',$request->cart_id)->delete();
	    		CartDetail::where('cart_id',$request->cart_id)->delete();

    		} catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();

            // send push notification to Reseller & Dealer based on radius of Order's LatLng

            // convert from degrees to radians
            $latFrom = deg2rad($request->lat);
            $lonFrom = deg2rad($request->lng);
            $earthRadius = 6371; // in km

            $temp = OrderProgress::where('order_id', $createOrder->id)->get();

            $registrationIds = [];

            $flag_reseller = 0;
            $flag_dealer = 0;

            foreach($temp as $key => $val) {
                $category = ProductCategory::where('id', $val->category_id)->first();

                // FIND RESELLER WITH ORDER'S CATEGORY AND COUNT THE DISTANCE

                $resellers = Reseller::where($category->slug, 1)->get();
                
                $count_reseller = 0;
                foreach($resellers as $reseller) {
                    $latTo = deg2rad($reseller->lat);
                    $lonTo = deg2rad($reseller->lng);

                    $latDelta = $latTo - $latFrom;
                    $lonDelta = $lonTo - $lonFrom;

                    $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                    cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

                    // 1.6 for convert in miles to km
                    // x2 for set exact distance
                    $distance = (int)(($angle * $earthRadius) * 2);

                    if($distance <= 25) {
                        $fcm_reseller = FCM::where('user_id', $reseller->identifier)->select('fcm_token')->get();
                        
                        foreach($fcm_reseller as $fr) {
                            array_push($registrationIds, $fr->fcm_token);
                            $count_reseller++;
                        }
                    }
                }

                if($count_reseller == 0) {
                    foreach($resellers as $reseller) {
                        $latTo = deg2rad($reseller->lat);
                        $lonTo = deg2rad($reseller->lng);

                        $latDelta = $latTo - $latFrom;
                        $lonDelta = $lonTo - $lonFrom;

                        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                        cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

                        // 1.6 for convert in miles to km
                        // x2 for set exact distance
                        $distance = (int)(($angle * $earthRadius) * 2);

                        if($distance <= 40) {
                            $fcm_reseller = FCM::where('user_id', $reseller->identifier)->select('fcm_token')->get();
                            
                            foreach($fcm_reseller as $fr) {
                                array_push($registrationIds, $fr->fcm_token);
                                $flag_reseller++;
                            }
                        }
                    }
                }


                // FIND DEALER WITH ORDER'S CATEGORY AND COUNT THE DISTANCE

                $dealers = Dealer::where($category->slug, 1)->get();

                $count_dealer = 0;
                foreach($dealers as $dealer) {
                    $latTo = deg2rad($dealer->lat);
                    $lonTo = deg2rad($dealer->lng);

                    $latDelta = $latTo - $latFrom;
                    $lonDelta = $lonTo - $lonFrom;

                    $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                    cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

                    // 1.6 for convert in miles to km
                    // x2 for set exact distance
                    $distance = (int)(($angle * $earthRadius) * 2);

                    if($distance <= 25) {
                        $fcm_dealer = FCM::where('user_id', $dealer->identifier)->select('fcm_token')->get();
                        
                        foreach($fcm_dealer as $fd) {
                            array_push($registrationIds, $fd->fcm_token);
                            $count_dealer++;
                        }
                    }
                }

                if($count_dealer == 0) {
                    foreach($dealers as $dealer) {
                        $latTo = deg2rad($dealer->lat);
                        $lonTo = deg2rad($dealer->lng);

                        $latDelta = $latTo - $latFrom;
                        $lonDelta = $lonTo - $lonFrom;

                        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                        cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));

                        // 1.6 for convert in miles to km
                        // x2 for set exact distance
                        $distance = (int)(($angle * $earthRadius) * 2);

                        if($distance <= 40) {
                            $fcm_dealer = FCM::where('user_id', $dealer->identifier)->select('fcm_token')->get();
                            
                            foreach($fcm_dealer as $fd) {
                                array_push($registrationIds, $fd->fcm_token);
                                $flag_dealer++;
                            }
                        }
                    }
                }
            }

            if($flag_reseller == 0 && $flag_dealer == 0) {
                // report to Brother

            }
            else {

                // PUSH NOTIFICATION
                define('API_ACCESS_KEY', 'AAAAmu-xOoc:APA91bFE75JDf44CQ9dU_bYmrYPaEVDZgNBcLf7AH89XMD-42uCxO5rrxyELX8hj6z4kCnWxJGWhddZ9cy1JZLW_G6vNUl-SS2K1lFGM5ZSjl_OaAHi4lvkboZhvoBdEEOOpLoUvTLKD');

                $msg = array
                (
                    'title' => "New Order",
                    'body' => "One new order. Check it out!",
                    'vibrate' => 1,
                    'sound' => 'default',
                    'badge' => 1
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
            
            // send order receipt via email to user

    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }

    public function orderTake(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'order_id' => 'required',
            'category_id' => 'required',
    		'user_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {
    		DB::beginTransaction();

    		try {
    			$order = OrderProgress::where('order_id',$request->order_id)
                        ->where('category_id',$request->category_id)
                        ->first();

    			if($order->status_order == 'new') {
                    $orderAction['order_progress_id'] = $order->id;
	    			$orderAction['order_id'] = $request->order_id;
                    $orderAction['category_id'] = $request->category_id;
	    			$orderAction['take_by'] = $request->user_id;
	    			OrderAction::create($orderAction);

	    			OrderProgress::where('order_id',$request->order_id)
                    ->where('category_id',$request->category_id)
                    ->update([
	    				'status_order' => 'progress',
	    				'status_progress' => 'offering'
	    			]);
	    		}
	    		else {
	    			return response()->json(['data' => [], 'message' => ['This order has been taken before.']]);
	    		}

    		} catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();

            // send push notification
            $order_user = Order::where('id', $request->order_id)->first();
            $this->_sendPushNotification($order_user->user_id, "Order Status", "Your order has been taken.");

    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }

    public function orderApprove(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'order_id' => 'required',
            'category_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {
    		OrderProgress::where('order_id',$request->order_id)
            ->where('category_id',$request->category_id)
    		->update([
    			'status_progress' => 'approved',
                'status_payment' => 'accept'
    		]);

            $order = OrderAction::where('order_id',$request->order_id)
                    ->where('category_id',$request->category_id)
                    ->first();

            // send push notification
            $this->_sendPushNotification($order->take_by, "Order Status", "Your offer has been approved.");

    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }

    public function orderHistoryNew(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'user_id' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {
    		$orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('product_category', 'order_progress.category_id', '=', 'product_category.id')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'product_category.name as category_name'
                )
                ->where('order.user_id',$request->user_id)
                ->where('order_progress.status_order','new')
                ->orderBy('order.id','DESC')
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
    	}
    }

    public function orderHistoryProgress(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('order_action','order_progress.id','=','order_action.order_progress_id')
                ->join('product_category', 'order_progress.category_id', '=', 'product_category.id')
                ->leftJoin('reseller','order_action.take_by','=','reseller.identifier')
                ->leftJoin('dealer','order_action.take_by','=','dealer.identifier')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'reseller.store_name as reseller_store_name', 'reseller.name as reseller_name', 'reseller.phone as reseller_phone', 'reseller.address_1 as reseller_address1', 'reseller.address_2 as reseller_address2', 'dealer.store_name as dealer_store_name', 'dealer.name as dealer_name', 'dealer.phone as dealer_phone', 'dealer.address_1 as dealer_address1', 'dealer.address_2 as dealer_address2', 'product_category.name as category_name', 'order_action.take_by as seller_id'
                )
                ->where('order.user_id',$request->user_id)
                ->where('order_progress.status_order','progress')
                ->orderBy('order.id','DESC')
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function orderHistoryCancel(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $orders = Order::join('order_progress','order.id','=','order_progress.order_id')
                ->join('order_cancel','order_progress.id','=','order_cancel.order_progress_id')
                ->join('product_category', 'order_progress.category_id', '=', 'product_category.id')
                ->select(
                    'order.id as order_id', 'order.created_at as date', 'order.invoice_no', 
                    'order_progress.category_id', 'order_progress.status_order', 'order_progress.status_progress', 'order_cancel.reason', 'product_category.name as category_name'
                )
                ->where('order.user_id',$request->user_id)
                ->where('order_progress.status_order','cancel')
                ->orderBy('order.id','DESC')
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function orderHistoryFinish(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $orders = Order::Join('order_progress','order.id','=','order_progress.order_id')
                ->Join('product_category','order_progress.category_id','=','product_category.id')
                ->select('order.id as order_id','order.created_at as date','order.invoice_no','order_progress.category_id','order_progress.status_order','order_progress.status_progress','product_category.name as category_name')
                ->where('order.user_id','=',$request->user_id)
                ->where('order_progress.status_order','=','finish')
                ->orderBy('order.id','DESC')
                ->get();

            if(count($orders) > 0) {
                foreach($orders as $order) {
                    $orderItems = OrderDetail::join('product','order_detail.product_id','=','product.id')
                            ->join('product_category', 'product.category_id', '=', 'product_category.id')
                            ->where('order_detail.order_id', $order->order_id)
                            ->where('order_detail.category_id', $order->category_id)
                            ->select('order_detail.product_id', 'product.product_name', 'order_detail.qty', 'order_detail.base_price', 'order_detail.nego_price')
                            ->orderBy('order_detail.id', 'DESC')
                            ->get();

                    $itemDetail[$order->order_id][$order->category_name] = $orderItems;
                }
            }
            else {
                $itemDetail = [];
            }

            $data = [
                "orders" => $orders,
                "itemDetail" => $itemDetail
            ];

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
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

    public function orderCancel(Request $request)
    {
    	$val = Validator::make($request->all(), [
    		'order_id' => 'required',
            'category_id' => 'required',
    		'user_id' => 'required',
    		'reason' => 'required'
    	]);

    	if($val->fails()) {
    		return response()->json(['data' => [], 'message' => $val->errors()->all()]);
    	}
    	else {

    		DB::beginTransaction();
    		try {

    			$order = OrderProgress::where('order_id',$request->order_id)
                        ->where('category_id',$request->category_id)
                        ->first();

    			if($order->status_order == 'new' || $order->status_order == 'progress') {
                    $orderCancel['order_progress_id'] = $order->id;
	    			$orderCancel['order_id'] = $request->order_id;
                    $orderCancel['category_id'] = $request->category_id;
		    		$orderCancel['cancel_by'] = $request->user_id;
		    		$orderCancel['reason'] = nl2br($request->reason);
		    		OrderCancel::create($orderCancel);

                    OrderProgress::where('order_id',$request->order_id)
                        ->where('category_id',$request->category_id)
                        ->update(['status_order' => 'cancel']);

            //         if($check->user_id == $request->user_id) {
    		    		// OrderProgress::where('order_id',$request->order_id)
            //             ->where('category_id',$request->category_id)
            //             ->update(['status_order' => 'cancel']);
            //         }
            //         else {
            //             OrderProgress::where('order_id',$request->order_id)
            //             ->where('category_id',$request->category_id)
            //             ->update(['status_order' => 'new', 'status_progress' => 'waiting']);
            //         }
	    		}
	    		else {
	    			return response()->json(['data' => [], 'message' => ['Current status of this order is '.$order->status_order]]);
	    		}

    		} catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();

            // send push notification
            $check = Order::where('id', $request->order_id)->first();
            
            if($check->user_id == $request->user_id) {
                $orderAction = OrderAction::where('order_id', $request->order_id)
                ->where('category_id', $request->category_id)
                ->first();

                if(count($orderAction) == 1) {
                    $this->_sendPushNotification($orderAction->take_by, "Order Status", "The order has been cancelled by buyer.");
                }
            }
            else {
                $this->_sendPushNotification($check->user_id, "Order Status", "Your order has been cancelled by seller.");
            }

    		return response()->json(['data' => [], 'message' => ['OK']]);
    	}
    }

    public function getOffering(Request $request)
    {
        $val = Validator::make($request->all(), [
            'order_id' => 'required',
            'category_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $data = OrderDetail::select('product.product_name','order_detail.nego_price','order_detail.order_id','order_detail.product_id')
                    ->leftJoin('product','order_detail.product_id','=','product.id')
                    ->where('order_detail.category_id',$request->category_id)
                    ->where('order_detail.order_id',$request->order_id)
                    ->get();

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function orderOffering(Request $request)
    {
        $data = $request->json()->all();

        for($i=0;$i<count($data['item']);$i++) {
            $orderDetail['nego_price'] = $data['item'][$i]['price'];
            $updateOrderDetail = OrderDetail::where('order_id','=',$data['order_id'])
                                ->where('product_id','=',$data['item'][$i]['product_id'])
                                ->update($orderDetail);
        }

        OrderProgress::where('order_id',$data['order_id'])
        ->where('category_id',$data['category_id'])
        ->update([
            'status_progress' => 'approval'
        ]);

        // send push notification
        $order = Order::where('id', $data['order_id'])->first();
        $this->_sendPushNotification($order->user_id, "Price Offering", "You have new offering on your order.");

        return response()->json(['data' => [], 'message' => ['OK']]);
    }

    public function getLicenseNumber(Request $request)
    {
        $val = Validator::make($request->all(), [
            'category_id' => 'required',
            'order_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            $orderdetail = OrderDetail::select('id')
                        ->where('order_detail.category_id',$request->category_id)
                        ->where('order_detail.order_id',$request->order_id)
                        ->get();

            $id = [];
            foreach ($orderdetail as $key => $value) {
               array_push($id, $value->id);
            }

            $data = OrderItemDetail::select('product.product_name','order_item_detail.id as order_item_detail_id')
                    ->leftJoin('product','order_item_detail.product_id','=','product.id')
                    ->whereIn('order_item_detail.order_detail_id',$id)
                    ->get();

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    public function orderLicenseNumber(Request $request)
    {
        $data = $request->json()->all();

        for($i=0;$i<count($data['data']);$i++) {
                $orderLicenseNumber['serial_number'] = $data['data'][$i]['serial_number'];
                $updateOrderItemDetail = OrderItemDetail::where('id',$data['data'][$i]['order_item_detail_id'])
                                        ->update($orderLicenseNumber);
        }   

        OrderProgress::where('order_id',$data['order_id'])
        ->where('category_id',$data['category_id'])
        ->update([
            'status_payment' => 'settlement',
            'status_progress' => 'delivery order'
        ]);

        // send push notification
        $order = Order::where('id', $data['order_id'])->first();
        $this->_sendPushNotification($order->user_id, "Order Status", "Your order is being prepared by seller and set out to delivery");

        return response()->json(['data' => [], 'message' => ['OK']]);
    }

    public function markAsComplete(Request $request)
    {
        $val = Validator::make($request->all(), [
            'category_id' => 'required',
            'order_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {
            
            $update = OrderProgress::where('order_id', $request->order_id)
                    ->where('category_id', $request->category_id)
                    ->update([
                        'status_order' => 'finish',
                        'status_progress' => 'closed'
                    ]);

            // send push notification
            $order = Order::where('id', $request->order_id)->first();
            $this->_sendPushNotification($order->user_id, "Order Status", "You order has been marked to complete by seller.");

            return response()->json(['data' => $data, 'message' => ['OK']]);
        }
    }

    protected function _sendPushNotification($user_id, $title, $body) {
        // API access key from Google API's Console
        define('API_ACCESS_KEY', 'AAAAmu-xOoc:APA91bFE75JDf44CQ9dU_bYmrYPaEVDZgNBcLf7AH89XMD-42uCxO5rrxyELX8hj6z4kCnWxJGWhddZ9cy1JZLW_G6vNUl-SS2K1lFGM5ZSjl_OaAHi4lvkboZhvoBdEEOOpLoUvTLKD');

        $registrationIds = array();

        $recipients = FCM::where('user_id',$user_id)->select('fcm_token')->get();

        foreach ($recipients as $recipient) {
            array_push($registrationIds, $recipient->fcm_token);
        }

        $msg = array
        (
            'title' => $title,
            'body' => $body,
            'vibrate' => 1,
            'sound' => 'default',
            'badge' => 1
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
