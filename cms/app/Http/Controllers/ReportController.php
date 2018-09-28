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


use DB;

class ReportController extends Controller
{
    public function getByItem(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        
        // echo $request->date; die;
        
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
        $qry = $totalsales->get();

        $total1 = 0;
        foreach($qry as $q) {
            $total1 += ($q->cost * $q->qty);
        }

        $total2 = 0;
        foreach($qry as $q) {    
        if($qry->promo_price > 0){
            $price = $qry->promo_price;
        }
        else{
            $price = $qry->price_for_customer;
        }
            $total2 += ($price * $q->qty);
        }
        
        $totalsales = $totalsales->orderby('order.created_at','desc')->paginate(10);  
        return view('report.byitem',compact('totalsales', 'request','total1','total2'))->withTitle('By withdraw');
        
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
                'Nominal'=>number_format($total->nominal),
                'Cost'=>number_format($total->cost),
                'Store'=>$total->sname,
                'Created at'=>$total->create,
                'update at'=>$total->update
            ]);
        }
        
        
        return Excel::create('Total_sales', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }
    public function getByStore(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
        ->leftjoin('product','product.id','=','order_detail.product_id')
        ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
        ->leftjoin('agen','agen.identifier','=','order.agen_id')
        ->leftjoin('users','users.id','=','agen.identifier')
        ->leftjoin('store','store.id','=','users.store_id')
        ->whereIn('order.status',[7,9])
        ->where('order.type','=','sembako')
        ->select('store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price');

        
        if(isset($request->date) && $request->date == '1'){
            $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
            ->leftjoin('product','product.id','=','order_detail.product_id')
            ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
            ->leftjoin('agen','agen.identifier','=','order.agen_id')
            ->leftjoin('users','users.id','=','agen.identifier')
            ->leftjoin('store','store.id','=','users.store_id')
            ->whereIn('order.status',[7,9])
            ->where('order.type','=','sembako')
            ->select('store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
            ->whereDate('order.created_at','=',Carbon::today()->toDateString());
        }
        if(isset($request->date) && $request->date == '2'){
            $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
            ->leftjoin('product','product.id','=','order_detail.product_id')
            ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
            ->leftjoin('agen','agen.identifier','=','order.agen_id')
            ->leftjoin('users','users.id','=','agen.identifier')
            ->leftjoin('store','store.id','=','users.store_id')
            ->whereIn('order.status',[7,9])
            ->where('order.type','=','sembako')
            ->select('store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
            ->whereMonth('order.created_at', '=', date('m'));
        }
        if(isset($request->dayword1) && !empty($request->dayword1) && isset($request->dayword2) && !empty($request->dayword2)){
            $flowreport = $flowreport->whereBetween('order.created_at',[$request->dayword1, Carbon::parse($request->dayword2)->addDays(1)]);
        }
        if(isset($request->keyword) && !empty($request->keyword)) {
            $flowreport = $flowreport->where('agen.name','like',$request->keyword.'%');
        }
        if(isset($request->key) && !empty($request->key)) {
            $flowreport = $flowreport->where('store.store_name','like',$request->key.'%');
        }
        if ($isExport) {
            $this->_export_excel($flowreport);
        }
        
        $qry = $flowreport->get();

        $total = 0;
        foreach($qry as $q) {
        
            $total += ($q->promo_price == 0) ? ($q->customer_price * $q->qty * 0.95) : ($q->promo_price * $q->qty * 0.95);
        }

        $total2 = 0;
        foreach($qry as $q){

            $total2 += ($q->promo_price == 0) ? ($q->customer_price * $q->qty * 0.05) : ($q->promo_price * $q->qty * 0.05);
        }
        
        $total3 =0;
        foreach($qry as $q){

            $total3 += ($q->promo_price == 0) ? ($q->customer_price * $q->qty * 0.95 * $q->rate / 100) : ($q->promo_price * $q->qty * 0.95 * $q->rate / 100); 
        }

        $flowreport = $flowreport->orderBy('order.id','desc')->paginate(10);
        return view('report.bystore',compact('flowreport','total','request','total2','total3'))->withTitle('By store');
    }

    private function _export_excel($flowreport) {
        $flowreport = $flowreport->get();

        $data = [];
        foreach ($flowreport as $flow) {
            $data[] = ([
                'ID' => $flow->id,
                'Agen' => $flow->name,
                'Order' => $flow->invoice,
                'Nama Produk' =>$flow->proname,
                'Quantity' => $flow->qty,
                'Margin' => number_format(($flow->customer_price - $flow->agen_price) * $flow->qty),
                'Isentif'=> number_format($flow->rate * $flow->agen_price * $flow->qty /100),
                'Paid by Agen' => number_format($flow->agen_price * $flow->qty),
                'Paid by Customer' => number_format($flow->customer_price * $flow->qty),
                'Store' => $flow->stoname,
                'Created At' => $flow->create, 
            ]);
               
        }
        
        return Excel::create('Flow_report', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }
    public function getByCategory(){


        return view('report.bycategory')->withTitle('By Category');   
    }
    public function getByEmployee(){
        $byagen = User::Join('order', 'order.agen_id', '=', 'users.id')
                   ->join('agen', 'agen.identifier', '=', 'users.id')
                   ->join('store', 'store.id', '=', 'users.store_id')
                   ->where('order.status', '7')
                   ->select(DB::raw('SUM(total) as total_sales , COUNT(order.id) as total_order'), 'agen.name', 'store.store_name', 'agen.photo','order.agen_id') 
                   ->groupBy('agen.name','store.store_name','agen.photo','order.agen_id')
                   ->orderBy('total_sales', 'desc')
                   ->get();

        foreach ($byagen as $agen) {
                    $customer = Customer::where('agen_id','=',$agen->agen_id)
                    ->count();
                    $temp[$agen->agen_id] = $customer;
        }

        foreach ($byagen as $agen) {
                    $commission = Commission::where('agen_id','=',$agen->agen_id)
                    ->sum('commission_netto');
                    $coms[$agen->agen_id] = $commission;
        }
        if(isset($request->keyword) && !empty($request->keyword)){
            $byagen = $byagen->where('agen.name','LIKE',$request->keyword.'%');
        }

        return view('report.byemployee',compact('byagen','temp','coms','request'))->withTitle('by employee');
    }
    public function getByChasier(){


        return view('report.bychasier')->withTitle('by Chasier');
    }
}
