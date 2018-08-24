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

                <form class="form-inline"> 
                            <p>
                                    <button type="button" class="btn btn-primary">Hari ini</button>
                                    <button type="button" class="btn btn-primary">Kemarin</button>
                                    <button type="button" class="btn btn-primary">Minggu ini</button>
                                    <button type="button" class="btn btn-primary">Bulan ini</button>
                            </p>
                    <!-- form group -->
                    <div class="form group">
                                <p>Purchase order date:</p>
                                <input type="date" name="">
                     
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
                                        <th>ID</th>
                                        <th>SKU</th>
                                        <th>Nama Barang</th>
                                        <th>Quantity</th>
                                        <th>Nominal</th>
                                        <th>Cost</th>
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
                                                  <td>{{$total->nominal}}</td>
                                                  <td>{{$total->cost}}</td> 
                                               
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
