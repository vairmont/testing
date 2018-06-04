<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Hash;
use Auth;
use App\User;
use App\Product;
use Mockery\Exception;
use Validator;
use DB;

class ProductController extends Controller
{

	public function index(Request $request)
	{
    $products = Product::Join('product_category', 'product.category_id','=','product_category.id')
    ->join('incentive_category', 'product.incentive_id','=', 'incentive_category.id')
    ->select(
      DB::raw('product.id , product.product_name , product.category_id, product_category.name as category_name, product.price_for_customer as price, incentive_category.rate , product.img_url')
      );

    if(isset($request->category_id) && !empty($request->category_id)) {
      $products = $products->where('product.category_id', $request->category_id);
    }
    elseif(isset($request->keyword) && !empty($request->keyword)) {
      $products = $products->where('product.product_name','like',$request->keyword."%");
    }
    elseif(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Incentive Tertinggi') {
      $products = $products->orderBy('incentive_category.rate','DESC')
    }
    elseif(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Incentive Terendah') {
      $products = $products->orderBy('incentive_category.rate','ASC')
    }
    elseif(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Harga Tertinggi') {
      $products = $products->orderBy('price_for_customer','DESC')
    }
    elseif(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Harga Terendah') {
      $products = $products->orderBy('price_for_customer','ASC')
    }

    $products = $products->orderBy('product.product_name','asc')->get();

    return response()->json(['data' => $products, 'message' => ['OK']]);
  }

  public function add(Request $request) {
	  $validator = Validator::make($request->all(), [
      'sku' => 'required|numeric|unique:product,sku',
      'product_name' => 'required',
      'category_id' => 'required|numeric|exists:product_category,id',
      'type' => 'required',
      'cost' => 'required|numeric',
      'price_for_agen' => 'required|numeric',
      'price_for_customer' => 'required|numeric',
      'description' => 'required',
      'img_url' => 'required'
    ]);

    if ($validator->fails()) {
      return response()->json([
        'error' => $validator->errors()->all()
      ], 400);
    }

    $product = new Product();
    $product->sku = $request['sku'];
    $product->product_name = $request['product_name'];
    $product->category_id = $request['category_id'];
    $product->type = $request['type'];
    $product->cost = $request['cost'];
    $product->price_for_agen = $request['price_for_agen'];
    $product->price_for_customer = $request['price_for_customer'];
    $product->description = $request['description'];
    $product->img_url = $request['img_url'];
    $product->created_by = "test";
    $product->updated_by = "test";
    $product->save();

    return response()->json(['data' => $product], 201);
  }

  public function show(Request $request, $id) {
    $product = Product::whereId($id)->get();
    return response()->json(['data' => $product], 200);
  }

  public function edit(Request $request, $id) {
    $validator = Validator::make($request->all(), [
      'sku' => 'numeric|unique:product,sku',
      'category_id' => 'numeric|exists:product_category,id',
      'cost' => 'numeric',
      'price_for_agen' => 'numeric',
      'price_for_customer' => 'numeric',
    ]);

    if ($validator->fails()) {
      return response()->json([
        'error' => $validator->errors()->all()
      ], 400);
    }

	  $data = $request->all();
	  try {
	    $product = Product::whereId($id)->update($data);
      return response()->json(['message' => 'Product updated.'], 200);
    } catch (\Exception $e) {
	    return response()->json(['error' => 'Product not found/Error updating product.'], 400);
    }
  }

  public function remove(Request $request, $id) {
	    if (Product::whereId($id)->delete()) {
	      return response()->json(['message' => 'Product has been removed.'], 200);
      }
      return response()->json(['error' => 'Failed to remove product/Product not found.'], 400);
  }

}
