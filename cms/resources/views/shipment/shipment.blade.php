@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Shipment Order</h2>
        <!-- H2 -->
        </div>

            <div class="row">
            <form class="form-inline" method="GET" action="{{url('/order')}}">                    
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
                                                <th>Nama Agen</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                    @if(count($orders) > 0)
                                        @foreach($orders as $order)
                                           
                                                <tr>
                                                  <td>{{$order->invoice}}</td>
                                                  <td>{{$order->name}}</td>
                                                  <td>{{$order->aname}}</td>
                                                  <td>{{$order->total}}</td>
                                                  <td></td> 
                                              
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


