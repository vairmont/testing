<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Order;
use App\User;
use App\Customer;
use App\Commission;
use App\OrderDetail;
use App\Product;
use Excel;
use Carbon\Carbon;
use App\Supplier;

use DB;

class SupplierController extends Controller
{
    public function getBySupplier(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;        
        
        $totalsales = Order::join('order_detail','order.id','=','order_detail.order_id')
        ->join('product','product.id','=','order_detail.product_id')
        ->join('suppliers', 'product.suppliers_id', '=', 'suppliers.id')
        ->join('users','users.id','=','order.user_id')
        ->join('store','store.id','=','users.store_id')
        ->join('role','role.id','=','users.role_id')
        ->whereIn('order.status',[7,9])
        // ->whereDate('order.created_at','=',Carbon::today()->toDateString())
        ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id','role.name as uid','store.store_name as sname','order.created_at as create','order_detail.updated_at as update', 'suppliers.name as supplier', 'product.price_for_customer', 'product.promo_price');

        if(isset($request->date) && $request->date == '1'){
            $totalsales = Order::join('order_detail','order.id','=','order_detail.order_id')
            ->join('product','product.id','=','order_detail.product_id')
            ->join('suppliers', 'product.suppliers_id', '=', 'suppliers.id')
            ->join('users','users.id','=','order.user_id')
            ->join('store','store.id','=','users.store_id')
            ->join('role','role.id','=','users.role_id')
            ->whereIn('order.status',[7,9])
            ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id','role.name as uid','store.store_name as sname','order.created_at as create','order.updated_at as update', 'suppliers.name as supplier', 'product.price_for_customer', 'product.promo_price')
            ->whereDate('order.created_at','=',Carbon::today()->toDateString());
        }
        if(isset($request->date) && $request->date == '2'){
            $totalsales = Order::join('order_detail','order.id','=','order_detail.order_id')
            ->join('product','product.id','=','order_detail.product_id')
            ->join('suppliers', 'product.suppliers_id', '=', 'suppliers.id')
            ->join('users','users.id','=','order.user_id')
            ->join('store','store.id','=','users.store_id')
            ->join('role','role.id','=','users.role_id')
            ->whereIn('order.status',[7,9])
            ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id','role.name as uid','store.store_name as sname','order.created_at as create','order.updated_at as update', 'suppliers.name as supplier', 'product.price_for_customer', 'product.promo_price')
            ->whereMonth('order.created_at', '=', date('m'));  
        }

        if(isset($request->dayword1) && !empty($request->dayword1) && isset($request->dayword2) && !empty($request->dayword2)){
            $totalsales = $totalsales->whereBetween('order.created_at',[$request->dayword1, Carbon::parse($request->dayword2)->addDays(1)]);        
        }
    
        if(isset($request->keyword) && !empty($request->keyword)){
            $totalsales = $totalsales->where('product.product_name','LIKE',$request->keyword.'%'); 
        }
        if(isset($request->key) && !empty($request->key)){
            $totalsales = $totalsales->where('store.store_name','LIKE',$request->key.'%');
        }
        if ($isExport) {
            $this->_export_excel2($totalsales);
        }
        if(session('role') != 'Admin' && session('role') != 'Customer' && session('role') != 'Finance' && session('role') != 'Agen' && session('role') != 'Member' && session('role') != 'Stock Keeper' && session('role') != 'Approver' && session('role') != 'Storekeeper'){
            $supplier = Supplier::where('name',session('role'))->first();
            $totalsales = $totalsales->where('product.suppliers_id',$supplier->id);
        }
        $qry = $totalsales->get();

        $total1 = 0;
        foreach($qry as $q) {
            $total1 += ($q->cost);
        }

        
        $totalsales = $totalsales->orderby('order.created_at','desc')->paginate(10);  
        return view('supplier.suppliersales',compact('totalsales', 'request','total1','total2'))->withTitle('By withdraw');
        
    }
    private function _export_excel2($totalsales) {
        $totalsales = $totalsales->get();
        
        $data = [];
        foreach ($totalsales as $total) {
            $data[] = ([
                'ID' => $total->id,
                'User'=>$total->uid,
                'SKU'=>$total->sku,
                'Name'=>$total->name,
                'Quantity'=>$total->qty,
                'Modal'=>number_format($total->cost),
                'Store'=>$total->sname,
                'Created at'=>$total->create,
                'update at'=>$total->update
            ]);
        }
        return Excel::create('Sales_supplier', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }    

}