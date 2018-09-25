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

                    <div class="col-lg-4">
                        <a href="{{ url('/bystore') }}?date=1" class="btn btn-primary">Hari ini</a>
                        <a href="{{ url('/bystore') }}?date=2" class="btn btn-primary">Bulan ini</a>
                    </div>

                <form class="form-inline" method="GET" action="{{url('/bystore')}}"> 
                    <!-- form group -->
                    <div class="col-lg-4 form group">                                      
                        <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Agen" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </form>
                <form class="form-inline" method="GET" action="{{url('/bystore')}}"> 
                    <!-- form group -->
                    <div class="col-lg-4 form group">                                 
                        <input name="key" class="form-control mr-sm-2" type="text" placeholder="Nama Toko" aria-label="Search">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>

                    <div class=col-lg-12>
                        <p> </p>
                    </div>
                    
                    <div class="col-lg-12">
                        <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                    </div>
                </form>
            <!-- /.row -->
            <div class="row">
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                        <table width="100%"class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Agen</th>
                                    <th>Order</th>
                                    <th>ProductName</th>
                                    <th>Quantity</th>
                                    <th>Margin</th>                                
                                    <th>Insentif</th>
                                    <th>Paid by Agen</th>
                                    <th>Paid by Customer</th>
                                    <th>Store</th>
                                    <th>Tanggal</th>
                                </tr>
                            </thead>

                            <tbody>
                            @if(count($flowreport) > 0)
                                @foreach($flowreport as $flow)                                          
                                    <tr>
                                        <td>{{$flow->id}}</td>
                                        <td>
                                            @if($flow->name == NULL)
                                            Chasier
                                            @else
                                            {{$flow->name}}
                                            @endif
                                        </td>
                                        <td>{{$flow->invoice}}</td>
                                        <td>{{$flow->proname}}</td>
                                        <td>{{$flow->qty}}</td>
                                        <td>
                                            @if($flow->promo_price == 0)
                                            Rp.{{number_format($flow->customer_price * $flow->qty * 0.05)}},-
                                            @else
                                            <label style="color:red;">Rp.{{number_format($flow->promo_price * $flow->qty * 0.05)}},-</label>
                                            @endif
                                        </td>
                                        <td>
                                            @if($flow->promo_price == 0)
                                            Rp.{{ number_format($flow->customer_price * $flow->qty * 0.95 * $flow->rate / 100)}},-
                                            @else
                                            <label style="color:red;">Rp.{{ number_format($flow->promo_price * $flow->qty * 0.95 * $flow->rate / 100)}},-</label>
                                            @endif      
                                        </td>
                                        <td>
                                            @if($flow->promo_price == 0)
                                            Rp.{{ number_format($flow->customer_price * $flow->qty * 0.95)}},-
                                            @else
                                            <label style="color:red;">Rp.{{ number_format($flow->promo_price * $flow->qty * 0.95)}},-</label>
                                            @endif  
                                        </td>
                                        <td>
                                            @if($flow->promo_price == 0)
                                            Rp.{{ number_format($flow->customer_price * $flow->qty)}},-
                                            @else
                                            <label style="color:red;">Rp.{{ number_format($flow->promo_price * $flow->qty)}},-</label>
                                            @endif  
                                         </td>
                                         <td>
                                            @if($flow->stoname == NULL)
                                            Serang
                                            @else
                                            {{$flow->stoname}}
                                            @endif
                                        </td>
                                        <td>{{$flow->create}}</td>
                                                  
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
