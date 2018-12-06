<?php

namespace App\Http\Controllers;

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Agen;
use App\User;
use App\Order;
use App\OrderDetail;
use App\OrderBillingDetail;
use Carbon\Carbon;
use App\WaneeHistory;
use App\Commission;
use App\Stores\store;
use Excel;

class OrderController extends Controller
{

	 public function orderProcess(Request $request) {

        $orders = Order::Join('customer','customer.identifier','=','order.user_id')
        ->leftJoin('agen','agen.identifier','=','order.agen_id')
        ->leftJoin('order_billing_detail','order_billing_detail.order_id','=','order.id')
        ->where('order.shipment', '=', 'courier')
        ->whereIn('order.status',[2,6])
        ->select('order.*','customer.name as name','order_billing_detail.customer_name','order_billing_detail.customer_phone','order_billing_detail.customer_address','order_billing_detail.lat','order_billing_detail.long','order_billing_detail.customer_address2', 'order_billing_detail.notes as order_notes', 'order.shipment','order.invoice_no as invoice','agen.name as aname','order.total as total','order.created_at as date')
        ->get();

        foreach($orders as $order) {
       		$barangs[$order->id] = OrderDetail::join('product','product.id','=','order_detail.product_id')
       		->where('order_detail.order_id', $order->id)
       		->select('product.product_name as pname','order_detail.qty as qty')
       		->get();
        }

      $result = [];
      foreach ($orders as $order) {
        $items = OrderDetail::Join('product', 'product.id', '=', 'order_detail.product_id')
          ->where('order_id', '=', $order->id)
          ->select('product.id as product_id', 'product.sku', 'product.product_name', 'order_detail.qty','product.price_for_customer','product.price_for_agen','product.img_url')
          ->get();


        $result[] = [
          'order' => $order,
          'items' => $items,
          'created_at' => Carbon::parse($order->created_at)->format('d M Y H:i')
        ];
      }

      return view('shipment.shipment',compact('result','orders','barangs'))->withTitle('Shipment');
    }

    public function finalizeOrder(Request $request) {

      $validator = Validator::make($request->all(),[
        'order_id' => 'required|numeric|exists:order,id'
      ]);

      if ($validator->fails()) {
        return response()->json([
          'error' => $validator->errors()->all()
        ]);
      }

      DB::beginTransaction();
        try {
      $order = Order::whereId($request['order_id'])->first();
      $order->status = OrderStatus::COMPLETED;
      $order->save();
      $incentiveDetails = OrderDetail::join('product', 'product.id', '=', 'order_detail.product_id')
                    ->join('incentive_category', 'incentive_category.id', '=', 'product.incentive_id')
                    ->where('order_id', '=', $order->id)
                    ->select('order_detail.price_for_customer', 'incentive_category.rate', 'order_detail.qty', 'product.promo_price')
                    ->get();

      $incentive = 0;
      $margin = 0;
      $prices = 0;
      $marginRate = 0;
      $pph = 0.02;
      foreach ($incentiveDetails as $detail) {
        // if($detail->qty >= 3){
        //   $prices += ($detail->price_for_customer * $detail->qty) - 0.98;
        //   $margin += ($detail->price_for_customer * $detail->qty  - 0.98) * $this->marginRate;
        //   $incentive += ($detail->price_for_customer * $detail->qty  - 0.98) * $this->marginRate * $detail->rate / 100;
        // }
        // else{
          $prices += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty;
          $margin += 0;
          $incentive += (($detail->promo_price == 0) ? $detail->price_for_customer : $detail->promo_price) * $detail->qty * 0.95 * $detail->rate / 100;
        // }        
        
       }
      $commission_pph = ($incentive + $margin) * $this->pph;
      $commission_netto = $incentive - $commission_pph;
      
      $commission = new Commission;
      $commission->order_id = $order->id;
      $commission->agen_id = $order->agen_id;
      $commission->incentive = $incentive;
      $commission->commission_pph = $commission_pph;
      $commission->commission_netto = $commission_netto;
      $commission->margin_penjualan = $margin;
      $commission->save();

      $agen = Agen::where('agen.identifier', '=', $order->agen_id)
                    ->select('agen.wanee')
                    ->first();

      $history = new WaneeHistory;
      $history->user_id = $request->get('user')->id;
      $history->amount = $commission_netto;
      $history->saldo_akhir = $agen->wanee + $commission_netto;
      $history->reason = 'Komisi Agen';
      $history->save();

      $komisi = Agen::where('agen.identifier', '=', $order->agen_id)
                    ->update([
                'wanee' => $history->saldo_akhir
            ]);

      } catch(\Exception $e) {
          DB::rollback();
          throw $e;
      }
      DB::commit();

      $this->_sendPushNotification($order->user_id, "Order Status", "Terima kasih transaksi selesai tolong berikan rating.");

      return back();
      }
}
