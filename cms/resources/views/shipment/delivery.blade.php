@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Delivery Order</h2>
        <!-- H2 -->
        </div>

            <div class="row">
            <form class="form-inline" method="GET" action="{{url('/deliver')}}">                    
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
                                                @if(Auth::User()->role_id == '3' || Auth::User()->role_id == '1')
                                                <th>Action</th>
                                                @else
                                                @endif
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
                                                  @if(Auth::User()->role_id == '3' || Auth::User()->role_id == '1')
                                                  <td><a href="{{ route('finalize', ['id' => $order->id]) }}"><button type="submit" class="btn btn-primary">Complete</button></a></td> 
                                                  @else
                                                  @endif
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


