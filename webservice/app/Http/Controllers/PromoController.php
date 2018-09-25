<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\BannerPromo;
use App\Slider;
use App\OrderDetail;
use App\Product;
use App\Stock;
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
                    ->join('stock', 'stock.product_id', '=', 'order_detail.product_id')
    				->select(DB::raw('SUM(order_detail.qty) as sales'), 'product.id', 'product.product_name', 
                        'product.promo_price as price', 'product.price_for_customer as regular_price', 'product.img_url', 'product.description')
                    ->where('stock.quantity', '>', 0)
                    ->where('stock.store_id', '=', $request->get('user')->store_id)
    				->groupBy('product.id', 'product.product_name', 'product.promo_price', 
                        'product.price_for_customer', 'product.img_url', 'product.description')
    				->orderBy('sales', 'desc');

        if(isset($request->take) && $request->take != 'all') {
            $rec = $rec->take($request->take)->get();
        }
        elseif(isset($request->take) && $request->take == 'all') {
            $rec = $rec->get();
        }

    	return response()->json(['data' => $rec, 'message' => ['OK']]);  
    }

    public function soldIndex(Request $request) 
    {
        $rec = OrderDetail::leftJoin('product', 'product.id', '=', 'order_detail.product_id')
                    ->leftJoin('stock', 'stock.product_id', '=', 'order_detail.product_id')
                    ->select(DB::raw('SUM(order_detail.qty) as sales'), 'product.id', 'product.product_name')
                    ->where('stock.quantity', '>', 0)
                    ->whereIN('product.id', '=', [141, 145, 146])
                    ->where('stock.store_id', '=', $request->get('user')->store_id)
                    ->groupBy('product.id', 'product.product_name')
                    ->orderBy('sales', 'desc');

        if(isset($request->take) && $request->take != 'all') {
            $rec = $rec->take($request->take)->get();
        }
        elseif(isset($request->take) && $request->take == 'all') {
            $rec = $rec->get();
        }

        return response()->json(['data' => $rec, 'message' => ['OK']]);  
    }

    public function hotIndex(Request $request) 
    {
    	$rec = Product::select('product.id', 'product.product_name', 'product.promo_price as price', 'product.price_for_customer as regular_price', 'product.img_url', 'product.description')
                    ->join('stock', 'stock.product_id', '=', 'product.id')
    				->where('promo_price', '>=', 0)
                    ->where('stock.quantity', '>', 0)
                    ->where('stock.store_id', '=', $request->get('user')->store_id);

          if(isset($request->take) && $request->take != 'all') {
            $rec = $rec->take($request->take)->get();
        }
        elseif(isset($request->take) && $request->take == 'all') {
            $rec = $rec->get();
        }

    	return response()->json(['data' => $rec, 'message' => ['OK']]);  
    }
}

