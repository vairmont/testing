<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Rating;
use App\Order;
use DB;

class RatingController extends Controller
{

    public function index(Request $request)
	{
        $item = Rating::select('value')
                    ->where('agen_id', '=', $request->get('user')->id)
                    ->avg('value');

        $rating = number_format($item, 2, '.', '');

        return response()->json(['data' => $rating, 'message' => ['OK']]);
    }

  public function addRating(Request $request)
  {
    if(empty($request->value)) {
        return response()->json(['data' => [], 'message' => ['Rating tidak boleh kosong']]);
    }
    else {

        $user_id = $request->get('user')->id;
        $order = Order::find($request->order_id);

        $data['order_id'] = $request->order_id;
        $data['agen_id'] = $order->agen_id;
        $data['customer_id'] = $user_id;
        $data['rating'] = $request->value;
        $data['notes'] = nl2br($request->notes);
        
        Rating::create($data);

        return response()->json(['data' => [], 'message' => ['OK']]);
    }
  }

}

