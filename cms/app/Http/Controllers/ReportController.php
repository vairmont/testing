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
use PDF;
use Carbon\Carbon;
use App\Supplier;
use App\ProductCategory;
use App\Agen;

use DB;

class ReportController extends Controller
{
    public function getByItem(Request $request){
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
        ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id','role.name as uid','store.store_name as sname','order_detail.created_at as create','order_detail.updated_at as update', 'suppliers.name as supplier', 'product.price_for_customer', 'product.promo_price','order.id as oid');

        if(isset($request->date) && $request->date == '1'){
            $totalsales = Order::join('order_detail','order.id','=','order_detail.order_id')
            ->join('product','product.id','=','order_detail.product_id')
            ->join('suppliers', 'product.suppliers_id', '=', 'suppliers.id')
            ->join('users','users.id','=','order.user_id')
            ->join('store','store.id','=','users.store_id')
            ->join('role','role.id','=','users.role_id')
            ->whereIn('order.status',[7,9])
            ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id','role.name as uid','store.store_name as sname','order_detail.created_at as create','order.updated_at as update', 'suppliers.name as supplier', 'product.price_for_customer', 'product.promo_price','order.id as oid')
            ->whereDate('order_detail.created_at','=',Carbon::today()->toDateString());
        }
        if(isset($request->date) && $request->date == '2'){
            $totalsales = Order::join('order_detail','order.id','=','order_detail.order_id')
            ->join('product','product.id','=','order_detail.product_id')
            ->join('suppliers', 'product.suppliers_id', '=', 'suppliers.id')
            ->join('users','users.id','=','order.user_id')
            ->join('store','store.id','=','users.store_id')
            ->join('role','role.id','=','users.role_id')
            ->whereIn('order.status',[7,9])
            ->select('product.sku as sku','product.product_name as name','order_detail.qty as qty','order.total as nominal','product.cost as cost','order_detail.id as id','role.name as uid','store.store_name as sname','order_detail.created_at as create','order.updated_at as update', 'suppliers.name as supplier', 'product.price_for_customer', 'product.promo_price','order.id as oid')
            ->whereMonth('order_detail.created_at', '=', date('m'));  
        }

        if(isset($request->dayword1) && !empty($request->dayword1) && isset($request->dayword2) && !empty($request->dayword2)){
            $totalsales = $totalsales->whereBetween('order_detail.created_at',[$request->dayword1, Carbon::parse($request->dayword2)->addDays(1)]);
            
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
            $total1 += ($q->cost);
        }

        $total2 = 0;
        foreach($qry as $q) {    
            $total2 += ($q->cost * $q->qty);
        }
        
        $totalsales = $totalsales->orderby('order_detail.created_at','desc')->paginate(10);  
        return view('report.byitem',compact('totalsales', 'request','total1','total2'))->withTitle('By withdraw');
        
    }
    private function _export_excel2($totalsales) {
        $totalsales = $totalsales->get();
        
        $data = [];
        foreach ($totalsales as $total) {
            $data[] = ([
                'ID' => $total->id,
                'SKU'=>$total->sku,
                'Supplier'=>$total->supplier,
                'Nama Barang'=>$total->name,
                'Quantity'=>$total->qty,
                'Harga Satuan'=>number_format($total->cost),
                'Total Pembelian'=>number_format($total->cost * $total->qty),
                'Store'=>$total->sname,
                'Tanggal'=>$total->create,
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
        ->leftjoin('customer','customer.identifier','=','order.user_id')
        ->leftjoin('store','store.id','=','users.store_id')
        
        ->whereIn('order.status',[7,9])
        ->where('order.type','=','sembako')
        ->select('customer.name as cusname','product.tax as tax','order.discount as discount','agen.source as source','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price');

        
        if(isset($request->date) && $request->date == '1'){
            $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
            ->leftjoin('product','product.id','=','order_detail.product_id')
            ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
            ->leftjoin('agen','agen.identifier','=','order.agen_id')
            ->leftjoin('users','users.id','=','agen.identifier')
            ->leftjoin('customer','customer.identifier','=','order.user_id')
            ->leftjoin('store','store.id','=','users.store_id')
            ->whereIn('order.status',[7,9])
            ->where('order.type','=','sembako')
            ->select('customer.name as cusname','product.tax as tax','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
            ->whereDate('order.created_at','=',Carbon::today()->toDateString());
        }
        if(isset($request->date) && $request->date == '2'){
            $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
            ->leftjoin('product','product.id','=','order_detail.product_id')
            ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
            ->leftjoin('agen','agen.identifier','=','order.agen_id')
            ->leftjoin('users','users.id','=','agen.identifier')
            ->leftjoin('customer','customer.identifier','=','order.user_id')
            ->leftjoin('store','store.id','=','users.store_id')
            ->whereIn('order.status',[7,9])
            ->where('order.type','=','sembako')
            ->select('customer.name as cusname','product.tax as tax','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
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
        if(isset($request->keyword1) && !empty($request->keyword1)) {
            $flowreport = $flowreport->where('product.product_name','like',$request->keyword1.'%');
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

        if ($isExport) {
            $this->_export_excel($qry);
        }
        $flowreport = $flowreport->orderBy('order.id','desc')->paginate(10);
        return view('report.bystore',compact('flowreport','total','request','total2','total3'))->withTitle('By store');
    }

    private function _export_excel($flowreport) {

        $data = [];
        foreach ($flowreport as $flow) {
            $data[] = ([
                'ID' => $flow->id,
                'Pembeli' => ($flow->cusname == NULL) ? "Kasir" : $flow->cusname,
                'Agen' => $flow->name,
                'Order' => $flow->invoice,
                'Nama Produk' =>$flow->proname,
                'Quantity' => $flow->qty,
                'DPP' => ($flow->tax == 0) ? number_format(($flow->customer_price * $flow->qty) / 1.1) : number_format($flow->customer_price * $flow->qty),
                'PPN' => ($flow->tax == 0) ? number_format(($flow->customer_price * $flow->qty) / 1.1 / 100 * 10) : 0,
                'Paid by Customer' => number_format($flow->customer_price * $flow->qty), 
                'Margin' => ($flow->source == NULL) ? 0 : number_format($flow->customer_price * $flow->qty * 0.05),
                'Paid by Agen' => number_format($flow->customer_price * $flow->qty * 0.95),
                'Isentif'=> ($flow->source == NULL) ? 0 : number_format($flow->customer_price * $flow->qty * 0.95 * $flow->rate / 100),
                'Discount' => number_format($flow->discount),
                'Store' => ($flow->source == NULL) ? "Serang" : $flow->stoname,
                'Source'=> ($flow->source == NULL) ? "Kasir" : $flow->source,
                'Tanggal' => $flow->create, 
                
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
    public function getByCategory(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $categories = ProductCategory::all();

        foreach($categories as $category) {
            $bycat[$category->name] = OrderDetail::where('category_id', $category->id)
            ->select(DB::raw(
                'SUM(order_detail.qty) as qty, SUM(order_detail.price_for_agen) as modal'
            ))
            ->first();
        }

        if ($isExport) {
            
            $this->_export_excelcat($categories);
        }
        return view('report.bycategory',compact('bycat','categories'))->withTitle('By Category');   
    }
    private function _export_excelcat($categories) {
        $categories = ProductCategory::all();

        foreach($categories as $category) {
            $bycat[$category->name] = OrderDetail::where('category_id', $category->id)
            ->select(DB::raw(
                'SUM(order_detail.qty) as qty, SUM(order_detail.price_for_agen) as modal'
            ))
            ->first();
        }

        $data = [];
        foreach ($categories as $c) {
            $data[] = ([
                'Name' => $c->name,
                'Quantity' =>number_format($bycat[$c->name]->qty),
                'Total' => number_format($bycat[$c->name]->modal),
            ]);
        }
        
        
        return Excel::create('Category_Report', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
    }
    public function getByProduct(Request $request,$category){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $category = ProductCategory::where('name', $category)->first();
        $products = Product::where('category_id',$category->id);

        if(isset($request->keyword) && !empty($request->keyword)) {
            $products = $products->where('product.product_name','like',$request->keyword.'%');
        }
        $products = $products->get();

        foreach($products as $product){
            $byprod[$product->product_name] = OrderDetail::where('product_id', $product->id)
            ->select(DB::raw(
                'SUM(order_detail.qty) as qty, SUM(order_detail.price_for_agen) as modal'
            ))
            ->first();
            $data[] = ([
                'Name' => $product->product_name,
                'Quantity' =>number_format($byprod[$product->product_name]->qty),
                'Total' => number_format($byprod[$product->product_name]->modal),
            ]);
        }
        
        if ($isExport) {
            return Excel::create('Product_report', function($excel) use($data) {
                $excel->sheet('Sheetname', function($sheet) use($data) {
                    $row = 1;
    
                    $sheet->fromArray($data, null, 'A' . $row, true, true);
    
                    $sheet->getStyle("A1:" . 'G' . $row)
                        ->getAlignment()->setWrapText(false);
                });
            })->export('xls');
        }
        return view('report.byproduct',compact('products','byprod','request'))->withTitle('By product');
    }

    public function getByEmployee(Request $request){
        $isExport = $request->get('is_export', 0);
        $args['pages'] = $isExport;

        $byagen = User::Join('order', 'order.agen_id', '=', 'users.id')
                   ->join('agen', 'agen.identifier', '=', 'users.id')
                   ->join('store', 'store.id', '=', 'users.store_id')
                   ->where('order.status', '7')
                   ->select(DB::raw('SUM(total) as total_sales , COUNT(order.id) as total_order'), 'agen.name', 'store.store_name', 'agen.photo','agen.identifier','agen.id as aid') 
                   ->groupBy('agen.name','store.store_name','agen.photo','agen.identifier','agen.id')
                   ->orderBy('total_sales', 'desc')
                   ->get();

        foreach ($byagen as $agen) {
                    $customer = Customer::where('agen_id','=',$agen->aid)
                    ->count();
                    $temp[$agen->aid] = $customer;
        }

        foreach ($byagen as $agen) {
                    $commission = Commission::where('agen_id','=',$agen->identifier)
                    ->sum('commission_netto');
                    $coms[$agen->identifier] = $commission;
        }
        if(isset($request->keyword) && !empty($request->keyword)){
            $byagen = $byagen->where('agen.name','LIKE',$request->keyword);
        
        }
        if ($isExport) {
       
        $data = [];
    foreach ($byagen as $ba) {
        $data[] = ([
            'Nama'=> $ba->name,
            'Penjualan' => number_format($ba->total_sales),
            'Pendapatan Bersih' => number_format($coms[$ba->identifier]),
            'Jumlah Penjualan' => number_format($ba->total_order),
            'Jumlah Customer' => number_format($temp[$ba->aid]),
        ]);
    }
    
    return Excel::create('Agen_report', function($excel) use($data) {
        $excel->sheet('Sheetname', function($sheet) use($data) {
            $row = 1;

            $sheet->fromArray($data, null, 'A' . $row, true, true);

            $sheet->getStyle("A1:" . 'G' . $row)
                ->getAlignment()->setWrapText(false);
        });
    })->export('xls');
    }

        return view('report.byemployee',compact('byagen','temp','coms','request'))->withTitle('by employee');
    }
   public function getByMargin(Request $request){
    $isExport = $request->get('is_export', 0);
    $args['pages'] = $isExport;

    $margin = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
    ->join('product','product.id','=','order_detail.product_id')
    ->join('incentive_category','incentive_category.id','=','product.incentive_id')
    ->join('agen','agen.identifier','=','order.agen_id')
    ->join('users','users.id','=','agen.identifier')
    ->join('store','store.id','=','users.store_id')
    ->whereIn('order.status',[7,9])
    ->select('store.store_name as stoname','agen.source as source','product.cost as cost','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price');
    $qry = $margin->get();
    
    $total1 = 0;
    foreach($qry as $q) {
        $total1 += (($q->customer_price * $q->qty * 0.95)-($q->cost * $q->qty))-(($q->customer_price * $q->qty * 0.95 * $q->rate / 100));
    }

    if(isset($request->keyword) && !empty($request->keyword)) {
        $margin = $margin->where('product.product_name','like',$request->keyword.'%');
    }
    if(isset($request->dayword1) && !empty($request->dayword1) && isset($request->dayword2) && !empty($request->dayword2)){
        $margin = $margin->whereBetween('order.created_at',[$request->dayword1, Carbon::parse($request->dayword2)->addDays(1)]);
        } 
        $m = $margin->get();  
    if ($isExport) {
       
        $data = [];
    foreach ($m as $mar) {
        $data[] = ([
            'Tanggal'=> $mar->create,
            'Produk' => $mar->proname ,
            'Quantity' => $mar->qty,
            'Toko' => $mar->stoname,
            'Sales G1' => number_format($mar->customer_price * $mar->qty * 0.95),
            'HPP' => number_format($mar->cost * $mar->qty),
            'GrosirOne Margin' => number_format(($mar->customer_price * $mar->qty * 0.95)-($mar->cost * $mar->qty)),
            'Insentif agen' =>number_format($mar->customer_price * $mar->qty * 0.95 * $mar->rate / 100),
            'Net Margin' =>number_format((($mar->customer_price * $mar->qty * 0.95)-($mar->cost * $mar->qty))-(($mar->customer_price * $mar->qty * 0.95 * $mar->rate / 100))),
        ]);
    }
    
    return Excel::create('Margin_report', function($excel) use($data) {
        $excel->sheet('Sheetname', function($sheet) use($data) {
            $row = 1;

            $sheet->fromArray($data, null, 'A' . $row, true, true);

            $sheet->getStyle("A1:" . 'G' . $row)
                ->getAlignment()->setWrapText(false);
        });
    })->export('xls');
    }
    
        $margin = $margin->orderby('order.created_at','desc')->paginate(10);  
        return view('report.bymargin',compact('margin','request','total1'))->withTitle('Margin');
   }

   //Tombol inVoice untuk tampilan laporan penjualan
   public function getInvoice(request $request, $id)
   {
        $awal = new Carbon('first day of july 2018');
        $akhir = new Carbon('last day of september 2018');

        $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
        ->leftjoin('product','product.id','=','order_detail.product_id')
        ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
        ->leftjoin('agen','agen.identifier','=','order.agen_id')
        ->leftjoin('users','users.id','=','agen.identifier')
        ->leftjoin('customer','customer.identifier','=','order.user_id')
        ->leftjoin('store','store.id','=','users.store_id')
        
        ->whereIn('order.status',[7,9])
        ->where('order.type','=','sembako')
        ->select('customer.name as cusname','product.tax as tax','order.discount as discount','agen.source as source','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
        ->where('order_detail.id',$id)
        ->get();

        $pdf = PDF::loadView('pdf.invoicebyorder',compact('awal','akhir','flowreport','request'));
        //return view('pdf.invoicebyorder',compact('awal','akhir','flowreport','request'));
        return $pdf->download('invoicebyorder.pdf');
        
   }

   // untuk Laporan penjualan bulan Nov ke atas 
   public function getByStoreNov(Request $request){
        $isExport = $request->get('is_export', 0);
        //var_dump($isExport);die;
        $args['pages'] = $isExport;

        $bulanA = new Carbon('first day of november 2018');

        $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
        ->leftjoin('product','product.id','=','order_detail.product_id')
        ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
        ->leftjoin('agen','agen.identifier','=','order.agen_id')
        ->leftjoin('users','users.id','=','agen.identifier')
        ->leftjoin('customer','customer.identifier','=','order.user_id')
        ->leftjoin('store','store.id','=','users.store_id')
        
        ->whereIn('order.status',[7,9])
        ->where('order.created_at','>',$bulanA)
        ->where('order.type','=','sembako')
        ->select('customer.name as cusname','product.tax as tax','order.discount as discount','agen.source as source','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price');

        
        if(isset($request->date) && $request->date == '1'){
            $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
            ->leftjoin('product','product.id','=','order_detail.product_id')
            ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
            ->leftjoin('agen','agen.identifier','=','order.agen_id')
            ->leftjoin('users','users.id','=','agen.identifier')
            ->leftjoin('customer','customer.identifier','=','order.user_id')
            ->leftjoin('store','store.id','=','users.store_id')
            ->whereIn('order.status',[7,9])
            ->where('order.created_at','>',$bulanA)
            ->where('order.type','=','sembako')
            ->select('customer.name as cusname','product.tax as tax','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
            ->whereDate('order.created_at','=',Carbon::today()->toDateString());
        }
        if(isset($request->date) && $request->date == '2'){
            $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
            ->leftjoin('product','product.id','=','order_detail.product_id')
            ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
            ->leftjoin('agen','agen.identifier','=','order.agen_id')
            ->leftjoin('users','users.id','=','agen.identifier')
            ->leftjoin('customer','customer.identifier','=','order.user_id')
            ->leftjoin('store','store.id','=','users.store_id')
            ->whereIn('order.status',[7,9])
            ->where('order.created_at','>',$bulanA)
            ->where('order.type','=','sembako')
            ->select('customer.name as cusname','product.tax as tax','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.order_id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
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
        if(isset($request->keyword1) && !empty($request->keyword1)) {
            $flowreport = $flowreport->where('product.product_name','like',$request->keyword1.'%');
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

        if ($isExport) {
            $data = [];
            foreach ($qry as $flow) {
            $data[] = ([
                'ID' => $flow->id,
                'Pembeli' => ($flow->cusname == NULL) ? "Kasir" : $flow->cusname,
                'Agen' => $flow->name,
                'Order' => $flow->invoice,
                'Nama Produk' =>$flow->proname,
                'Quantity' => $flow->qty,
                'Harga Jual' => number_format((($flow->customer_price * $flow->qty * 0.95) / 1.1)+($flow->customer_price * $flow->qty * 0.05)),
                'Discount' => ($flow->source == NULL) ? 0 : number_format($flow->customer_price * $flow->qty * 0.05),
                'DPP' => number_format(($flow->customer_price * $flow->qty * 0.95) / 1.1),
                'PPN' => ($flow->tax == 0) ? number_format(((($flow->customer_price * $flow->qty * 0.95) / 1.1)) / 100 * 10 ) : 0,
                'Paid by Customer' => ($flow->tax == 0) ? number_format($flow->customer_price * $flow->qty * 0.95) : number_format(($flow->customer_price * $flow->qty * 0.95) / 1.1), 
                'Tanggal' => $flow->create, 
                ]);
            }
            //var_dump($data);die;
            return Excel::create('Flow_report', function($excel) use($data) {
            $excel->sheet('Sheetname', function($sheet) use($data) {
                $row = 1;

                $sheet->fromArray($data, null, 'A' . $row, true, true);

                $sheet->getStyle("A1:" . 'G' . $row)
                    ->getAlignment()->setWrapText(false);
            });
        })->export('xls');
        }
        $flowreport = $flowreport->orderBy('order.id','desc')->paginate(10);
        return view('report.bystorenov',compact('flowreport','total','request','total2','total3'))->withTitle('By store November');
    }

    //Tombol inVoice untuk tampilan laporan penjualan november
   public function getInvoiceNov(request $request, $id)
   {
        $bulanA = new Carbon('first day of november 2018');

        $flowreport = Order::leftjoin('order_detail','order.id','=','order_detail.order_id')
        ->leftjoin('product','product.id','=','order_detail.product_id')
        ->leftjoin('incentive_category','incentive_category.id','=','product.incentive_id')
        ->leftjoin('agen','agen.identifier','=','order.agen_id')
        ->leftjoin('users','users.id','=','agen.identifier')
        ->leftjoin('customer','customer.identifier','=','order.user_id')
        ->leftjoin('store','store.id','=','users.store_id')
        
        ->whereIn('order.status',[7,9])
        ->where('order.created_at','>',$bulanA)
        ->where('order.type','=','sembako')
        ->select('customer.name as cusname','product.tax as tax','order.discount as discount','agen.source as source','store.store_name as stoname','order_detail.qty as qty','incentive_category.rate as rate','order.invoice_no as invoice','agen.name as name','order_detail.id as id','product.product_name as proname','order_detail.price_for_agen as agen_price','order_detail.price_for_customer as customer_price','order.created_at as create','order.updated_at as update','order.agen_id as aid', 'product.promo_price')
        ->where('order_detail.id',$id)
        ->get();

        $pdf = PDF::loadView('pdf.invoicenovbyorder',compact('flowreport','request'));
        //return view('pdf.invoicenovbyorder',compact('flowreport','request'));
        return $pdf->download('invoicenovbyorder.pdf');
        
   }
        
}
