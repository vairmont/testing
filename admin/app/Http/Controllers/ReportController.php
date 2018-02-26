<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function getOrders() {
        return view('report.order')->withTitle('Orders');
    }

    public function getProducts() {
        return view('report.product')->withTitle('Products');
    }
}
