@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
            <div>
                <h2>Supplier Sales</h2>
            </div>

            <div class="row">
                <a href="{{ url('/bysupply') }}?date=1" class="btn btn-primary">Hari ini</a>
                <a href="{{ url('/bysupply') }}?date=2" class="btn btn-primary">Bulan ini</a>
            </div>
            <div class="row">
            <p> </p>
            </div>
            <div class="row">
                <form class="form-inline" method="GET" action="{{url('/bysupply')}}">
        
                    <div class="form-group">
                        <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Product" aria-label="Search" @if(isset($request->keyword)) value="{{$request->keyword}}" @endif>
                    </div>
                    <div class="form-group">
                        <input name="key" class="form-control mr-sm-2" type="text" placeholder="Nama Toko" aria-label="Search"@if(isset($request->key)) value="{{$request->key}}" @endif>
                    </div>
                  
                    <div class="form-group">
                        <input type="date" class="form-control mr-sm-2" name="dayword1" @if(isset($request->dayword1)) value="{{$request->dayword1}}" @endif>
                        <p class="glyphicon glyphicon-minus"></p>
                        <input type="date" class="form-control mr-sm-2" name="dayword2" @if(isset($request->dayword2)) value="{{$request->dayword2}}" @endif>
                    </div>

                    <button type="submit" class="btn btn-primary">Filter</button>
                    <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                </form>
            </div>

            <div class="row">
                <h3>Total Modal :Rp.{{ number_format($total1)}}</h3>       
            </div>
            <!-- /.row -->
            <div class="row">
            <!-- div col -->
                <div class="col-lg-12">
                    <!-- /.div 2 -->
                    <div class="table-responsive">
                        <table class="sortable table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>SKU</th>
                                    <th>Supplier</th>
                                    <th>Nama Barang</th>
                                    <th>Quantity</th>
                                    <th>Modal</th>
                                    
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
                                    <td>{{ $total->supplier }}</td>
                                    <td>{{$total->name}}</td>
                                    <td>{{$total->qty}}</td>
                                    <td>Rp.{{number_format($total->cost)}}</td> 
                                    
                                    <td>{{$total->sname}}</td>
                                    <td>{{$total->create}}</td>
                                </tr>
                                @endforeach
                              @endif
                            </tbody>
                            <tfoot>
                                    {{ $totalsales->appends($_GET)->links() }}
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
