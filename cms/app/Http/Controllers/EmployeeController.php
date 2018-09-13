<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Agen;
use App\User;
use App\Stores\store;
use Excel;

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
 
 
}
