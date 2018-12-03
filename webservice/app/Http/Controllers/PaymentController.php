<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;



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

            $data['external_id'] = 'test';
            $data['amount'] = 80000;
            $data['payer_email'] = 'test@gmail.com';
            $data['description'] = 'Order';

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

		$data = file_get_contents("php://input");

    	$order = Order::where('invoice_no','=',$data['external_id'])->first();

    	if($data['status'] == 'SETTLED')
        $order->status = 9;
    	else if($data['status'] == 'PAID')
        $order->status = 9;
    	else if($data['status'] == 'PENDING')
    	$order->status = 7;

    	$order->payment_status = $data['status'];
    	$order->payment = $data['payment_method'];
        $order->save();
  


    	return 1;
    }

    
   public function paymentSuccess(Request $request){
           return view('payment.paymentsuccess')->withTitle('Payment');   
    }
}
