<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Agen;
use App\User;
use App\Stores\store;
use Excel;
use App\WaneeHistory;
use Carbon\Carbon;


class EmployeeController extends Controller
{
    public function getByAgent(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $agen = Agen::join('users','users.id','=','agen.identifier')
        ->where('users.status','=','inactive')
        ->select('users.store_id as storeid','users.id as id','agen.name as name','agen.ktp_photo as NIK','users.phone as phone','agen.business_name as busname','agen.parent as parent','agen.kk_photo as KK','agen.address as address','users.status as status');
       
        
        $stores = Store::all();
        
        if(isset($request->keyword) && !empty($request->keyword)){
            $agen = $agen->where('agen.name','LIKE',$request->keyword.'%');
        }
        if ($isExport) {
            $this->_export_excel($agen);
        }
       
        $agen = $agen->orderby('agen.name','asc')->get();
          
        return view('agent.agentlist',compact('agen', 'stores'))->withTitle('by Agent List');
    }
    private function _export_excel($agen) {
        $agen = Agen::join('users','users.id','=','agen.identifier')
        ->select('users.store_id as storeid','users.id as id','agen.name as name','agen.ktp_photo as NIK','users.phone as phone','agen.business_name as busname','agen.parent as parent','agen.kk_photo as KK','agen.address as address','users.status as status')
        ->get();
        $data = [];
        foreach ($agen as $agent) {
            $data[] = ([
                'Store ID' => $agent->storeid,
                'Nama' => $agent->name,
                'Alamat' => $agent->address,
                'Parent' =>$agent->parent,
                'Nomor Telepon'=>$agent->phone,
                'Nama Bisnis'=>$agent->busname,
                'Status'=>$agent->status,
            ]);
            
        }
        
        return Excel::create('Verify.Agent_Report', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
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
    public function getBywanneHistory(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;    

        $history = WaneeHistory::join('users','users.id','=','wanee_history.user_id')
        ->join('role','role.id','=','users.role_id')
        ->join('agen','agen.identifier','=','users.id')
        
        ->select('wanee_history.saldo_akhir as saldoakhir','wanee_history.id as id','agen.name as name','wanee_history.amount as amount','wanee_history.created_at as date','users.phone as phone');
       
        
        if(isset($request->date) && $request->date == '1'){
            $history = WaneeHistory::join('users','users.id','=','wanee_history.user_id')
            ->join('role','role.id','=','users.role_id')
            ->join('agen','agen.identifier','=','users.id')
            
            ->select('wanee_history.id as id','agen.name as name','wanee_history.amount as amount','wanee_history.created_at as date','users.phone as phone')
            ->whereDate('wanee_history.created_at','=',Carbon::today()->toDateString());
        }
        if(isset($request->date) && $request->date == '2'){
            $history = WaneeHistory::join('users','users.id','=','wanee_history.user_id')
            ->join('role','role.id','=','users.role_id')
            ->join('agen','agen.identifier','=','users.id')
            
            ->select('wanee_history.id as id','agen.name as name','wanee_history.amount as amount','wanee_history.created_at as date','users.phone as phone')
            ->whereMonth('wanee_history.created_at', '=', date('m'));
        }
        if(isset($request->dayword1) && !empty($request->dayword1) && isset($request->dayword2) && !empty($request->dayword2)){
            $history = $history->whereBetween('wanee_history.created_at',[$request->dayword1, Carbon::parse($request->dayword2)->addDays(1)]);
            
        }
        if(isset($request->keyword) && !empty($request->keyword)){
            $history = $history->where('agen.name','LIKE',$request->keyword.'%');
        }
        if ($isExport) {
            $this->_export_excel2($history);
        }

        $history = $history->orderby('agen.name','asc')->get();  
        return view('agent.waneehistory',compact('history','request'))->withTitle('by Wanee History');
    }
    
    public function updateStatus(Request $request,$id){
        $history = WaneeHistory::join('users','users.id','=','wanee_history.user_id')
        ->join('role','role.id','=','users.role_id')
        ->join('agen','agen.identifier','=','users.id')
        ->where('wanee_history.reason','=','Penarikan Wanee')
        ->select('agen.name as name','wanee_history.amount as amount','wanee_history.created_at as date','users.phone as phone')
        ->get();
        
        $history = WaneeHistory::where('id','=',$id)
        ->update([
            'reason' => 'Withdraw',
        ]);

        return back();
    }
    private function _export_excel2($history) {
        $history = WaneeHistory::join('users','users.id','=','wanee_history.user_id')
        ->join('role','role.id','=','users.role_id')
        ->join('agen','agen.identifier','=','users.id')
        ->where('wanee_history.reason','=','Penarikan Wanee')
        ->select('wanee_history.id as id','agen.name as name','wanee_history.amount as amount','wanee_history.created_at as date','users.phone as phone')
        ->get();

        $data = [];
        foreach ($history as $his) {
            $data[] = ([
                'ID' => $his->name,
                'Amount' => $his->amount,
                'Tanggal' => $his->date,
                'Telepon' =>$his->phone,
            ]);
            
        }
        
        return Excel::create('Wanee_history', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }
}
