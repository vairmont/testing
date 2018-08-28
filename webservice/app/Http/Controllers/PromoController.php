<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\BannerPromo;
use App\Slider;
use App\OrderDetail;
use App\Product;
use DB;

class PromoController extends Controller
{

    public function index(Request $request)
    {
        $promo = BannerPromo::orderBy('id','asc')->select('name', 'photo', 'description', 'period', 'terms')->get();
        
        return response()->json(['data' => $promo, 'message' => ['OK']]);
    }

    public function sliderIndex(Request $request)
    {
        $slider = Slider::orderBy('id','asc')->select('name', 'photo', 'page')->get();
        return response()->json(['data' => $slider, 'message' => ['OK']]);
    }

    public function recommendationIndex(Request $request) 
    {
    	$rec = OrderDetail::join('product', 'product.id', '=', 'order_detail.product_id')
    				->select(DB::raw('SUM(order_detail.qty) as sales'), 'product.id', 'product.product_name', 'product.promo_price as price', 'product.price_for_customer as regular_price', 'product.img_url', 'product.description')
    				->groupBy('product.id', 'product.product_name', 'product.promo_price as price', 'product.price_for_customer as regular_price', 'product.img_url', 'product.description')
    				->orderBy('sales', 'desc')
    				->get();
    	return response()->json(['data' => $rec, 'message' => ['OK']]);  
    }


    public function hotIndex(Request $request) 
    {
    	$rec = Product::select('product.id', 'product.product_name', 'product.promo_price as price', 'product.price_for_customer as regular_price', 'product.img_url', 'product.description')
    				->where('promo_price', '>=', 0)
    				->get();

    	return response()->json(['data' => $rec, 'message' => ['OK']]);  
    }
}

