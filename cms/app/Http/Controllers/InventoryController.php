<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Supplier;
use App\Stock;
use App\Store;
use Auth;
use App\StockHistory;

class InventoryController extends Controller
{
    public function getByPurchaseorder(){


        return view('inventory.purchaseorder')->withTitle('By purchase order');
    }
    public function getByTransferorder(){


        return view('inventory.transferorder')->withTitle('by purchase order');
    }
    public function getByAdjustment(Request $request){
        $store = Store::all();
        $stock = Stock::join('product','product.id','=','stock.product_id')
                    ->join('store','store.id','=','stock.store_id')
                    ->select('stock.id as id','store.store_name as store_name','product.product_name as product_name','product.cost as cost','stock.quantity as quantity');

        if(isset($request->keyword) && !empty($request->keyword)){
            $stock = $stock->where('product.product_name','LIKE',$request->keyword.'%');
        }
        if(isset($request->store_id) && !empty($request->store_id)){
            $stock = $stock->where('store.id','=',$request->store_id);
        }

        $stock = $stock->orderby('stock.created_at','desc')->get();
        return view('inventory.stockadjustment',compact('stock','store'))->withTitle('by stock adjustment');
    }

    public function editStock(Request $request, $id = "")
    {      
        if (empty($request->reason))
        {
            return back();
        }
        $stockid = Stock::find($id);

        $quantitystart = $stockid->quantity;
        $quantityedit = $request->quantity - $stockid->quantity;

        $StockHistory = new StockHistory;
        $StockHistory->product_id = $stockid->product_id;
        $StockHistory->store_id = $stockid->store_id;
        $StockHistory->reason = $request->reason;
        $StockHistory->quantity = $quantityedit;
        $StockHistory->start_stock = $quantitystart;
        $StockHistory->created_by = Auth::user()->id;
        $StockHistory->updated_by = Auth::user()->id;
        $StockHistory->save();


        $stock = Stock::where('id','=',$id)
        ->update(['quantity' => $request->quantity]);

        return back();
    }

    public function getBySupplier(){
        $suppliers = Supplier::all();
        return view('inventory.supplier',compact('suppliers'))->withTitle('by Supplier');
       
    }
    public function getByInventoryHistory(){

        return view('inventory.inventoryhistory')->withTitle('by inventory history');
    }
    public function getByInventoryValuation(){


        return view('inventory.inventoryValuation')->withTitle('by invetory valuation');
    }
}
