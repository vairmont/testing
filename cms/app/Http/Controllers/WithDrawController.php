<?php

namespace App\Http\Controllers;

use App\Withdraw;
use App\WaneeHistory;
use App\Agen;
use Illuminate\Http\Request;

class WithDrawController extends Controller
{
    public function getByWithDraw(){
      
        $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
        ->select('withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee')
       
        ->where('withdraw.status','=','process')
        ->get();
        
        $agen = Agen::all();
        
        return view('agent.withdraw',compact('withdraw','agen'))->withTitle('By withdraw');
    }

    public function updateStatus(Request $request,$id){
        
        $amount = Withdraw::select('amount')->where('agen_id','=',$id)->first();
            
        $wanee = Agen::select('wanee')->where('id','=',$id)
        ->decrement('wanee',round($amount->amount));
    
    
        $withdraw = WithDraw::select('agen.wanee as wanee','withdraw.amount as amount')
      
        ->where('id','=',$id)
        ->update([
            'status' => 'done',
            'id' => $request->id
            
        ]);

            $history = new WaneeHistory;
            $history->user_id = $request->get('user')->id;
            $history->amount = $request->amount;
            $history->saldo_akhir = $agen->wanee - $request->amount;
            $history->reason = 'Penarikan Wanee';
            $history->save();

        return back();
    }
}
