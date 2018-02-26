<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Reseller;
use App\Dealer;

class MapsController extends Controller
{
    public function create()
    {
    	return view('placeSearch.create')->withTitle('Place Search');
    }

    public function store(Request $request)
    {
    	$id = $_GET['id'];
    	$state = $_GET['state'];

    	if($state == "reseller")
    	{
    		$data['address_1'] = $request->location;
    		$data['lat'] = $request->lat;
    		$data['lng'] = $request->lng;
    		$updateReseller = Reseller::where('identifier',$id)->update($data);

    		return redirect('/reseller')->withSuccess('Set Location successfully added.');
    	}
    	elseif($state == "dealer")
    	{
    		$data['address_1'] = $request->location;
    		$data['lat'] = $request->lat;
    		$data['lng'] = $request->lng;
    		$updateDealer = Dealer::where('identifier',$id)->update($data);

    		return redirect('/masterdealer')->withSuccess('Set Location successfully added.');
    	}
    }
}
