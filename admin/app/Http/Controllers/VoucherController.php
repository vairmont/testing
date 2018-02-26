<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Voucher;
use App\ProductCategory;

class VoucherController extends Controller
{
    public function create(Request $request)
    {
        // render view

        $vouchers = Voucher::Join('product_category','voucher.product_category','=','product_category.id')
                    ->select('voucher.*','product_category.name as category_name')
                    ->orderBy('id','asc');

        $keyword = $request->keyword;

        if(isset($keyword) && !empty($keyword)) {
            $vouchers = $vouchers->where('voucher_code', 'like', '%'.$keyword.'%');
        }

        $vouchers = $vouchers->Paginate(20);

        $productCategories = ProductCategory::all();

    	return view('voucher.create',compact('vouchers','request', 'productCategories'))->withTitle('Voucher');
    }

    public function store(Request $request)
    {
        // store data to DB

        $this->validate ($request,[
            'voucher_code' => 'required',
            'discount_rate' => 'required|numeric',
            'for' => 'required',
            'product_category' => 'required',
            'valid_from' => 'required',
            'valid_until' => 'required',
            'quota' => 'required'
        ]);
        
        $data['voucher_code'] = $request->voucher_code;
        $data['discount_rate'] = $request->discount_rate;
        $data['for'] = $request->for;
        $data['product_category'] = $request->product_category;
        $data['valid_from'] = $request->valid_from;
        $data['valid_until'] = $request->valid_until;
        $data['quota'] = $request->quota;
        $data['description'] = nl2br($request->description);
        
        $store = Voucher::create($data);

        return back()->withSuccess('New voucher has been created.');
    }

    public function update(Request $request, $id)
    {
        // update data
        $this->validate($request, [
            'voucher_code' => 'required',
            'discount_rate' => 'required|numeric',
            'for' => 'required',
            'product_category' => 'required',
            'valid_from' => 'required',
            'valid_until' => 'required',
            'quota' => 'required'
        ]);

        $data['voucher_code'] = $request->voucher_code;
        $data['discount_rate'] = $request->discount_rate;
        $data['for'] = $request->for;
        $data['product_category'] = $request->product_category;
        $data['valid_from'] = $request->valid_from;
        $data['valid_until'] = $request->valid_until;
        $data['quota'] = $request->quota;
        $data['description'] = nl2br($request->description);
        
        $update = Voucher::where('id',$id)->update($data);

        return back()->withSuccess('Voucher has been updated.');
    }

    public function delete(Request $request, $id)
    {
        // delete data
        if(!empty($id)) {
            $delete = Voucher::where('id',$id)->delete();

            return back()->withSuccess('Voucher has been deleted.');
        }
    }
}
