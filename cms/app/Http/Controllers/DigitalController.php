<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Products\ItemRepository;
use App\Products\CategoryRepository;
use App\Products\DiscountRepository;
use App\Stores\StoreRepository;
use App\Stores\TaxRepository;
use App\Stores\IncentiveRepository;
use App\Inventories\StockRepository;
use App\Slider;
use App\Product;
use Auth;

use Excel;

class DigitalController extends Controller
{
    protected $items, $categories, $discounts, $stores, $taxes, $incentives, $stocks;


    public function getProductItem(Request $req) {
        
        return view('digital.digitalprod', compact('items', 'categories'))->withTitle('Daftar Item');
    }
}