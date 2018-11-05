<?php
namespace App\Http\Controllers;

use Carbon\Carbon;
use Validator;
use App\Prefix;
use App\Operator;
use App\User;
use App\Reversal;
use App\DigitalProduct;
use App\OrderDigital;
use App\Agen;
use App\WaneeHistory;
use DB;
use Illuminate\Http\Request;

class DigitalProductController extends Controller {
  public function checkOp(Request $request) {
   $operator = Prefix::join('operator','prefix.operator_id','=','operator.id')
                    ->where('prefix.prefix','=',$request->prefix)
                    ->first();

    if($operator == null)
    {
      return response()->json(['data' => [], 'message' => ['Maaf Nomor Tidak Terdaftar']]);
    }

    $list_product = DigitalProduct::where('operator_id','=',$operator->operator_id)
                      ->get();

    return response()->json(['data' => ['product' => $list_product,'operator' => $operator], 'message' => ['OK']]);
  }

  public function create(Request $request) {
    $user = User::where('id', '=', $request->get('user')->id)->first();

    $items = DigitalProduct::where('kode','=',$request->product_code)->first();

    $price = $items->price;

    if($user->role_id == 5){
      $price = $items->price * 0.98;
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
        #tanpa discount
        if($request->voucher_code != null)
        {
        $order->voucher_code = $request->voucher_code;
        $order->total = $price - $request->discount;
        }
        #discount
        else
        {
        $order->voucher_code = 0;
        $order->discount = 0;
        $order->total = $price;
        }
        $order->subtotal = $price;
        $order->status = 0;
        $order->status_payment = "done";
        $order->payment_method = "wallet";
        $order->save();

          if($user->role_id != 5)
          {
            $orderD = OrderDigital::find($order->id);
            $customer = Customer::where('identifier','=',$request->get('user')->id)->first();

            $incentive = $price * 0.01;
            
            $commission_pph = $incentive * 0.02;
            $commission_netto = $incentive - $commission_pph;
            
            $commission = new Commission;
            $commission->order_id = $orderD->id + 100000;
            $commission->agen_id = $customer->agen_id;
            $commission->incentive = $incentive;
            $commission->commission_pph = $commission_pph;
            $commission->commission_netto = $commission_netto;
            $commission->margin_penjualan = 0;
            $commission->save();

            $history = new WaneeHistory;
            $history->user_id = $request->get('user')->id;
            $history->amount = $orderD->total;
            if($customer->wanee < $orderD->total){
              return response()->json(['data' => [], 'message' => ['Saldo anda tidak']]);
            }
            $history->saldo_akhir = $customer->wanee - $orderD->total;
            $history->reason = 'Pembelian Pulsa';
            $history->save();

            $potong = Customer::where('customer.identifier', '=', $request->get('user')->id)
                          ->update([
                      'wanee' => $history->saldo_akhir
                      ]);
          }

          #kalau agen
          else
          {
          $agen = Agen::where('agen.identifier', '=', $request->get('user')->id)
                        ->select('agen.wanee')
                        ->first();

          $history = new WaneeHistory;
          $history->user_id = $request->get('user')->id;
          $history->amount = $order->total;
          if($agen->wanee < $order->total){
              return response()->json(['data' => [], 'message' => ['Saldo anda tidak']]);
          }
          $history->saldo_akhir = $agen->wanee - $order->total;
          $history->reason = 'Pembelian Pulsa';
          $history->save();

          $potong = Agen::where('agen.identifier', '=', $request->get('user')->id)
                        ->update([
                    'wanee' => $history->saldo_akhir
                    ]);
          }

      } catch(\Exception $e) {
          DB::rollback();
          throw $e;
      }
      DB::commit();
      #curl
        $ch = curl_init(); 

        $idrs = 'DR1108';
        $user = '8CC9B6';
        $pin = 'BFGH4I';
        $pass = 'E0A5F6';
        $kode = $request->product_code;
        $tujuan = $request->phone;
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
        return $res;
    #send push notif ke agen
    //$this->_sendPushNotification($order->agen_id, "Pulsa", "Customer Membeli Pulsa.");

    return response()->json(['data' => [], 'message' => $res['msg']]);
  }

  public function notification(Request $request){
      #updatestatus
      // $order = OrderDigital::where('invoice_no','=',$request->clientid)->update(['status' => $request->statuscode]);

      // $reversal = new Reversal;
      // $reversal->server_id = $request->serverid;
      // $reversal->client_id = $request->clientid;
      // $reversal->status_code = $request->statuscode;
      // $reversal->kp = $request->kp;
      // $reversal->msisdn = $request->msisdn;
      // $reversal->sn = $request->sn;
      // $reversal->msg = $request->msg;
      // $reversal->save();
    // return $request->sn;
      return response()->json(['data' => [$request->msisdn], 'message' => ['OK']]);
  }
}