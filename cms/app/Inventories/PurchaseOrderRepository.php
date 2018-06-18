<?php

namespace App\Inventories;

class PurchaseOrderRepository
{
    public function getPurchaseOrders($args=[])
    {
        $PurchaseOrders = PurchaseOrder::get();
            
        return $PurchaseOrders;
    }

    public function findPurchaseOrder($id)
    {
        $PurchaseOrder = PurchaseOrder::where('id', $id)
                        ->first();
            
        return $PurchaseOrder;
    }

    public function findPurchaseOrderDetail($id)
    {
        $PurchaseOrder = PurchaseOrderDetails::where('purchase_order_id', $id)
                        ->get();
            
        return $PurchaseOrder;
    }

    public function createOrUpdatePurchaseOrder($id, $header, $details)
    {
        if (!empty($id)) {
            $PurchaseOrder = $this->findPurchaseOrder($id);
            $PurchaseOrderDetails = $this->findPurchaseOrderDetail($id);

            foreach ($PurchaseOrderDetails as $PurchaseOrderDetail) {
                $this->deletePurchaseOrderDetails($PurchaseOrderDetail);
            }
        }
        
        if (!isset($PurchaseOrder)) {
            $header['status'] = 'Pending';
            $PurchaseOrder = PurchaseOrder::create($header);
        }
        else {
            $PurchaseOrder->update($header);
        }

        foreach ($details as $detail) {
            $detail['purchase_order_id'] = (int)$PurchaseOrder->id;

            $PurchaseOrderDetails = PurchaseOrderDetails::create($detail);
        }

        return $PurchaseOrder;
    }

    public function statusPurchaseOrder(PurchaseOrder $PurchaseOrder, $status)
    {
        $PurchaseOrder->status = $status;
        $PurchaseOrder->save();
    }

    public function deletePurchaseOrder(PurchaseOrder $PurchaseOrder)
    {
        $PurchaseOrder->delete();
    }

    public function deletePurchaseOrderDetails(PurchaseOrderDetails $PurchaseOrderDetails)
    {
        $PurchaseOrderDetails->delete();
    }
}