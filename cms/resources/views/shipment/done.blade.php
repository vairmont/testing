@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Finished Order</h2>
        <!-- H2 -->
        </div>

            <div class="row">
            <form class="form-inline" method="GET" action="{{url('/done')}}">                    
                    <!-- row -->
                    </form>
                </div>

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Invoice No.</th>
                                                <th>Nama Pembeli</th>
                                                <th>Nama Toko</th>
                                                <th>Barang</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                    @if(count($orders) > 0)
                                        @foreach($orders as $order)
                                           
                                                <tr>
                                                  <td>{{$order->invoice}}</td>
                                                  <td>{{$order->name}}</td>
                                                  <td>{{$order->sname}}</td>
                                                  <td>
                                                  @foreach($barangs[$order->id] as $barang)
                                                  {{$barang->pname}} x {{ $barang->qty }} </br> 
                                                  @endforeach  
                                                  </td>
                                                  <td>Rp.{{number_format($order->total)}}</td>
                                              
                                                </tr>
                                        @endforeach
                                    @endif
                                </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>  
    <!-- container -->
    </div>
@endsection


