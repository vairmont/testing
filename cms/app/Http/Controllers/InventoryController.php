<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InventoryController extends Controller
{
    public function getByPurchaseorder(){


        return view('inventory.purchaseorder')->withTitle('By purchase order');
    }
    public function getByTransferorder(){


        return view('inventory.transferorder')->withTitle('by purchase order');
    }
    public function getByAdjustment(){


        return view('inventory.stockadjustment')->withTitle('by stock adjustment');
    }
    public function getBySupplier(){


        return view('inventory.supplier')->withTitle('by Supplier');
    }
    public function getByInventoryHistory(){


        return view('inventory.inventoryhistory')->withTitle('by inventory history');
    }
    public function getByInventoryValuation(){


        return view('inventory.inventoryValuation')->withTitle('by invetory valuation');
    }
}
