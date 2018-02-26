<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\City;

class CityController extends Controller
{
    public function store(Request $request) {
        // store data to DB

        $this->validate ($request,[
            'city_name' => 'required|unique:city,name',
        ]);
        
        $data['name'] = strtoupper($request->city_name);

        $store = City::create($data);

        return back()->withSuccess('New City has been addedd.');
    }
}
