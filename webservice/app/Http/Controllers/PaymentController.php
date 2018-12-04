<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\Prefix;
use App\Operator;
use App\User;
use App\Customer;
use App\Reversal;
use App\Commission;
use App\DigitalProduct;
use App\OrderDigital;
use App\Agen;
use App\WaneeHistory;
use DB;
use App\FCM;
use Illuminate\Http\Request;


class PaymentController extends Controller
{
    public  function createInvoice (Request $request) {

			// API access key from Google API's Console
   			define('API_ACCESS_KEY', 'Basic eG5kX2RldmVsb3BtZW50X09vQ0NmTDV5MExlc2xNWmdLZElIV2FTWTRMMTlJWjl4WEd5UnhuMkxlTHlqQ3c1emdROg==');


            $curl = curl_init();

	        $headers = array
	        (
	            'Authorization: '.API_ACCESS_KEY,
	            'Content-Type: application/json'
	        );

            $end_point = 'https://api.xendit.co/v2/invoices';

            $data['external_id'] = $request->invoice_no;
            $data['amount'] = $request->total;
            $data['payer_email'] = $request->email;
            $data['description'] = $request->type;

            // if (!empty($invoice_options['callback_virtual_account_id'])) {
            //     $data['callback_virtual_account_id'] = $invoice_options['callback_virtual_account_id'];
            // }

            $payload = json_encode($data);

            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($curl, CURLOPT_URL, $end_point);
            curl_setopt($curl, CURLOPT_POST, true);
		    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
		    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $payload);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

            $response = curl_exec($curl);
            curl_close($curl);

            $responseObject = json_decode($response,true);
 		
    	return response()->json(['data' => $responseObject, 'message' => ['OK']]);
    }

    public function invoiceCallback (Request $request){
		// {
		//     "id": "579c8d61f23fa4ca35e52da4",
		//     "user_id": "5781d19b2e2385880609791c",
		//     "external_id": "invoice_123124123",
		//     "is_high": true,
		//     "status": "PAID",
		//     "merchant_name": "Xendit",
		//     "amount": 50000,
		//     "payer_email": "albert@xendit.co",
		//     "description": "This is a description",
		//     "paid_amount": 50000,
		//     "payment_method": "POOL",
		//     "adjusted_received_amount": 47500,
		//     "updated": "2016-10-10T08:15:03.404Z",
		//     "created": "2016-10-10T08:15:03.404Z"
		// }
    

        if($request->description == 'sembako'){
        $order = Order::where('invoice_no','=',$request->external_id)->first();
            if($request->status == 'SETTLED'){
               $order->status = 10;
            }
            else if($request->status == 'PAID'){
             //JNE GET AWB
                $userkey = "TESTAPI";
                $passkey = "25c898a9faea1a100859ecd9ef674548";
                $addr1 = "Ruko Sutera Niaga 3 Blok C/10";
                $url = "http://apiv2.jne.co.id:10102/tracing/api/generatecnote";

                $add = Address::join('city', 'city.id', '=', 'address.city_id')
                          ->join('region', 'region.id', '=', 'address.region_id')
                          ->select('address.address as address2', 'region.name as region', 'city.name as city', 'address.zip as zip', 'region.code as code')
                          ->where('address.id', '=', $order->address_id)
                          ->first();

                $cart = Cart::where('user_id', '=', $request->get('user')->id)->first();
                $cartDetail = CartDetail::where('cart_id', '=', $cart->id)->first();
                $orderDetail = OrderDetail::where('order_id', '=', $order->id)->first();
                $name = Customer::where('identifier', '=', $order->user_id)->first();
                $product = Product::where('product.id', '=', $cartDetail->product_id)->first();
                
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
                  'OLSHOP_RECEIVER_NAME' => $name->name,
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

               $resi = json_decode($results, true);
              
                //update payment status
                $order->shipment = 'JNE'; 
               $order->airway_bill = $resi['detail'][0]['cnote_no'];
               $order->save();  
             
                //KOMISI
                 $incentiveDetails = OrderDetail::join('product', 'product.id', '=', 'order_detail.product_id')
                                ->join('incentive_category', 'incentive_category.id', '=', 'product.incentive_id')
                                ->where('order_id', '=', $order->id)
                                ->select('order_detail.price_for_customer', 'incentive_category.rate', 'order_detail.qty', 'product.promo_price', 'product.category_id')
                                ->get();

                  $incentive = 0;
                  $prices = 0;

                  foreach ($incentiveDetails as $detail) {
                      $prices += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty;
                      $incentive += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty * 0.95 * $detail->rate / 100;   
                      }     
                      
                   
                  $commission_pph = ($incentive + 0) * 0.02;
                  $commission_netto = $incentive - $commission_pph;
                  
                  $commission = new Commission;
                  $commission->order_id = $order->id;
                  $commission->agen_id = $order->agen_id;
                  $commission->incentive = $incentive;
                  $commission->commission_pph = $commission_pph;
                  $commission->commission_netto = $commission_netto;
                  $commission->margin_penjualan = 0;
                  $commission->save();

                  $agen = Agen::where('agen.identifier', '=', $order->agen_id)
                                ->select('agen.wanee')
                                ->first();

                  $history = new WaneeHistory;
                  $history->user_id = $request->get('user')->id;
                  $history->amount = $commission_netto;
                  $history->saldo_akhir = $agen->wanee + $commission_netto;
                  $history->reason = 'Komisi Agen';
                  $history->save();

                  $komisi = Agen::where('agen.identifier', '=', $request->get('user')->id)
                                ->update([
                    'wanee' => $history->saldo_akhir
                ]);
            $order->status = 9;
            }
            else if($request->status == 'PENDING')
            $order->status = 7;

            
            $order->payment_status = $request->status;
            $order->payment = $request->payment_method;
            $order->save();
        }

    	if($request->status == 'SETTLED'){
           $order->status = 9;
        }
    	else if($request->status == 'PAID')
        $order->status = 9;
    	else if($request->status == 'PENDING')
    	$order->status = 7;

        
    	$order->payment_status = $request->status;
    	$order->payment = $request->payment_method;
        $order->save();
  


    return response()->json(['data' => [], 'message' => ['OK']]);
    }

    
   public function paymentSuccess(Request $request){
           return view('payment.paymentsuccess')->withTitle('Payment');   
    }
}
