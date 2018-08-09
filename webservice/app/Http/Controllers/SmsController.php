<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\VerifyCode;
use App\Agen;
use App\Customer;
use Validator;
use Hash;
use App\User;

class SmsController extends Controller
{
    public function verifyRequest(Request $request)
    {
      $val = Validator::make($request->all(), [
        'phone' => 'required'
      ]);

      if($val->fails()) {
        return response()->json(['data' => [], 'message' => $val->errors()->all()]);
      }
      else {
        $otp = rand(10000,99999);

        // save code to DB
        $item['otp'] = $otp;
        $item['hash'] = Hash::make($otp);
        $createVerifyCode = VerifyCode::create($item);

        // send sms to requested number
            $userkey = "ky7049";
            $passkey = "go2018";
            $telepon = $request->phone;
            $message = "Kode verifikasi anda adalah (".$otp."). Terima kasih telah mendaftar di GrosirOne.";
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

            // $XMLdata = new SimpleXMLElement($results);
            // $status = $XMLdata->message[0]->text;

        return response()->json([
          'data' => [
            'code' => $createVerifyCode->otp,
            'hash_code' => $createVerifyCode->hash
          ], 
          'message' => ['OK']
        ]);
      }
    }

    public function verifyCheckAgen(Request $request)
    {
      $val = Validator::make($request->all(), [
        'otp' => 'required',
        'hash_code' => 'required',
        'agen_id' => 'required'
      ]);

      if($val->fails()) {
        return response()->json(['data' => [], 'message' => $val->errors()->all()]);
      }
      else {
        $verify = VerifyCode::where('otp',$request->otp)->where('hash', $request->hash)->first();
        if($verify) {

        $verify->delete();

        $user = User::join('agen', 'agen.identifier ', '=', 'users.id')
                ->where('agen.identifier', '=', 'users.id')
                ->update(['status' => 'active']);

          return response()->json(['data' => [], 'message' => ['OK']]);
        }
        else {
          return response()->json(['data' => [], 'message' => ['Verification failed because of invalid code.']]);
        }
      }
    }

    public function verifyCheckCustomer(Request $request)
    {
      $val = Validator::make($request->all(), [
        'otp' => 'required',
        'hash' => 'required',
        'customer_id' => 'required'
      ]);

      if($val->fails()) {
        return response()->json(['data' => [], 'message' => $val->errors()->all()]);
      }
      else {
        $verify = VerifyCode::where('otp',$request->otp)->where('hash', $request->hash)->first();
        if($verify) {

        $verify->delete();

        $user = User::join('customer', 'customer.identifier ', '=', 'users.id')
                ->where('customer .identifier', '=', 'users.id')
                ->update(['status' => 'active']);

          return response()->json(['data' => [], 'message' => ['OK']]);
        }
        else {
          return response()->json(['data' => [], 'message' => ['Verification failed because of invalid code.']]);
        }
      }
    }
}
