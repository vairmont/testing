@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2 >Flow Sales</h2>
            </div>  

                           <!-- <p>
                                    <button type="button" class="btn btn-primary" >Agen</button>
                                    <button type="button" class="btn btn-primary">Kemarin</button>
                                    <button type="button" class="btn btn-primary">Minggu ini</button>
                                    <button type="button" class="btn btn-primary">Bulan ini</button>
                            </p>-->
                <form class="form-inline" method="GET" action="{{url('/bystore')}}"> 
                    <!-- form group -->
                    <div class="form group">
                    <!--<select id="inputState" class="form-control" name="key">
                                <option selected>GrosirOne</option>
                                <option>GrosirOne Serang</option>
                                <option>GrosirOne Cikupamas</option>
                        </select>  -->       
                     
                                               
                            <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Agen" aria-label="Search">
                            <button type="submit" class="btn btn-default">Search</button>
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
                                        <th>Order</th>
                                        <th>Agen</th>
                                        <th>Order</th>
                                        <th>ProductName</th>
                                        <th>Quantity</th>
                                        <th>Insentif</th>
                                        <th>Paid by Agen</th>
                                        <th>Paid by Customer</th>
                                        <th>Store</th>
                                    </tr>
                                </thead>

                                <tbody>
                                @if(count($flowreport) > 0)
                                        @foreach($flowreport as $flow)
                                           
                                                <tr>
                                                  <td>{{$flow->id}}</td>
                                                  <td>{{$flow->name}}</td>
                                                  <td>{{$flow->invoice}}</td>
                                                  <td>{{$flow->proname}}</td>
                                                  <td>{{$flow->qty}}</td>
                                                  <td>{{$flow->rate}}% (Rp {{ number_format($flow->agen_price * $flow->rate / 100) }})</td>
                                                  <td>{{number_format($flow->agen_price * $flow->qty)}}</td>
                                                  <td>{{number_format($flow->customer_price * $flow->qty)}}</td>
                                                  <td>{{$flow->stoname}}</td>
                                                </tr>
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
