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
        ->select('withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name')
       
        ->where('withdraw.status','=','process')
        ->get();
        
        $agen = Agen::all();
        
        return view('agent.withdraw',compact('withdraw','agen'))->withTitle('By withdraw');
    }

    public function updateStatus(Request $request,$id){
        $amount = Withdraw::where('id','=',$id)->first();
            
        $wanee = Agen::where('identifier','=',$amount->agen_id)->first();

        $wanee->update([
            'wanee' => $wanee->wanee - round($amount->amount)
        ]);
    
    
        $withdraw = WithDraw::where('id','=',$id)
        ->update([
            'status' => 'done'
            
        ]);

            $history = new WaneeHistory;
            $history->user_id = $amount->agen_id;
            $history->amount = $amount->amount;
            $history->saldo_akhir = $wanee->wanee;
            $history->reason = 'Penarikan Wanee';
            $history->save();

        return back();
    }
}
