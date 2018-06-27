@extends('master')

@section('title')
    {{$title}}
@endsection

@section('js')
    <script type="text/javascript">
        $(".clickable-row").click(function() {
            window.location = $(this).data("href");
        });
    </script>
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Pesanan Pembelian</h2>
            </div>

            <a href="addpurchaseorder" class="btn btn-primary">+ADD PURCHASE ORDER</a>
           
            {{ Form::open(['url' => url('bypurchaseorder'), 'method' => 'get']) }}
                <!-- form group -->
                <div class="form-group col-md-3">
                    <select id="status" class="form-control">
                        <option value="" selected>All Status</option>
                        <option value="Pending">Pending</option>
                        <option value="Close">Close</option>
                        <option value="Cancel">Cancel</option>
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <select id="supplier" class="form-control">
                        <option value="" selected>All Supllier</option>
                        @foreach ($suppliers as $supplier)
                            <option value="{{ $supplier->id }}">{{ $supplier->name }}</option>  
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <select id="store" class="form-control">
                        <option value="" selected>All Stores</option>
                        @foreach ($stores as $store)
                            <option value="{{ $store->id }}">{{ $store->store_name }}</option>  
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <button type="submit" class="btn btn-default">Search</button>
                </div>
            {{ Form::close() }}
                  
            <!-- /.row -->
            <div class="row">
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Purchase Order#</th>
                                        <th>Tanggal</th>
                                        <th>Pemasok</th>
                                        <th>Toko</th>
                                        <th>Status</th>
                                        <th>Received</th>
                                        <th>Expeted on</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    @if (isset($purchaseOrders))
                                        @foreach ($purchaseOrders as $po)
                                        <?php 
                                            $href = URL::to('editpurchaseorder/'.$po->id); 
                                            $total = 0;
                                            foreach ($po->purchaseOrderDetails as $detail) {
                                                $total += $detail->price * $detail->quantity;
                                            }
                                        ?>
                                        <tr class='clickable-row' data-href='{{ $href }}' style="cursor: pointer;">
                                            <td>{{ $po->id }}</td>
                                            <td>{{ $po->po_date }}</td>
                                            <td>{{ $po->supplier->name }}</td>
                                            <td>{{ $po->store->store_name }}</td>
                                            <td>{{ $po->status }}</td>
                                            <td>{{ $po->status == 'Close' ? 'Received' : 'Not Received'}}</td>
                                            <td>{{ $po->po_estimate_date }}</td>
                                            <td>Rp {{ number_format($total , 2) }}</td>
                                        </tr>
                                        @endforeach
                                    @endif
                                </tbody>
                                <tfoot>
                                  {{ $purchaseOrders->links() }}
                                </tfoot>
                            </table>
                        <!-- /div 2 -->
                    </div>
                    <!-- /div col -->
                </div>
                <!-- /div row -->
            </div>
         <!-- /div container -->
        </div>    
    
    
    <!-- /#wrapper -->

 @endsection
