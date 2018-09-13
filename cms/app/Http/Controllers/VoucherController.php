<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Voucher;
use DB;

class VoucherController extends Controller
{
    public function getVoucher(){
        $voucher = Voucher::get();
        return view('vouchers.voucher',compact('voucher'))->withTitle('Voucher');
    }

    public function addVoucher(Request $request){
    		DB::beginTransaction();

	    	try {

	    	// store to DB
	    	$data['voucher_code'] =  $request->voucher_code;
	    	$data['product_type'] =  $request->product_type;
	    	$data['valid_from'] = $request->valid_from;
	    	$data['valid_until'] = $request->valid_from;
	    	$data['quota'] =  $request->quota;
	    	$data['quota_per_account'] =  $request->quota_per_account;
	    	$data['discount'] = $request->discount;
	    	$data['cashback'] = $request->cashback;
	    	$data['min_purchase'] = $request->min_purchase;
	    	$data['bonus_item'] = $request->bonus_item;
	    	$data['description'] = $request->description;


	    	$store = Voucher::create($data);

	    	}catch(\Exception $e) {
	    		DB::rollback();
	    		throw $e;
	    	}

	    	DB::commit();

	    	return back()->withSuccess('New Voucher has been created.');
    }

}
