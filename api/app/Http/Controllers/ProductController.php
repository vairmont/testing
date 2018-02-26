<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Product;
use Validator;
use DB;

class ProductController extends Controller
{
	/*
		role id 2 = Customer 
		role id 3 & 4 = Reseller
	*/

	public function getProduct(Request $request) 
	{
		$val = Validator::make($request->all(), [
			'role_id' => 'required'
		]);

		if($val->fails()) {
			return response()->json(['data' => [], 'message' => $val->errors()->all()]);
		}
		else {
			$products = Product::Join('product_category', 'product.category_id','=','product_category.id');

			if($request->role_id == 2) {
		    	$products = $products->select(
		    		DB::raw('product.id , product.product_name , product.category_id, product_category.name as category_name, product_category.slug, product.price_for_customer as price, FORMAT(product.price_for_customer, "C", "en-us") as formatted_price , product.description, product.img_url, product.brochure_url')
		    	);
	    	}
	    	elseif($request->role_id == 3 || $request->role_id == 4) {
	    		$products = $products->select(
		    		DB::raw('product.id , product.product_name , product.category_id, product_category.name as category_name, product_category.slug, product.price_for_reseller as price, FORMAT(product.price_for_reseller, "C", "en-us") as formatted_price , product.description, product.img_url, product.brochure_url')
		    	);
	    	}
	    	else {
	    		return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
	    	}
	    	
	    	$products = $products->orderBy('product.product_name','asc')->get();
						
	    	return response()->json(['data' => $products, 'message' => ['OK']]);
    	}
	}
	
	public function getProductByCategory(Request $request) 
	{
		$val = Validator::make($request->all(), [
			'category_id' => 'required',
			'role_id' => 'required'
		]);

		if($val->fails()) {
			return response()->json(['data' => [], 'message' => $val->errors()->all()]);
		}
		else {
			$products = Product::Join('product_category', 'product.category_id','=','product_category.id')
			->where('category_id','=',$request->category_id);

			if($request->role_id == 2) {
		    	$products = $products->select(
		    		DB::raw('product.id , product.product_name , product.category_id, product_category.name as category_name, product_category.slug, product.price_for_customer as price, FORMAT(product.price_for_customer, "C", "en-us") as formatted_price , product.description, product.img_url, product.brochure_url')
		    	);
	    	}
	    	elseif($request->role_id == 3 || $request->role_id == 4) {
	    		$products = $products->select(
		    		DB::raw('product.id , product.product_name , product.category_id, product_category.name as category_name, product_category.slug, product.price_for_reseller as price, FORMAT(product.price_for_reseller, "C", "en-us") as formatted_price , product.description, product.img_url, product.brochure_url')
		    	);
	    	}
	    	else {
	    		return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
	    	}

			$products = $products->orderBy('product.product_name','asc')->get();

    		return response()->json(['data' => $products, 'message' => ['OK']]);
		}
    }
}
