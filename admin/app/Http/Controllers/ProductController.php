<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Hash;
use Auth;
use App\User;
use App\Product;
use Validator;
use DB;

class ProductController extends Controller
{

	public function getProduct(Request $request) 
	{
		$val = Validator::make($request->all(), [
			'user_id' => 'required'
		]);

		if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
            else {
                $user = User::select('role_id')
                ->where('id', "=", $request->user_id)
                ->first();

            $product = Product::Join('product_category', 'product_category.id', '=', 'product.category_id')
                    ->select('product.product_name', 'product.price_for_customer');
                    
                
                $product = $product->get();
                
                return response()->json(['data' => $product, 'message' => ['OK']]);
     			}
    }
	
}
