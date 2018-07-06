<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Agen;
use App\User;
use App\Stores\store;

class EmployeeController extends Controller
{
    public function getByAgent(){

        $agen = Agen::join('users','users.id','=','agen.identifier')
        ->select('users.store_id as storeid','users.id as id','agen.name as name','agen.ktp_photo as NIK','users.phone as phone','agen.business_name as busname','agen.parent as parent','agen.kk_photo as KK','agen.address as address','users.status as status')
        ->where('users.status','=','inactive')
        ->get();

        $stores = Store::all();
        
        return view('agent.agentlist',compact('agen', 'stores'))->withTitle('by Agent List');
    }

    public function updateVerify(Request $request, $agen_id){
    
        $this->validate($request, [
            'store_id' => 'required'
        ]);

        $user = User::where('id','=',$agen_id)
        ->update([
            'status' => 'active',
            'store_id' => $request->store_id
        ]);

        return back();

    }
 
 
}
