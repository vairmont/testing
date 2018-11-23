<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use Auth;
use DB;
use Hash;
use App\User;
use App\Agen;
use App\Customer;
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
}

