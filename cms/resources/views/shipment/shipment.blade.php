@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>New Order</h2>
        <!-- H2 -->
        </div>

            <div class="row">
            <form class="form-inline" method="GET" action="{{url('/order/{id}')}}">                    
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
                                                <th>Alamat</th>
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
                                                  <td>{{$order->address}}</td>
                                                  <td>
                                                  @foreach($barangs[$order->id] as $barang)
                                                  {{$barang->pname}} x {{ $barang->qty }} </br> 
                                                  @endforeach  
                                                  </td>
                                                  <td>Rp.{{number_format($order->total)}}</td>
                                                  @if(Auth::User()->role_id == '3' || Auth::User()->role_id == '1')
                                                  <td><a href="{{ route('invoice', ['id' => $order->id]) }}"><button type="submit" class="btn btn-primary">Invoice</button></a>

                                                  <a href="{{ route('delivery', ['id' => $order->id]) }}"><button type="submit" class="btn btn-primary">Deliver</button></a>

                                                  <button type="button" class="btn btn-danger btn-sm"  data-toggle="modal" data-target="#edit-{{$order->id}}">Delete</button></td> 

                                                  <!-- modal -->
                                                <div class="modal fade" id="edit-{{$order->id}}" tabindex="-1" role="dialog" aria-labelledby="editmodal" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                      <div class="modal-content">
                                                        <div class="modal-header">
                                                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                          <h4 class="modal-title" id="editmodal">Confirmation</h4>
                                                        </div>
                                                        <div class="modal-body">Apakah anda yakin seyakin-yakinnya?</div>
                                                        <div class="modal-footer">
                                                          <a href="{{ route('delete', ['id' => $order->id]) }}"><button type="submit" class="btn btn-primary">Save</button></a>
                                                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                      </div><!-- /.modal-content -->
                                                    </div><!-- /.modal-dialog -->
                                                  </div><!-- /.modal -->
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


