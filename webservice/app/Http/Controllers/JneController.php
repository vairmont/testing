<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use Hash;
use App\User;
use App\Agen;
use App\FCM;

class InsuranceController extends Controller
{
	public function getResi(Request $request)
	{
		
    //JNE GET AWB
      $userkey = "TESTAPI";
      $passkey = "25c898a9faea1a100859ecd9ef674548";
      $addr1 = "Ruko Sutera Niaga 3 Blok C/10";
      $url = "http://apiv2.jne.co.id:10102/tracing/api/generatecnote";

      $add = Address::join('city', 'city.id', '=', 'address.city_id')
                ->join('region', 'region.id', '=', 'address.region_id')
                ->select('address.address as address2', 'region.name as region', 'city.name as city', 'address.zip as zip', 'region.code as code')
                ->where('address.id', '=', $request->address_id)
                ->first();

      $fields = [
        'username' => $userkey,
        'api_key' => $passkey,
        'OLSHOP_BRANCH' => 'CGK000',
        'OLSHOP_CUST' => '10950700',
        'OLSHOP_ORDERID' => $order->invoice_no,
        'OLSHOP_SHIPPER_NAME' => 'GrosirOne',
        'OLSHOP_SHIPPER_ADDR1' => $addr1,
        'OLSHOP_SHIPPER_ADDR2' => '-',
        'OLSHOP_SHIPPER_CITY' => 'Tangerang',
        'OLSHOP_SHIPPER_ZIP' => 15325,
        'OLSHOP_SHIPPER_PHONE' => '08119500311',
        'OLSHOP_RECEIVER_NAME' => $request->customer_name,
        'OLSHOP_RECEIVER_ADDR1' => $add->address2,
        'OLSHOP_RECEIVER_ADDR2' => '-',
        'OLSHOP_RECEIVER_CITY' => $add->city,
        'OLSHOP_RECEIVER_ZIP' => $add->zip,
        'OLSHOP_RECEIVER_PHONE' => $request->get('user')->phone,
        'OLSHOP_QTY' => $orderDetail->qty,
        'OLSHOP_WEIGHT' => 8,
        'OLSHOP_GOODSDESC' => $product->product_name,
        'OLSHOP_GOODSVALUE' => '100000',
        'OLSHOP_GOODSTYPE' => 2,
        'OLSHOP_INS_FLAG' => 'N',
        'OLSHOP_ORIG' => 'TGR10000',
        'OLSHOP_DEST' => $add->code,
        'OLSHOP_SERVICE' => 'REG',
        'OLSHOP_COD_FLAG' => 'N',
        'OLSHOP_COD_AMOUNT' => 0

      ];
    
      $curlHandle = curl_init();
      curl_setopt($curlHandle, CURLOPT_URL, $url);
      curl_setopt($curlHandle, CURLOPT_POSTFIELDS, http_build_query($fields));
      curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array(
        'Accept : application/json',
        'Content-Type : application/x-www-form-urlencoded',
        'User-Agent : php-request'
        
      ));
      curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
      curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
      curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
      curl_setopt($curlHandle, CURLOPT_POST, 1);
      $results = curl_exec($curlHandle);
      curl_close($curlHandle);

     $res = json_decode($results, true);

     $order->airway_bill = $res['detail'][0]['cnote_no'];
     $order->save();		

		return response()->json(['data' => $agen, 'message' => ['OK']]);
    }

    
    public function updateStatusJne(Request $request){
      $userkey = "TESTAPI";
      $passkey = "25c898a9faea1a100859ecd9ef674548";
      $awb = Order::where('airway_bill', '!=', null)
              ->select('airway_bill', 'status', 'id')
              ->get();
              
      foreach ($awb as $resi) {
        $url = "http://apiv2.jne.co.id:10102/tracing/api/list/v1/cnote/".$resi->airway_bill;
        
      $fields = [
        'username' => $userkey,
        'api_key' => $passkey
      ];

       $curlHandle = curl_init();
      curl_setopt($curlHandle, CURLOPT_URL, $url);
      curl_setopt($curlHandle, CURLOPT_POSTFIELDS, http_build_query($fields));
      curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array(
        'Accept : application/json',
        'Content-Type : application/x-www-form-urlencoded',
        'User-Agent : php-request'
        
      ));
      curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
      curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
      curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
      curl_setopt($curlHandle, CURLOPT_POST, 1);
      $results = curl_exec($curlHandle);
      curl_close($curlHandle);
      $res = json_decode($results, true);

          if($res['cnote']['pod_status'] == 'ON PROCESS'){
          
            Order::where('id', $resi->id)
              ->update([
                'status' => '6'
              ]);
          }

          if($res['cnote']['pod_status'] == 'DELIVERED'){
          
            Order::where('id', $resi->id)
              ->update([
                'status' => '7'
              ]);
          }

          if($res['cnote']['pod_status'] == 'RETURN TO SHIPPER'){
          
            Order::where('id', $resi->id)
              ->update([
                'status' => '10'
              ]);
          }

          if($res['cnote']['pod_status'] == 'UNDELIVERED'){
          
            Order::where('id', $resi->id)
              ->update([
                'status' => '11'
              ]);
          }

      sleep(1);
      }
     
     return response()->json(['data' => [], 'message' => ['OK']]);
     
    }

    public function trackingJne (Request $request){
      $userkey = "TESTAPI";
      $passkey = "25c898a9faea1a100859ecd9ef674548";
      $resi = $request->resi;
      $url = "http://apiv2.jne.co.id:10102/tracing/api/list/v1/cnote/".$resi;

      $fields = [
        'username' => $userkey,
        'api_key' => $passkey
      ];

       $curlHandle = curl_init();
      curl_setopt($curlHandle, CURLOPT_URL, $url);
      curl_setopt($curlHandle, CURLOPT_POSTFIELDS, http_build_query($fields));
      curl_setopt($curlHandle, CURLOPT_HTTPHEADER, array(
        'Accept : application/json',
        'Content-Type : application/x-www-form-urlencoded',
        'User-Agent : php-request'
        
      ));
      curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
      curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
      curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
      curl_setopt($curlHandle, CURLOPT_POST, 1);
      $results = curl_exec($curlHandle);
      curl_close($curlHandle);
      $res = json_decode($results, true);

     return response()->json(['data' => [$res['cnote']['pod_status']], 'message' => ['OK']]);
    }
  	
}

