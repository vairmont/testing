<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Voucher;
use App\Role;
use App\User;
use App\Order;
use Validator;
use Carbon;

class VoucherController extends Controller
{
    public function checkVoucher(Request $request) 
    {  

    	$data = Voucher::where('voucher_code','=',$request->voucher_code)
            ->where('quota','>',0)
            ->where('valid_until','>=',Carbon\Carbon::now())
            ->where('valid_from','<=',Carbon\Carbon::now())
            ->select('discount', 'cashback', 'product_type', 'voucher_code', 'min_purchase', 'bonus_item', 'quota', 'quota_per_account', 'min_purchase', 'max_purchase')
            ->first();
           
        if ($data != null) {

            if($data->discount > 0 && $data->discount < 100){
                $discountrate = $data->discount / 100;
            }
            else{
                $discountrate = 0;
            }

            if($data->discount > 100){
                $discount = $data->discount;
            }
            else{
                $discount = 0;
            }

            if($data->cashback > 0 && $data->cashback < 100){
                $cashbackrate = $data->cashback / 100;
            }
            else{
                $cashbackrate = 0;
            }

            if($data->cashback > 100){
                $cashback = $data->cashback;
            }
            else{
                $cashback = 0;
            }
            if ($request->subtotal < $data->min_purchase && $data->min_purchase > 0) {
                return response()->json(['data' => [], 'message' => ['Mohon Maaf, pembelian minimal untuk menggunakan kode voucher ini adalah Rp ' .number_format($data->min_purchase)]]);
            }
            if ($request->subtotal > $data->max_purchase && $data->max_purchase > 0) {
                return response()->json(['data' => [], 'message' => ['Mohon Maaf, pembelian melampaui batas maksimum yaitu Rp ' .number_format($data->max_purchase)]]);
            }
            //hitung quota
            $usage = Order::where('voucher_code', '=', $request->voucher_code)
                    ->count('voucher_code');

            if($usage > $data->quota){
                return response()->json(['data' => [], 'message' => ['Mohon maaf, batas pengguna kode voucher sudah habis.']]);
            }
            //hitung quota
            $count = Order::where('voucher_code', '=', $request->voucher_code)
                    ->where('user_id', '=', $request->get('user')->id)
                    ->count('voucher_code');
   
            if ($count >= $data->quota_per_account){
                return response()->json(['data' => [], 'message' => ['Mohon maaf, kode voucher ini hanya bisa digunakan 1 kali.']]);
            }
            return response()->json(['data' => [
                    'discountrate' => $discountrate,
                    'discount' => $discount,
                    'cashbackrate' => $cashbackrate,
                    'cashback' => $cashback
                    
                ], 'message' => ['OK']]);
        }
            else
            {
                return response()->json(['data' => [], 'message' => ['Invalid Voucher Code']]);
            }
    }
}