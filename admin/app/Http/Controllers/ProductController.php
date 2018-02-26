<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use DB;
use App\Product;
use App\ProductCategory;

class ProductController extends Controller
{
    public function create(Request $request)
    {
    	$products = Product::leftJoin('product_category','product.category_id','=','product_category.id')
        ->select(
                'product.id',
                'product.img_url',
                'product.brochure_url',
                'product.category_id',
                'product.product_name',
                'product_category.name as category_name',
                'product.price_for_customer',
                'product.price_for_reseller',
                'product.description'
            )
        ->orderBy('product_name','asc');

    	if(isset($request->keyword) && !empty($request->keyword)) {
    		$products = $products->where('product_name', 'like', '%'.$request->keyword.'%');
    	}

    	$products = $products->paginate(20);

        $categories = ProductCategory::orderBy('name','asc')->select('id','name')->get();

        return view('product.create', compact('products','request', 'categories'))->withTitle('Product');
    }

    public function store(Request $request)
    {
    	$this->validate($request, [
    		'product_name' => 'required',
    		'category_name' => 'required',
    		'price_for_customer' => 'required',
    		'price_for_reseller' => 'required',
    		'product_image' => 'mimes:jpeg,jpg,png'
    	]);

    	DB::beginTransaction();

    	try {

    	// upload image
    	if ($request->hasFile('product_image')) {
    		// will store in storage/app/image
    		$path = $request->file('product_image')->store('image');
		}

    	// store to DB
    	$data['product_name'] =  $request->product_name;
    	$data['category_id'] = $request->category_name;
    	$data['price_for_customer'] = $request->price_for_customer;
    	$data['price_for_reseller'] =  $request->price_for_reseller;
    	$data['description'] = $request->description;
    	$data['img_url'] = "storage/app/".$path;
    	$data['brochure_url'] = "";

    	$store = Product::create($data);

    	}catch(\Exception $e) {
    		DB::rollback();
    		throw $e;
    	}

    	DB::commit();

    	return back()->withSuccess('New Product has been added.');
    }

    public function update(Request $request, $id)
    {
    	if($request->action === 'Upload Brochure') {

    		$this->validate($request, [
    			'brochure' => 'required|mimes:pdf'
    		]);

    		DB::beginTransaction();

    		try{

	    		if($request->hasFile('brochure')) {
	    			// get brochure
	    			$product = Product::where('id',$id)->select('brochure_url')->first();
	    			// remove existing brochure
	    			if($product->brochure_url != "") {
	    				unlink("../".$product->brochure_url);
	    			}
	    			$path = $request->file('brochure')->store('brochure');

	    			// store new brochure
	    			$data['brochure_url'] = "storage/app/".$path;
	    			$update = Product::where('id', $id)->update($data);
	    		}

    		}catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();

    		return back()->withSuccess('New brochure has been uploaded.');

    	}
    	else if($request->action === 'Update Image') {

    		$this->validate($request, [
    			'product_image' => 'required|mimes:jpeg,jpg,png|max:2000'
    		]);

    		DB::beginTransaction();

    		try{

	    		if($request->hasFile('product_image')) {
	    			// get image
	    			$product = Product::where('id',$id)->select('img_url')->first();

	    			// remove existing image
	    			if($product->img_url != "") {
	    				unlink("../".$product->img_url);
	    			}
	    			$path = $request->file('product_image')->store('image');

	    			// store new image
	    			$data['img_url'] = "storage/app/".$path;
	    			$update = Product::where('id', $id)->update($data);
	    		}

    		}catch(\Exception $e) {
    			DB::rollback();
    			throw $e;
    		}

    		DB::commit();

    		return back()->withSuccess('New image has been uploaded.');

    	}
    	else if($request->action === 'Update Data') {

    		$this->validate($request, [
    			'product_name' => 'required',
    			'category_name' => 'required',
	    		'price_for_customer' => 'required',
	    		'price_for_reseller' => 'required',
    		]);

    		$data['product_name'] = $request->product_name;
    		$data['category_id'] = $request->category_name;
    		$data['price_for_customer'] = $request->price_for_customer;
    		$data['price_for_reseller'] = $request->price_for_reseller;
    		$data['description'] = $request->description;

    		$update = Product::where('id',$id)->update($data);

    		return back()->withSuccess("Product's data has been updated.");

    	}
    }

    public function delete(Request $request, $id)
    {

    	$data = Product::where('id',$id);

		$product = $data->select('img_url','brochure_url')->first();

		// remove image
		if($product->img_url != "") {
			unlink("../".$product->img_url);
		}

		// remove brochure
		if($product->brochure_url != "") {
			unlink("../".$product->brochure_url);
		}

		// remove data
		$delete = $data->delete();

    	return back()->withSuccess('Product has been deleted.');
    }
}
