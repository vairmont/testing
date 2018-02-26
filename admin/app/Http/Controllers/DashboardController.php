<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Customer;
use App\Reseller;
use App\Dealer;
use App\Product;
use App\Voucher;
use App\NewsPromo;
use App\Service;
use App\Ticket;

class DashboardController extends Controller
{
    public function create()
    {
        // ACCOUNT
        $customer = Customer::select(DB::raw("count('id') as total"))->first();
        $reseller_owner = Reseller::join('users','reseller.identifier','=','users.id')
                        ->join('role','role.id','=','users.role_id')
                        ->where('role.name','Reseller Owner')
                        ->select(DB::raw("count('reseller.id') as total"))
                        ->first();
        $reseller_staff = Reseller::join('users','reseller.identifier','=','users.id')
                        ->join('role','role.id','=','users.role_id')
                        ->where('role.name','Reseller Staff')
                        ->select(DB::raw("count('reseller.id') as total"))
                        ->first();
        $dealer = Dealer::select(DB::raw("count('id') as total"))->first();

        // PRODUCT
        $printer_inkjet = Product::join('product_category','product_category.id','=','product.category_id')
        ->where('product_category.name', 'Printer Inkjet')
        ->select(DB::raw("count('product.id') as total"))
        ->first();
        $printer_laser = Product::join('product_category','product_category.id','=','product.category_id')
        ->where('product_category.name', 'Printer Laser')
        ->select(DB::raw("count('product.id') as total"))
        ->first();
        $printer_label = Product::join('product_category','product_category.id','=','product.category_id')
        ->where('product_category.name', 'Printer Label')
        ->select(DB::raw("count('product.id') as total"))
        ->first();
        $scanner = Product::join('product_category','product_category.id','=','product.category_id')
        ->where('product_category.name', 'Scanner')
        ->select(DB::raw("count('product.id') as total"))
        ->first();
        $mesin_jahit = Product::join('product_category','product_category.id','=','product.category_id')
        ->where('product_category.name', 'Mesin Jahit')
        ->select(DB::raw("count('product.id') as total"))
        ->first();
        $lain_lain = Product::join('product_category','product_category.id','=','product.category_id')
        ->where('product_category.name', 'Lain Lain')
        ->select(DB::raw("count('product.id') as total"))
        ->first();

        // VOUCHERS
        $voucher = Voucher::orderBy('discount_rate')->get();

        // NEWS PROMO
        $newspromo_customer = NewsPromo::where('customer',1)->select(DB::raw("count('id') as total"))->first();
        $newspromo_reseller= NewsPromo::where('reseller',1)->select(DB::raw("count('id') as total"))->first();
        $newspromo_dealer = NewsPromo::where('dealer',1)->select(DB::raw("count('id') as total"))->first();

        // SERVICE
        $branch_office = Service::join('service_status','service.status_id','=','service_status.id')
        ->where('service_status.slug','branch_office')
        ->select(DB::raw("count('service.id') as total"))
        ->first();
        $head_office = Service::join('service_status','service.status_id','=','service_status.id')
        ->where('service_status.slug','head_office')
        ->select(DB::raw("count('service.id') as total"))
        ->first();
        $itsc_partner = Service::join('service_status','service.status_id','=','service_status.id')
        ->where('service_status.slug','itsc_partner')
        ->select(DB::raw("count('service.id') as total"))
        ->first();
        $tsg_partner = Service::join('service_status','service.status_id','=','service_status.id')
        ->where('service_status.slug','tsg_partner')
        ->select(DB::raw("count('service.id') as total"))
        ->first();
        $itsc = Service::join('service_status','service.status_id','=','service_status.id')
        ->where('service_status.slug','itsc')
        ->select(DB::raw("count('service.id') as total"))
        ->first();

        // TICKET SUPPORT
        $unreplied = Ticket::where('status','Unreplied')->select(DB::raw("count('id') as total"))->first();
        $replied = Ticket::where('status','Replied')->select(DB::raw("count('id') as total"))->first();
        $closed = Ticket::where('status','Closed')->select(DB::raw("count('id') as total"))->first();

        return view('dashboard.create', compact(
            'customer', 'reseller_owner', 'reseller_staff', 'dealer',
            'printer_inkjet', 'printer_laser', 'printer_label', 'scanner', 'mesin_jahit', 'lain_lain',
            'voucher',
            'newspromo_customer', 'newspromo_reseller', 'newspromo_dealer',
            'branch_office','head_office','itsc_partner','tsg_partner','itsc',
            'unreplied','replied','closed'
        ))
        ->withTitle('Dashboard');
    }
}
