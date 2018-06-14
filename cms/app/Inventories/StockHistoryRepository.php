<?php

namespace App\Inventories;
use DB;

class StockHistoryRepository
{
    public function getStockHistories($args=[])
    {
        $StockHistories = StockHistory::select(DB::raw('stock_history.*, sum(stock.quantity) as total_stock'))
                                ->join('stock', function($q)
                                {
                                    $q->on('stock.product_id', '=', 'stock_history.product_id')
                                        ->on('stock.store_id', '=', 'stock_history.store_id');
                                })
                                ->groupBy('stock.product_id', 'stock.store_id')
                                ->get();
            
        return $StockHistories;
    }
}