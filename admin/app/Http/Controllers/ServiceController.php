<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service;
use Validator;

class ServiceController extends Controller
{
	public function getService()
	{
    	$service = Service::select('service.*','service_status.name as status_name','service_type.name as type_name','city.name as city_name')
    	->leftjoin('service_type','service.type_id','=','service_type.id')
    	->leftjoin('service_status','service.status_id','=','service_status.id')
    	->leftjoin('city','service.city_id','=','city.id')
    	->orderBy('service.cp_name','asc')
		->get();
		
    	return response()->json(['data' => $service, 'message' => ['OK']]);
	}
	
	public function getServiceByArea(Request $request)
	{
        $val = Validator::make($request->all(), [
            'city_id' => 'required'
        ]);

        if($val->fails()) {
            return response()->json(['data' => [], 'message' => $val->errors()->all()]);
        }
        else {

        	$service = Service::select('service.*','service_status.name as status_name','service_type.name as type_name','city.name as city_name')
        	->leftjoin('service_type','service.type_id','=','service_type.id')
        	->leftjoin('service_status','service.status_id','=','service_status.id')
        	->leftjoin('city','service.city_id','=','city.id')
        	->where('service.city_id',$request->city_id)
        	->orderBy('service.cp_name','asc')
    		->get();
		
    	   return response()->json(['data' => $service, 'message' => ['OK']]);
        }
    }
}
