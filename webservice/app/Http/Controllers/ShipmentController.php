<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\Agen;

class ShipmentController extends Controller
{
    public function addShipment(Request $request) 
    {
    	$order = Order::whereId($request['order_id'])->first()
        ->update([
                'shipment' => $request->shipment
            ]);

	  return response()->json(['data' => [], 'message' => ['OK']]);	
    }

    public function updateShipmentMethod(Request $request) 
    {
    	$order = Agen::where('identifier', '=', $request->get('user')->id)->first()
        ->update([
                'shipment' => $request->shipment
            ]);

	  return response()->json(['data' => [], 'message' => ['OK']]);	
    }

}
