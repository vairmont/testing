<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Hash;
use Auth;
use App\User;
use App\Product;
use App\ProductCategory;
use Mockery\Exception;
use Validator;
use DB;

class ProductController extends Controller
{

	public function index(Request $request)
	{
    $products = Product::join('product_category', 'product.category_id','=','product_category.id')
    ->leftJoin('incentive_category', 'product.incentive_id','=', 'incentive_category.id')
    ->leftJoin('stock', 'product.id', '=', 'stock.product_id')
    ->where('stock.quantity', '>', 0)
    ->where('stock.store_id', '=', $request->get('user')->store_id)
    ->select(
      DB::raw('product.id , product.product_name , product.category_id, product_category.name as category_name, product.price_for_customer as regular_price, incentive_category.rate , product.img_url, product.description, product.promo_price as price')
      );

    if(isset($request->category_id) && !empty($request->category_id)) {
      $products = $products->where('product.category_id', $request->category_id);
    }
    if(isset($request->keyword) && !empty($request->keyword)) {
      $products = $products->where('product.product_name','like',"%".$request->keyword."%");
    }
    if(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Incentive Tertinggi') {
      $products = $products->orderBy('incentive_category.rate','DESC');
    }
    if(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Incentive Terendah') {
      $products = $products->orderBy('incentive_category.rate','ASC');
    }
    if(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Harga Tertinggi') {
      $products = $products->orderBy('price_for_customer','DESC');
    }
    if(isset($request->sortBy) && !empty($request->sortBy) && $request->sortBy == 'Harga Terendah') {
      $products = $products->orderBy('price_for_customer','ASC');
    }

    $products = $products->orderBy('product.product_name','asc')->get();

    return response()->json(['data' => $products, 'message' => ['OK']]);
  }

  public function categoryIndex(Request $request)
  {
    $categories = ProductCategory::select(
      DB::raw('id, name, slug, description, photo_url')
      )
    ->orderBy('name','asc')->get();

    $result = [];
      foreach ($categories as $category) {
        $items = Product::join('stock', 'stock.product_id', '=', 'product.id')
        ->where('product.category_id', $category->id)
        ->where('stock.quantity' , '>' ,0)
        ->where('stock.store_id', '=', $request->get('user')->store_id)
        ->count();

        $result[] = [
          'category' => $category,
          'items' => $items,
        ];
      }

    return response()->json(['data' =>  $result, 'message' => ['OK']]);
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
