<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use DB;
use App\User;
use App\Agen;
use App\Customer;
use App\Rating;
use App\FCM;

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

        $rating = [
            'order_id' => $request->order_id,
            'agen_id' => $request->phone,
            'customer_id' => $request->customer_id,
            'value' => $request->value,
            'notes' => $request->notes
        ];

        $createRating = Rating::create($rating);
        return response()->json(['rating_id' => $createRating->id, 'message' => ['OK']]);
    	}
  }

}

