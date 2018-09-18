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

    	$data = Voucher::select('discount', 'cashback', 'product_type', 'voucher_code')
            ->where('voucher_code','=',$request->voucher_code)
            ->where('quota','!=',0)
            ->Where('valid_until','>=',Carbon\Carbon::now()->format('Y-m-d'))
            ->Where('valid_from','<=',Carbon\Carbon::now()->format('Y-m-d'))
            ->first();

            if(){

            }

            else
            {
                return response()->json(['data' => [], 'message' => ['Invalid Voucher Code']]);
            }
    }
}