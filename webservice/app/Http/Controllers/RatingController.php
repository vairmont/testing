<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Rating;
use App\Order;
use App\Agen;
use DB;

class RatingController extends Controller
{

    public function index(Request $request)
	{
        $agen = Agen::where('identifier','=', $request->get('user')->id)->first();

        $item = Rating::select('rating')
                    ->where('agen_id', '=', $agen->id)
                    ->avg('rating');

        $rating = number_format($item, 1, '.', '');

        $rate = [
        'rating' => $rating
        ];

        $save = Agen::where('identifier','=', $request->get('user')->id)
        ->update($rate);

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
        $rating = Rating::where('order_id', $request->order_id)->first();
        if ($rating != null ){
            return response()->json(['message' => ['Anda sudah memberikan rating untuk transaksi ini.']]);
        }
        $data['order_id'] = $request->order_id;
        $data['agen_id'] = $order->agen_id;
        $data['customer_id'] = $user_id;
        $data['rating'] = number_format($request->value, 1, '.', '');
        $data['notes'] = nl2br($request->notes);
        
        Rating::create($data);

        return response()->json(['data' => [], 'message' => ['OK']]);
    }
  }

}

