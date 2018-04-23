<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Agen;

class EmployeeController extends Controller
{
    public function getByAgent(){

        $agen = Agen::all();

        return view('agent.agentlist',compact('agen'))->withTitle('by Agent List');
    }
    public function updateReject(Request $request){
        $agen =Agen::find($request->id)
        ->update(['status' => 0]);

        return back();
    }
    public function updateVerify(Request $request){
        $agen = Agen::find($request->id)
        ->update(['status' => 2]);
        
            return back();
    }
}
