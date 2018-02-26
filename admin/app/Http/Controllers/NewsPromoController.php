<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\NewsPromo;

class NewsPromoController extends Controller
{
    public function create(Request $request) {

    	$news = NewsPromo::orderBy('created_at','desc');

    	if(isset($request->keyword) && $request->keyword != "") {
    		$news = $news->where('title','like','%'.$request->keyword."%")->orWhere('description','like','%'.$request->keyword.'%');
    	}

    	$news = $news->paginate(20);

    	return view('newspromo.create', compact('request', 'news'))->withTitle('News & Promo');
    }

    public function store(Request $request) {

    	$rules = [
    		'title' => 'required',
    		'description' => 'required', 
    		'image' => 'mimes:jpeg,jpg,png|max:2000'
    	];

    	$this->validate($request,$rules);

    	$path = "";

    	if($request->hasFile('image')) {
    		$path = $request->file('image')->store('image');
    	}

    	$data['title'] = $request->title;
    	$data['description'] = $request->description;
    	$data['image'] = "storage/app/".$path;
    	$data['customer'] = empty($request->customer)? 0 : $request->customer;
        $data['reseller'] =  empty($request->reseller)? 0 : $request->reseller;
        $data['dealer'] =  empty($request->dealer)? 0 : $request->dealer;

    	$store = NewsPromo::create($data);

    	return back()->withSuccess('News & Promo has been added.');

    }

    public function update(Request $request,$id) {

    	$this->validate($request, [
			'title' => 'required',
    		'description' => 'required', 
    		'image' => 'mimes:jpeg,jpg,png|max:2000'
		]);

		$news = NewsPromo::find($id);

		if($request->hasFile('image')) {
			// get image
			$newspromo = $news->select('image')->first();

			// remove existing image
			if($newspromo->image != "") {
				unlink("../".$newspromo->image);
			}

			$path = $request->file('image')->store('image');

			// store new image
			$data['image'] = "storage/app/".$path;
			$update = $news->update($data);
		}

		$data['title'] = $request->title;
    	$data['description'] = $request->description;
    	$data['customer'] = empty($request->customer)? 0 : $request->customer;
        $data['reseller'] =  empty($request->reseller)? 0 : $request->reseller;
        $data['dealer'] =  empty($request->dealer)? 0 : $request->dealer;

    	$store = $news->update($data);

		return back()->withSuccess("News & Promo has been updated.");

    }	

    public function delete(Request $request,$id) {
    	$data = NewsPromo::where('id',$id);

		$newspromo = $data->select('image')->first();

		// remove image
		if($newspromo->image != "") {
			unlink("../".$newspromo->image);
		}

		// remove data
		$delete = $data->delete();

    	return back()->withSuccess('News & Promo has been deleted.');
    }
}
