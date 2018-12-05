<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\OrderDetail;
use App\Prefix;
use App\Operator;
use App\User;
use App\Address;
use App\Customer;
use App\Reversal;
use App\Commission;
use App\DigitalProduct;
use App\OrderDigital;
use App\Agen;
use App\WaneeHistory;
use DB;
use App\FCM;


class PaymentController extends Controller
{
    public  function createInvoice (Request $request) {

			// API access key from Google API's Console
        // DEVELOP
   			// define('API_ACCESS_KEY', 'Basic eG5kX2RldmVsb3BtZW50X09vQ0NmTDV5MExlc2xNWmdLZElIV2FTWTRMMTlJWjl4WEd5UnhuMkxlTHlqQ3c1emdROg==');

        // PRODUCTION
        define('API_ACCESS_KEY', 'Basic eG5kX3Byb2R1Y3Rpb25fUG9FZkw1eTBMZXNsTVpnS2RJSFdhU1k0TDE5SVo5eFhHeVJ4bjJMZUx5akN3NXpnUTo=');


            $curl = curl_init();

	        $headers = array
	        (
	            'Authorization: '.API_ACCESS_KEY,
	            'Content-Type: application/json'
	        );

            $end_point = 'https://api.xendit.co/v2/invoices';

            $data['external_id'] = $request->invoice_no;
            $data['amount'] = $request->total;
            $data['payer_email'] = 'jorjonna@gmail.com';
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

    if($request->description == 'digital'){
        $order = OrderDigital::where('invoice_no','=',$request->external_id)->first();
         $user = User::where('id', '=', $order->user_id)->first();

            if($request->status == 'SETTLED'){
                $order->status_payment = 'settled';
                $order->payment_method = $request->payment_method;
                $order->save();
            }
            else if($request->status == 'PAID'){
                 //untuk Customer
             if($user->role_id != 5)
              {
                $customer = Customer::where('identifier','=',$user->id)->first();
                $agen = Agen::where('agen.id', '=', $customer->agen_id)
                ->first();
                
                $incentive = $order->total * 0.01;
                
                $commission_pph = $incentive * 0.02;
                $commission_netto = $incentive - $commission_pph;
                
                $commission = new Commission;
                $commission->order_id = $order->id + 100000;
                $commission->agen_id = $customer->agen_id;
                $commission->incentive = $incentive;
                $commission->commission_pph = $commission_pph;
                $commission->commission_netto = $commission_netto;
                $commission->margin_penjualan = 0;
                $commission->save();

                $history = new WaneeHistory;
                $history->user_id = $agen->identifier;
                $history->amount =  $commission_netto;
                $history->saldo_akhir = $agen->wanee + $commission_netto;
                $history->reason = 'Pembelian Pulsa';
                $history->save();
              }

                // #curl
                $ch = curl_init(); 

                $idrs = 'DR1108';
                $user = '8CC9B6';
                $pin = 'BFGH4I';
                $pass = 'E0A5F6';
                $kode = $order->product_code;
                $tujuan = $order->phone;
                $idtrx = $order->invoice_no;
                // set url 
                curl_setopt($ch, CURLOPT_URL, "http://202.146.39.54:8030/api/h2h?id=".$idrs."&pin=".$pin."&user=".$user."&pass=".$pass."&kodeproduk=".$kode."&tujuan=".$tujuan."&counter=1&idtrx=".$idtrx); 

                //return the transfer as a string 
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

                // $output contains the output string 
                $output = curl_exec($ch); 

                // close curl resource to free up system resources 
                curl_close($ch);

                $res = json_decode($output,true);
                // send push notif ke agen
                $this->_sendPushNotification($order->agen_id, "Pulsa", "Customer Membeli Pulsa.");
                $order->status_payment = 'paid';
                $order->payment_method = $request->payment_method;
                $order->save();
            }
            
            else if($request->status == 'PENDING'){
                $order->status_payment = 'pending';
                $order->payment_method = $request->payment_method;
                $order->save();
            }
            
    }

    else if($request->description == 'sembako'){
           
        $order = Order::where('invoice_no','=',$request->external_id)->first();
        $user = User::where('id', '=', $order->user_id)->first();
            if($request->status == 'SETTLED'){
                $order->status = 10;
                $order->payment_status = $request->status;
                $order->payment = $request->payment_method;
                $order->save();
                return 2;
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

                $orderDetail = OrderDetail::where('order_id', '=', $order->id)->first();
                $name = Customer::where('identifier', '=', $order->user_id)->first();
                
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
                  'OLSHOP_RECEIVER_PHONE' => $user->phone,
                  'OLSHOP_QTY' => $orderDetail->qty,
                  'OLSHOP_WEIGHT' => 8,
                  'OLSHOP_GOODSDESC' => 'Paket Sembako Rp. 100.000',
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
                  $history->user_id = $user->id;
                  $history->amount = $commission_netto;
                  $history->saldo_akhir = $agen->wanee + $commission_netto;
                  $history->reason = 'Komisi Agen';
                  $history->save();

                  $komisi = Agen::where('agen.identifier', '=', $order->agen_id)
                                ->update([
                            'wanee' => $history->saldo_akhir
                        ]);    

            $order->shipment = 'JNE'; 
            $order->airway_bill = $resi['detail'][0]['cnote_no'];    
            $order->status = 9;
            $order->payment_status = $request->status;
            $order->payment = $request->payment_method;
            $order->save();
                
            }
            else if($request->status == 'PENDING'){
               
            $order->status = 7;
            $order->payment_status = $request->status;
            $order->payment = $request->payment_method;
            $order->save();
            }
        }

    return response()->json(['data' => [], 'message' => ['OK']]);
    }

    
   public function paymentSuccess(Request $request){
           return view('payment.paymentsuccess')->withTitle('Payment');   
    }

    protected function _sendPushNotification($user_id, $title, $body) {
        // API access key from Google API's Console
        define('API_ACCESS_KEY', 'AAAA6cPylp8:APA91bFB5i1sBcapzkGUd23jb8V7ojwjnoonnBlX317_IeVt-jxk5_WjSNHlhVrVn882ZcTWH4Nn5KOfr6onBetNT4PoVVn7olWyA7uSCXiy1DY7KVPEdYPgtNEkMfl8nhgvcYefNcxm');

        $registrationIds = array();

        $recipients = FCM::where('user_id',$user_id)->select('fcm_token')->get();

        foreach ($recipients as $recipient) {
            array_push($registrationIds, $recipient->fcm_token);
        }

        $msg = array
        (
            'title' => $title,
            'body' => $body,
            'vibrate' => "1",
            'sound' => 'default',
            'badge' => "1"
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
    public function digitalTes(Request $request){
        

        #curl
        $ch = curl_init(); 

        $idrs = 'DR1108';
        $user = '8CC9B6';
        $pin = 'BFGH4I';
        $pass = 'E0A5F6';
        $kode = $order->product_code;
        $tujuan = $order->phone;
        $idtrx = $order->invoice_no;
        // set url 
        curl_setopt($ch, CURLOPT_URL, "http://202.146.39.54:8030/api/h2h?id=".$idrs."&pin=".$pin."&user=".$user."&pass=".$pass."&kodeproduk=".$kode."&tujuan=".$tujuan."&counter=1&idtrx=".$idtrx); 

        //return the transfer as a string 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        // $output contains the output string 
        $output = curl_exec($ch); 

        // close curl resource to free up system resources 
        curl_close($ch);

        $res = json_decode($output,true);
        
        // send sms to requested number
        $userkey = "ky7049";
        $passkey = "go2018";
        $telepon = $request->phone;
        $message = 'abc';
        $url = "https://alpha.zenziva.net/apps/smsapi.php";
        $curlHandle = curl_init();
        curl_setopt($curlHandle, CURLOPT_URL, $url);
        curl_setopt($curlHandle, CURLOPT_POSTFIELDS, 'userkey='.$userkey.'&passkey='.$passkey.'&nohp='.$telepon.'&pesan='.urlencode($message));
        curl_setopt($curlHandle, CURLOPT_HEADER, 0);
        curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
        curl_setopt($curlHandle, CURLOPT_POST, 1);
        $results = curl_exec($curlHandle);
        curl_close($curlHandle);

        return response()->json(['data' => [$res, $result], 'message' => ['OK']]);
    }
}
