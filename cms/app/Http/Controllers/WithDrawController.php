<?php

namespace App\Http\Controllers;

use App\Withdraw;
use Illuminate\Http\Request;

class WithDrawController extends Controller
{
    public function getByWithDraw(){

        $withdraw = WithDraw::join('withdraw','withdraw.id_agen','=','agen.identifier')
        ->select('withdraw.id as withdrawid','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status')
        ->where('status','=','process')
        ->get();

        $agen = Agen::all();

        
        return view('agent.withdraw',compact('withdraw','agen'))->withTitle('By withdraw');
    }
    public function getByWithDraw1(){

        $withdraw1 = WithDraw::
        select('id','agen_id','amount','status')
        ->where('status','=','done')
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
