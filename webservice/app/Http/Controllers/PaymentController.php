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

            $data['external_id'] = $request->external_id;
            $data['amount'] = $request->amount;
            $data['payer_email'] = $request->payer_email;
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

    	$order = Order::where('invoice_no','=',$request->external_id)
        		->update(['status' => 9,
                  'payment' => $request->payment_method,
                  'payemnt_status' => $request->status
              	]);




    	return ;
    }
}
