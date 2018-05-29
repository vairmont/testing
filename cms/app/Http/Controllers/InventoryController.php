<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Inventories\SupplierRepository;
use App\Inventories\PurchaseOrderRepository;

class InventoryController extends Controller
{
    protected $suppliers, $purchaseOrders;

    public function __construct(SupplierRepository $suppliers, PurchaseOrderRepository $purchaseOrders)
    {
        $this->suppliers = $suppliers;
        $this->purchaseOrders = $purchaseOrders;
    }

    public function getByPurchaseorder(){
        $purchaseOrders = $this->purchaseOrders->getPurchaseOrders();

        return view('inventory.purchaseorder', compact('purchaseOrders'))->withTitle('By purchase order');
    }

    public function formByPurchaseorder($id="") {
        $title = empty($id) ? "Add Supplier" : "Edit Supplier";

        if (!empty($id)) {
            $supplier = $this->suppliers->findSupplier($id);

            if (is_null($supplier)) {
                abort(404);
            }
        }

        return view('inventory.form-supplier', compact('supplier'))->withTitle($title);
    }

    public function saveByPurchaseorder(Request $request, $id = "")
    {
        $input = $request->only(['name', 'contact', 'email', 'phone', 'website', 'address_1', 'address_2', 'city', 'zipcode', 'province', 'notes']);

        $this->suppliers->createOrUpdateSupplier($id, $input);

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

    public function getByInventoryHistory(){
        return view('inventory.inventoryhistory')->withTitle('by inventory history');
    }

    public function getByInventoryValuation(){
        return view('inventory.inventoryValuation')->withTitle('by invetory valuation');
    }
}
