<?php
namespace App\Http\Controllers;

use Carbon\Carbon;
use Validator;
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

class DigitalProductController extends Controller {
  public function checkOp(Request $request) {

    $subprefix = substr($request->prefix, -3);
    $prefix = substr_replace($subprefix, '0',0,0);
    $operator = Prefix::join('operator','prefix.operator_id','=','operator.id')
                    ->where('prefix.prefix','=',$prefix)
                    ->first();

    if($operator == null)
    {
      return response()->json(['data' => [], 'message' => ['Maaf Nomor Tidak Terdaftar']]);
    }

    $list_product = DigitalProduct::where('operator_id','=',$operator->operator_id)
                      ->where('type', '=', 'pulsa')
                      ->get();

    $list = DigitalProduct::where('operator_id','=',$operator->operator_id)
                      ->where('type', '=', 'data')
                      ->get();

    return response()->json(['data' => ['pulsa' => $list_product, 'paket' => $list, 'operator' => $operator], 'message' => ['OK']]);
  }

  public function create(Request $request) {
    $user = User::where('id', '=', $request->get('user')->id)->first();
    $customer = Customer::where('identifier', '=', $request->get('user')->id)->first();

    $items = DigitalProduct::where('kode','=',$request->product_code)->first();

    $price = $items->price;

    if($user->role_id == 5){
      $price = $items->price_agen;
    }

    if($user->role_id !== 5){
      $price = $items->price;
    }

    $today = date("Ymd");
    $rand = strtoupper(substr(uniqid(sha1(time())),0,4));
    $unique = $today . $rand;

    DB::beginTransaction();
      try {

            $order = new OrderDigital;
            $order->invoice_no = $unique;
            $order->product_code = $request->product_code;
            $order->phone = $request->phone;
            $order->user_id = $request->get('user')->id;
            $order->agen_id = $customer->agen_id;
           
            $order->voucher_code = $request->voucher_code;
            $order->discount = $request->discount;
            $order->total = $request->total;
            
            $order->subtotal = $price;
            $order->status = 0;
            $order->status_payment = "pending";
            $order->payment_method = "wallet";
            $order->save();

              // #kalau agen
              // else
              // {
              // $agen = Agen::where('agen.identifier', '=', $request->get('user')->id)
              //               ->select('agen.wanee')
              //               ->first();

              // $history = new WaneeHistory;
              // $history->user_id = $request->get('user')->id;
              // $history->amount = $order->total;
              // if($agen->wanee < $order->total){
              //     return response()->json(['data' => [], 'message' => ['Saldo anda tidak']]);
              // }
              // $history->saldo_akhir = $agen->wanee - $order->total;
              // $history->reason = 'Pembelian Pulsa';
              // $history->save();

              // $potong = Agen::where('agen.identifier', '=', $request->get('user')->id)
              //               ->update([
              //           'wanee' => $history->saldo_akhir
              //           ]);
              // }
          
          

      } catch(\Exception $e) {
          DB::rollback();
          throw $e;
      }
      DB::commit();
    #send push notif ke agen
    $this->_sendPushNotification($order->agen_id, "Pulsa", "Customer Membeli Pulsa.");

    return response()->json(['data' => $order->invoice_no, 'message' => ['OK']]);
  }

  public function orderHistoryDigital(Request $request) {

      $orders = OrderDigital::join('customer','customer.identifier','=','order_digital.user_id')
      ->where('user_id', '=', $request->get('user')->id)
      ->select('order_digital.*','customer.name as name')
      ->orderBy('created_at', 'desc')
      ->get();

      $result = [];
      foreach ($orders as $order) {
        $items = DigitalProduct::Join('order_digital', 'order_digital.product_code', '=', 'digital_product.kode')
          ->join('operator', 'operator.id', '=', 'digital_product.operator_id')
          ->where('order_digital.id', '=', $order->id)
          ->select('digital_product.type as type','digital_product.id as product_id', 'digital_product.kode', 'digital_product.name', 'digital_product.price','digital_product.price_agen', 'operator.name as operator')
          ->get();

        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->created_at)->format('d M Y H:i')
        ];
      }
      return response()->json($result, 200);
    }

  public function notification(Request $request){
      #updatestatus
      $order = OrderDigital::where('invoice_no','=',$request->clientid)->update(['status' => $request->statuscode]);

      // $userkey = "ky7049";
      // $passkey = "go2018";
      // $telepon = '08121957740';
      // $message = $order;
      // $url = "https://alpha.zenziva.net/apps/smsapi.php";
      // $curlHandle = curl_init();
      // curl_setopt($curlHandle, CURLOPT_URL, $url);
      // curl_setopt($curlHandle, CURLOPT_POSTFIELDS, 'userkey='.$userkey.'&passkey='.$passkey.'&nohp='.$telepon.'&pesan='.urlencode($message));
      // curl_setopt($curlHandle, CURLOPT_HEADER, 0);
      // curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
      // curl_setopt($curlHandle, CURLOPT_SSL_VERIFYHOST, 2);
      // curl_setopt($curlHandle, CURLOPT_SSL_VERIFYPEER, 0);
      // curl_setopt($curlHandle, CURLOPT_TIMEOUT,30);
      // curl_setopt($curlHandle, CURLOPT_POST, 1);
      // $results = curl_exec($curlHandle);
      // curl_close($curlHandle);
      return response()->json(['data' => [], 'message' => 'OK']);
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
}