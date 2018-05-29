@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Pesanan Pembelian</h2>
            </div>

            <a href="addpurchaseorder" class="btn btn-primary">+ADD PURCHASE ORDER</a>
            <form class="form-inline"> 

                <!-- form group -->
                <div class="form group">
                    <input type="date" name="">
                    <select id="inputState" class="form-control">
                        <option selected>All Item</option>
                        <option>Draft</option>
                        <option>Pending</option>
                        <option>Close</option>
                    </select>
                    <select id="inputState" class="form-control">
                        <option selected>All Supllier</option>
                        <option>No category</option>  
                    </select>
                    <select id="inputState" class="form-control">
                        <option selected>Semua Toko</option>
                        <option>Mobile MiniGrosir</option>
                        <option>Toko MiniGrosir</option>
                    </select>
                   <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                </div>
              </form>
                  
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
                                            <td>{{ $po->id }}</td>
                                            <td>{{ $po->po_date }}</td>
                                            <td>{{ $po->supplier->name }}</td>
                                            <td>{{ $po->store->store_name }}</td>
                                            <td>{{ $po->status }}</td>
                                            <td>{{ $po->status == 'received' ? 'Received' : 'Not Received'}}</td>
                                            <td>{{ $po->po_estimate_date }}</td>
                                            <td>{{ $po->purchaseOrderDetails->sum('price') }}</td>
                                        @endforeach
                                    @endif
                                </tbody>
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
