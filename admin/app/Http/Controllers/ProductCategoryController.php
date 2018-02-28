<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\ProductCategory;

class ProductCategoryController extends Controller
{
    public function getProductCategory(Request $request)
    {
        $category = ProductCategory::orderBy('id','asc')->select('id','name','slug')->get();
 		
    	return response()->json(['data' => $category, 'message' => ['OK']]);
    }
}
