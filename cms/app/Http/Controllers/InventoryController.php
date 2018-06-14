<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Products\ItemRepository;
use App\Products\CategoryRepository;
use App\Inventories\SupplierRepository;
use App\Inventories\PurchaseOrderRepository;
use App\Inventories\StockRepository;
use App\Inventories\StockHistoryRepository;
use App\Stores\StoreRepository;

class InventoryController extends Controller
{
    protected $suppliers, $purchaseOrders, $stores, $items, $categories, $stocks, $stockHistories;

    public function __construct(SupplierRepository $suppliers, PurchaseOrderRepository $purchaseOrders, StockRepository $stocks,  StockHistoryRepository $stockHistories, StoreRepository $stores, ItemRepository $items, CategoryRepository $categories)
    {
        $this->suppliers = $suppliers;
        $this->purchaseOrders = $purchaseOrders;
        $this->stores = $stores;
        $this->items = $items;
        $this->categories = $categories;
        $this->stocks = $stocks;
        $this->stockHistories = $stockHistories;
    }

    public function getByPurchaseorder(){
        $purchaseOrders = $this->purchaseOrders->getPurchaseOrders();

        return view('inventory.purchaseorder', compact('purchaseOrders'))->withTitle('By purchase order');
    }

    public function formByPurchaseorder($id="") {
        $title = empty($id) ? "Add Purchase Order" : "Edit Purchase Order";
        $suppliers = $this->suppliers->getSuppliers();
        $stores = $this->stores->getStores();
        $items = $this->items->getItems();

        if (!empty($id)) {
            $purchaseOrder = $this->purchaseOrders->findpurchaseOrder($id);

            if (is_null($purchaseOrder)) {
                abort(404);
            }
        }

        return view('inventory.form-purchaseorder', compact('purchaseOrder', 'suppliers', 'stores', 'items'))->withTitle($title);
    }

    public function processItem(Request $request){
        $id = $request->input('id');
        $name = $request->input('name');
        $store_id = $request->input('store_id');
        $stock = "-";
        $in = "-";

        $getStock = $this->stocks->getStockbyProductStoreId($id, $store_id);

        if (!is_null($getStock)) {
            $stock = $getStock->total_quantity;
        }

        $html = "<tr id='item-".$id."'>
                    <td><input type='hidden' name='product_id[]' value='".$id."'>
                        ".$name."
                    </td>
                    <td>
                        ".$stock."
                    </td>
                    <td>
                        ".$in."
                    </td>
                    <td>
                        <input type='numeric' name='quantity[]'>
                    </td>
                    <td>
                        <input type='numeric' name='price[]'>
                    </td>
                    <td class='total'>
                    </td>
                    <td>
                        <a onClick='removeLine(".$id.")'>Remove</a>
                    </td>
                </tr>";

        echo $html;
    }

    public function saveByPurchaseorder(Request $request, $id = "")
    {
        $input = $request->only(['name', 'contact', 'email', 'phone', 'website', 'address_1', 'address_2', 'city', 'zipcode', 'province', 'notes']);

        $this->purchaseOrders->createOrUpdatepurchaseOrder($id, $input);

        return redirect('bypurchaseorder');
    }

    public function getByTransferorder(){
        return view('inventory.transferorder')->withTitle('by purchase order');
    }

    public function getByAdjustment(){
        return view('inventory.stockadjustment')->withTitle('by stock adjustment');
    }

    public function getBySupplier(){
        $suppliers = $this->suppliers->getSuppliers();

        return view('inventory.supplier', compact('suppliers'))->withTitle('by Supplier');
    }

    public function formBySupplier($id="") {
        $title = empty($id) ? "Add Supplier" : "Edit Supplier";

        if (!empty($id)) {
            $supplier = $this->suppliers->findSupplier($id);

            if (is_null($supplier)) {
                abort(404);
            }
        }

        return view('inventory.form-supplier', compact('supplier'))->withTitle($title);
    }

    public function saveBySupplier(Request $request, $id = "")
    {
        $input = $request->only(['name', 'contact', 'email', 'phone', 'website', 'address_1', 'address_2', 'city', 'zipcode', 'province', 'notes']);

        $this->suppliers->createOrUpdateSupplier($id, $input);

        return redirect('bysupplier');
    }

    public function deleteSupplier($id = "")
    {
        if (!empty($id)) {
            $supplier = $this->suppliers->findSupplier($id);

            if (is_null($supplier)) {
                abort(404);
            } else {
               $this->suppliers->deleteSupplier($supplier);
            }
        }

        return redirect('bysupplier');
    }

    public function getByInventoryHistory(Request $req){
        // $args = $req->only();
        $categoryArgs['get_all'] = true;
        $categories = $this->categories->getCategories($categoryArgs);
        $histories = $this->stockHistories->getStockHistories();

        return view('inventory.inventoryhistory', compact('categories', 'histories'))->withTitle('by inventory history');
    }

    public function getByInventoryValuation(){
        return view('inventory.inventoryValuation')->withTitle('by invetory valuation');
    }
}
