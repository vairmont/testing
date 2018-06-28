<?php

namespace App\Http\Controllers;

use App\Withdraw;
use Illuminate\Http\Request;

class WithDrawController extends Controller
{
    public function getByWithDraw(){

        $withdraw = WithDraw::
        select('id','agen_id','amount','status')
        ->where('status','=','process')
        ->get();
        return view('agent.withdraw',['withdraw' => $withdraw])->withTitle('By withdraw'); 
    }
    
    
    public function updateStatus(Request $request,$id){
    
        $withdraw = WithDraw::where('id','=',$id)
        ->update([
            'status' => 'done',
            'id' => $request->id
        ]);

        return back();
    }
}
