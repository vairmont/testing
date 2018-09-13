<?php

namespace App\Http\Controllers;

use App\Withdraw;
use App\WaneeHistory;
use App\Agen;
use Illuminate\Http\Request;
use Excel;

class WithDrawController extends Controller
{
    public function getByWithDraw(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
        ->select('withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name')

        ->where('withdraw.status','=','process');
        

        if(isset($request->keyword) && !empty($request->keyword)){
            $withdraw = $withdraw->where('agen.name','LIKE',$request->keyword.'%');
        }
        if ($isExport) {
            $this->_export_excel($withdraw);
        }
        $withdraw = $withdraw->orderby('withdraw.id','asc')->get();  
        return view('agent.withdraw',compact('withdraw'))->withTitle('By withdraw');
    }
    private function _export_excel($withdraw) {
        $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
        ->select('withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name')
        ->get();

        $data = [];
        foreach ($withdraw as $draw) {
            $data[] = ([
                'ID' => $draw->id,
                'Nama' => $draw->name,
                'Amount' => $draw->amount,
                'Status' =>$draw->status,
            ]);
        }
        
        return Excel::create('Withdraw_Report', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }
    
    public function updateStatus(Request $request,$id){
        $amount = Withdraw::where('id','=',$id)->first();
            
        $wanee = Agen::where('identifier','=',$amount->agen_id)->first();
        
        $saldoakhir = $wanee->wanee - $amount->amount;
        Agen::where('identifier','=',$amount->agen_id)->update([
            'wanee' => $saldoakhir
        ]);
    
    
        $withdraw = WithDraw::where('id','=',$id)
        ->update([
            'status' => 'done'  
        ]);
            $history = new WaneeHistory;
            $history->user_id = $amount->agen_id;
            $history->amount = $amount->amount;
            $history->saldo_akhir = $saldoakhir;
            $history->reason = 'Penarikan Wanee';
            $history->save();

        return back();
    }
}
