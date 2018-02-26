<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Service;
use App\City;
use App\ServiceStatus;
use App\ServiceType;


class ServiceController extends Controller
{
    public function create(Request $request) {

    	$service = Service::leftJoin('service_status', 'service.status_id', '=', 'service_status.id')
        ->leftJoin('service_type', 'service.type_id', '=', 'service_type.id')
        ->leftJoin('city', 'service.city_id', '=', 'city.id')
        ->select(
            'service.id as no_branch',
            'city.id as no_area',
            'city.name as city_name',
            'service.cp_name as company',
            'service_type.name as type',
            'service_status.name as status',
            'service.province as province',
            'service.address as address',
            'service.pic as pic',
            'service.telephone as telephone',
            'service.email as email',
            'service.onsite as onsite',
            'service.inhouse as inhouse',
            'service.sic as sic',
            'service.sellbro as sellbro') 
        ->orderBy('service.id','asc');

    	$keyword = $request->keyword;

    	if(isset($keyword) && !empty($keyword)){
    	   $service = $service->where('service.cp_name', 'like', '%' . $keyword . '%');
    	}


    	$service = $service->Paginate(10);

        $city = City::orderBy('name')->get(['id','name']);
        $status = ServiceStatus::orderBy('name')->get(['id','name']);
        $type = ServiceType::orderBy('name')->get(['id','name']);

		return view('service.create',compact('service','request','city','status','type'))->withTitle('Service Location');
    }
    public function store(Request $request)
    {
        // store data to DB

        $this->validate ($request,[
            'City' => 'required',
            'Company_Name' => 'required',
            'Type' => 'required',
            'Status' => 'required',
            'Province' => 'required',
            'Address' => 'required',
            'Person_In_Charge' => 'required',
            'Telephone' => 'required',
            'Email' => 'required',
        ]);
        
        $data['city_id'] = $request->City;
        $data['cp_name'] = $request->Company_Name;
        $data['type_id'] = $request->Type;
        $data['status_id'] = $request->Status;
        $data['province'] = $request->Province;
        $data['address'] = $request->Address;
        $data['pic'] = $request->Person_In_Charge;
        $data['telephone'] = $request->Telephone;
        $data['email'] = $request->Email;
        $data['onsite'] = empty($request->onsiterepair) ? 0 : $request->onsiterepair;
        $data['inhouse'] = empty($request->inhouserepair) ? 0 : $request->inhouserepair;
        $data['sic'] = empty($request->sicompany) ? 0 : $request->sicompany;
        $data['sellbro'] = empty($request->sellingbrother) ? 0 : $request->sellingbrother;
        
        $store = Service::create($data);

        return back()->withSuccess('New Service has been created.');
    }

    public function update(Request $request, $id)
    {
        // update data
        $this->validate($request, [
            'City' => 'required',
            'Company_Name' => 'required',
            'Type' => 'required',
            'Status' => 'required',
            'Province' => 'required',
            'Address' => 'required',
            'Person_In_Charge' => 'required',
            'Telephone' => 'required',
            'Email' => 'required',
        ]);

        $data['city_id'] = $request->City;
        $data['cp_name'] = $request->Company_Name;
        $data['type_id'] = $request->Type;
        $data['status_id'] = $request->Status;
        $data['province'] = $request->Province;
        $data['address'] = nl2br($request->Address);
        $data['pic'] = $request->Person_In_Charge;
        $data['telephone'] = $request->Telephone;
        $data['email'] = $request->Email;
        $data['onsite'] = empty($request->onsiterepair) ? 0 : $request->onsiterepair;
        $data['inhouse'] = empty($request->inhouserepair) ? 0 : $request->inhouserepair;
        $data['sic'] = empty($request->sicompany) ? 0 : $request->sicompany;
        $data['sellbro'] = empty($request->sellingbrother) ? 0 : $request->sellingbrother;
        
        $update = Service::where('id',$id)->update($data);

        return back()->withSuccess('Service has been updated.');
    }

    public function delete(Request $request, $id)
    {
        // delete data
        if(!empty($id)) {
            $delete = Service::where('id',$id)->delete();

            return back()->withSuccess('Service has been deleted.');
        }
    }
}
