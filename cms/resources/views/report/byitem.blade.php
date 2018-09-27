@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Total Sales</h2>
            </div>
            <!-- <form class=" form-inline" method="GET" action="{{url('/byitem')}}">   
                <button name="today" type="submit" class="btn btn-primary" >Hari ini</button>
            </form> -->
            <div class="col-lg-4">
            <a href="{{ url('/byitem') }}?date=1" class="btn btn-primary">Hari ini</a>
            <a href="{{ url('/byitem') }}?date=2" class="btn btn-primary">Bulan ini</a>
            </div>                      <!--
                       <button type="button" class="btn btn-primary">Kemarin</button>
                        <button type="button" class="btn btn-primary">Minggu ini</button>
                        <button type="button" class="btn btn-primary">Bulan ini</button>-->

            <form class=" form-inline" method="GET" action="{{url('/byitem')}}"> 
                <div class="col-lg-4 form group">
                    <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Product" aria-label="Search">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </form>
            
            <form class="form-inline" method="GET" action="{{url('/byitem')}}"> 
                <div class="col-lg-4 form group">
                    <input name="key" class="form-control mr-sm-2" type="text" placeholder="Nama Toko" aria-label="Search">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
                <div class="col-lg-12">
                <p> </p>
                </div>
                <div class="col-lg-12">
                <button type="submit" name="is_export" value="1" class="btn btn-success">Export</button>
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
                                        <th>ID</th>
                                        <th>SKU</th>
                                        <th>Nama Barang</th>
                                        <th>Quantity</th>
                                        <th>Cost</th>
                                        <th>Nominal</th>
                                        <th>Store</th>
                                        <th>Tanggal</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    @if(count($totalsales) > 0)
                                        @foreach($totalsales as $total)
                                           
                                                <tr>
                                                  <td>{{$total->id}}</td>
                                                  <td>{{$total->sku}}</td>
                                                  <td>{{$total->name}}</td>
                                                  <td>{{$total->qty}}</td>
                                                  <td>Rp.{{number_format($total->cost)}}</td> 
                                                  <td>Rp.{{number_format($total->cost * $total->qty)}}</td>
                                                  <td>{{$total->sname}}</td>
                                                  <td>{{$total->create}}</td>
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
