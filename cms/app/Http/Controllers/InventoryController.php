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

    public function getByPurchaseorder(Request $req){
        $args = $req->only(['status', 'supplier', 'store']);
        $args['pages'] = 10;
        
        $purchaseOrders = $this->purchaseOrders->getPurchaseOrders($args);
        $suppliers = $this->suppliers->getSuppliers();
        $stores = $this->stores->getStores();

        return view('inventory.purchaseorder', compact('purchaseOrders', 'suppliers', 'stores'))->withTitle('By purchase order');
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
                        <input type='numeric' name='quantity[]' class='' id='qty-".$id."'>
                    </td>
                    <td>
                        <input type='numeric' name='price[]' class='item-price' id='price-".$id."'>
                    </td>
                    <td class='item-total' id='total-".$id."'>
                    </td>
                    <td>
                        <a class='remove-line' id='remove-".$id."'>Remove</a>
                    </td>
                </tr>";

        echo $html;
    }

    public function saveByPurchaseorder(Request $request, $id = "")
    {
        $header = $request->only(['supplier_id', 'store_id', 'po_date', 'po_estimate_date', 'notes']);
        $product_ids = $request->only(['product_id']);
        $quantitys = $request->only(['quantity']);
        $prices = $request->only(['price']);

        $details = [];
        for ($i = 0 ; $i <= count($product_ids) ; $i++) {
            foreach ($product_ids['product_id'] as $key => $value) {
                if ($key==$i) {
                    $product_id = $value;
                    break;
                }
            }
            foreach ($quantitys['quantity'] as $key => $value) {
                if ($key==$i) {
                    $quantity = $value;
                    break;
                }
            }
            foreach ($prices['price'] as $key => $value) {
                if ($key==$i) {
                    $price = $value;
                    break;
                }
            }
            $details[] = array(
                'product_id' => (int)$product_id,
                'quantity' => (int)$quantity,
                'price' => $price,
            );
        }

        $this->purchaseOrders->createOrUpdatePurchaseOrder($id, $header, $details);

        return redirect('bypurchaseorder');
    }

    public function changeStatusByPurchaseorder($id, $status)
    {
        $purchaseOrder = $this->purchaseOrders->findpurchaseOrder($id);
        $edit = $this->purchaseOrders->statusPurchaseOrder($purchaseOrder, $status);

        if ($status == 'Close') {
            //insert stock, stock history
            foreach ($purchaseOrder->purchaseOrderDetails as $detail) {
                $input = [];

                $input['product_id'] = $detail->product_id;
                $input['store_id'] = $purchaseOrder->store_id;
                $input['quantity'] = $detail->quantity;
                $input['price'] = $detail->price;
                $stock = $this->stocks->createOrUpdateStock("", $input);

                unset($input['price']);
                $input['reason'] = 'Accepted';
                $stockHistories = $this->stockHistories->createStockHistory($input);
            }
        }
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
        $args = $req->only(['store_id', 'category_id']);
        $categoryArgs['get_all'] = true;
        $categories = $this->categories->getCategories($categoryArgs);
        $histories = $this->stockHistories->getStockHistories($args);

        $stores = $this->stores->getStores();

        return view('inventory.inventoryhistory', compact('categories', 'histories', 'stores', 'args'))->withTitle('by inventory history');
    }

    public function getByInventoryValuation(){
        return view('inventory.inventoryValuation')->withTitle('by invetory valuation');
    }
}
