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

    public function requestOTP() {
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
            'otp' => $createVerifyCode->otp,
            'hash' => $createVerifyCode->hash
          ], 
          'message' => ['OK']
        ]);
    }

    public function verifyCheckAgen(Request $request)
    {
      $val = Validator::make($request->all(), [
        'otp' => 'required',
        'hash' => 'required',
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
          return response()->json(['data' => [], 'message' => ['Verifikasi gagal karena kode salah.']]);
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

        $password = rand(111111,999999);

        $user = User::where('id', '=', 'customer_id')
                ->update([
                  'password' => Hash::make($password);
                  'status' => 'active'
                ]);

        // send sms
        $userkey = "ky7049";
        $passkey = "go2018";
        $telepon = $user->phone;
        $message = "Password anda adalah (".$password."). Demi keamanan akun, segera ganti password anda di tab menu profile setelah login pertama kali.";
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
          return response()->json(['data' => [], 'message' => ['OK']]);
        }
        else {
          return response()->json(['data' => [], 'message' => ['Verifikasi gagal karena kode salah.']]);
        }
      }
    }
}
