<?php

namespace App\Http\Controllers;

use App\Withdraw;
use App\WaneeHistory;
use App\Agen;
use Illuminate\Http\Request;
use Excel;
use Carbon\Carbon;
use PDF;

class WithDrawController extends Controller
{
    public function getByShowWithDraw(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
        ->select('withdraw.created_at as date','agen.source as source','agen.account_no as nokredit','agen.wanee as wanee','withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status', 'agen.name as name', 'agen.plafon_kredit as plafon', 'agen.bank as bank')

        ->where('withdraw.status','=','process');
        

        if(isset($request->keyword) && !empty($request->keyword)){
            $withdraw = $withdraw->where('agen.name','LIKE',$request->keyword.'%');
        }
        if ($isExport) {
            $this->_export_excel($withdraw);
        }
        $withdraw = $withdraw->orderby('withdraw.id','asc')->get();  
        return view('agent.showwithdraw',compact('withdraw'))->withTitle('By withdraw');
    }
    public function updateStatusWithdraw(Request $request){
        $id = [];

        $draw = [];
        foreach($request->checkbox as $val) {
            $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
            ->select('withdraw.created_at as date','agen.source as source','agen.account_no as nokredit','agen.wanee as wanee','withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name', 'agen.plafon_kredit as plafon', 'agen.bank as bank')
            ->where('withdraw.id',$val)
            ->first();

            $wd = WithDraw::find($val);
            $wd->update([
                'status' => 'pending'
            ]);
            array_push($draw, $withdraw);
        }
             

            $pdf = PDF::loadView('pdf.invoicewithdraw',compact('amount','wanee','dif','$request','draw'));
            //return view('pdf.invoicewithdraw',compact('amount','wanee','dif','withdraw','$request'));
            return $pdf->download('invoicewithdraw.pdf');
    }
    public function getByWithDraw(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
        ->select('withdraw.created_at as date','agen.source as source','agen.account_no as nokredit','agen.wanee as wanee','withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name', 'agen.plafon_kredit as plafon', 'agen.bank as bank')

        ->where('withdraw.status','=','pending');
        

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
        $withdraw = $withdraw->get();

        $data = [];
        foreach ($withdraw as $draw) {
            $data[] = ([
                'ID' => $draw->id,
                'Nama' => $draw->name,
                'Amount' => number_format($draw->amount),
                'Wanee' => number_format($draw->wanee),
                'No Rekening' =>$draw->nokredit,
                'Source' => $draw->source,
                'Tanggal' =>$draw->date,
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
  
    
    public function updateStatus(Request $request){
        $id = [];
        
        $draw = [];
        foreach($request->checkbox as $val) {
            $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
            ->select('withdraw.created_at as date','agen.source as source','agen.account_no as nokredit','agen.wanee as wanee','withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name', 'agen.plafon_kredit as plafon', 'agen.bank as bank')
            ->where('withdraw.id',$val)
            ->first();
            
            $amount = Withdraw::where('id','=',$val)->first();
    
            $wanee = Agen::where('identifier','=',$amount->agen_id)->first();
            $dif = 0;
            
            if($wanee->plafon_kredit < 1000000){
    
                $dif = 1000000 - $wanee->plafon_kredit;
                
                $plafon = $wanee->plafon_kredit + $dif;
                $difwanee = $wanee->wanee - $dif;
                
                Agen::where('identifier','=',$amount->agen_id)->update([
                    'plafon_kredit' => $plafon,
                    'wanee' => $difwanee
                ]);
                $history = new WaneeHistory;
                $history->user_id = $amount->agen_id;
                $history->amount = $dif;
                $history->saldo_akhir = $difwanee;
                $history->reason = 'Pemindahan dana dari Wanee ke plafon';
                $history->save();
            }
            $saldoakhir = $wanee->wanee - $dif - $amount->amount;
            
            
            Agen::where('identifier','=',$amount->agen_id)->update([
                'wanee' => $saldoakhir
            ]);
            $wd = WithDraw::find($val);
            $wd->update([
                'status' => 'done'
            ]);
            array_push($draw, $withdraw);
        }
             
            $history = new WaneeHistory;
            $history->user_id = $amount->agen_id;
            $history->amount = $amount->amount;
            $history->saldo_akhir = $saldoakhir;
            $history->reason = 'Penarikan Wanee';
            $history->save();

            return redirect()->back()->with('message', 'Verifikasi Sukses...!');
            // return view('agent.withdraw',compact('withdraw','draw'))->withTitle('By withdraw');
    }
    public function getByWithDrawDone(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $withdraw = WithDraw::join('agen','agen.identifier','=','withdraw.agen_id')
        ->select('withdraw.created_at as date','agen.source as source','agen.account_no as nokredit','withdraw.id as id','withdraw.agen_id as agenid','withdraw.amount as amount','withdraw.status as status','agen.wanee as wanee', 'agen.name as name', 'agen.plafon_kredit as plafon', 'agen.bank as bank')

        ->where('withdraw.status','=','done');
        

        if(isset($request->keyword) && !empty($request->keyword)){
            $withdraw = $withdraw->where('agen.name','LIKE',$request->keyword.'%');
        }
        if ($isExport) {
            $this->_export_excel($withdraw);
        }
        $withdraw = $withdraw->orderby('withdraw.id','asc')->get();  
        return view('agent.withdrawdone',compact('withdraw'))->withTitle('By withdraw');
    }
}
