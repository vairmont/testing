<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Voucher;
use App\Role;
use Validator;
use Carbon;

class VoucherController extends Controller
{
    public function checkVoucher(Request $request) 
    {  
        $role = Role::where('id',$request->role_id)->first();

    	$data = Voucher::select('discount', 'cashback', 'product_type', 'voucher_code', 'min_purchase', 'bonus_item')
            ->where('voucher_code','=',$request->voucher_code)
            ->where('quota','!=',0)
            ->Where('valid_until','>=',Carbon\Carbon::now()->format('Y-m-d'))
            ->Where('valid_from','<=',Carbon\Carbon::now()->format('Y-m-d'))
            ->first();

            if($data->discount > 0 && $data->discount < 100){
                $discountrate = $data->discount / 100;
            }

            if($data->discount > 100){
                $discount = $data->discount;
            }

            if($data->cashback > 0 && $data->cashback < 100){
                $cashbackrate = $data->cashback / 100;
            }

            if($data->cashback > 100){
                $cashback = $data->cashback;
            }
            //hitung quota
            $usage = Order::where('voucher_code', '=', $request->voucher_code)
                    ->count('voucher_code');

            if($usage > $data->quota){
                return response()->json(['data' => [], 'message' => ['Mohon maaf, batas pengguna kode voucher sudah habis.']])
            }
            //hitung quota
            $count = Order::where('voucher_code', '=', $request->voucher_code)
                    ->where('user_id', '=', $request->get('user')->identifier)
                    ->count('voucher_code');

            if ($count >= $data->quota){
                return response()->json(['data' => [], 'message' => ['Mohon maaf, kode voucher ini hanya bisa digunakan 1 kali.']])
            }

            else
            {
                return response()->json(['data' => [], 'message' => ['Invalid Voucher Code']]);
            }
    }
}