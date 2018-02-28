<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\NewsPromo;

class NewsController extends Controller
{
	/*
		customer = 2
		reseller = 3,4
		dealer = 5
	*/

    public function getNews(Request $request)
    {
        $news = NewsPromo::select('id','title','description','image','updated_at');

        if($request->role_id == 2) {
        	$news = $news->where('customer',1);
        }
        else if($request->role_id == 3 || $request->role_id == 4) {
        	$news = $news->where('reseller',1);
        }
        else if($request->role_id == 5) {
        	$news = $news->where('dealer',1);
        }
        else {
            return response()->json(['data' => [], 'message' => ['You are not authorized.']]);
        }

        $news = $news->orderBy('updated_at','desc')->get();
        
    	return response()->json(['data' => $news, 'message' => ['OK']]);
    }
}
