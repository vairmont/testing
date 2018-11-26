<?php

namespace App\Http\Controllers;

use App\Commission;
use App\Constant\OrderStatus;
use Illuminate\Http\Request;
use Validator;
use DB;
use Carbon\Carbon;
use App\Order;
use App\OrderDetail;
use App\OrderBillingDetail;
use App\OrderCancel;
use App\Product;
use App\Family;
use App\Customer;
use App\Address;
use App\User;
use App\Agen;
use App\Cart;
use App\Chat;
use App\Store;
use App\WaneeHistory;
use App\CartDetail;
use App\FCM;
class WalletController extends Controller
{
  	
    public function cekSaldo(Request $request)
  {

    $custo = Customer::where('identifier', '=', $request->get('user')->id)->first();
 
    $datax = [
    "kodetransaksi"=> "01",
    "user"=> "grosirone",
    "password"=> "5b8598bed42b271cb8ec62c4bdd4f3ck",
    "nova"=> $custo->no_va,
    "idtrx"=> "0",
    "idmerchant"=> "47",
    "nominal"=> "0",
    "keterangan"=> $custo->terminal_id,
    "kodemitra"=> "004",
    "kodebank"=> "",
    "noref"=> "0",
    "tglexpired"=> ""
    ];
    
    $data = json_encode($datax);
    $URL   = 'http://182.23.53.58:20128/';
      $ch = curl_init($URL);

    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
    curl_setopt($ch, CURLOPT_POSTFIELDS, "$data");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY); 
    curl_setopt($ch, CURLOPT_TIMEOUT, 120);

    $datay = curl_exec($ch);
    $curl_errno = curl_errno($ch);
    $curl_error = curl_error($ch);
      

    curl_close($ch);
    $res = json_decode($datay, true);
    
    return response()->json(['data' => $res['nominal'], 'message' => ['OK']]);
    }

    public function paymentWallet(Request $request){
        $order = Order::where('invoice_no', '=', $request->invoice_no)->first();
        $custo = Customer::where('identifier', '=', $request->get('user')->id)->first();
        // Pemotongan saldo wallet
        $datax = [
        "kodetransaksi"=> "09",
        "user"=> "grosirone",
        "password"=> "5b8598bed42b271cb8ec62c4bdd4f3ck",
        "nova"=> $custo->no_va,
        "idtrx"=> $order->invoice_no,
        "idmerchant"=> "47",
        "nominal"=> $order->total,
        "keterangan"=> $custo->terminal_id,
        "kodemitra"=> "004",
        "kodebank"=> "",
        "noref"=> "0",
        "tglexpired"=> ""
        ];
        
        $data = json_encode($datax);
        $URL   = 'http://182.23.53.58:20128/';
          $ch = curl_init($URL);

        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
        curl_setopt($ch, CURLOPT_POSTFIELDS, "$data");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_ANY); 
        curl_setopt($ch, CURLOPT_TIMEOUT, 120);

        $datay = curl_exec($ch);
        $curl_errno = curl_errno($ch);
        $curl_error = curl_error($ch);
          

        curl_close($ch);
        $res = json_decode($datay, true);

        //check payment response status

        if(strpos($res['rc'], 'Saldo') !== false){
            return response()->json(['data' => [], 'message' => ['Saldo tidak cukup']]);
        }

        if(strpos($res['rc'], 'Sukses') !== false){
        //update payment status
        $order->payment_status = 'success';  
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
        $topup = customer::where('customer.identifier','=',$request->get('user')->id)
                  ->decrement('plafon_kredit', round($order->total));
        $product = Product::whereId($cartDetail->product_id)->first(); 
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

       $resi = json_decode($results, true);
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
              
           
          $commission_pph = ($incentive + 0) * $this->pph;
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

        #send push notif ke ag->e2
        $this->_sendPushNotification($order->agen_id, "Order Baru", "Ada order baru.");

        return response()->json(['data' => [$datay], 'nominal' => [$res['nominal']], 'invoice' => [$order->invoice_no], 'message' => ['OK']]);
        }

    }
}

