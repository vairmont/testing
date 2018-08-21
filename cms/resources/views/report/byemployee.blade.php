@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Penjualan Oleh Karyawan</h2>
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
                                        <th>Nama</th>
                                        <th>Penjualan</th>
                                        <th>Pendapatan bersih</th>
                                        <th>Jumlah Penjualan</th>
                                        <th>Pendaftaran langganan</th>
                                    </tr>
                                </thead>

                                <tbody>
                                 @foreach ($byagen as $ba)
                                 <tr>
                                        <td>{{$ba->name}}</td>
                                        <td>{{$ba->total_sales}}</td>
                                        <td>{{$coms[$ba->agen_id]}}</td>
                                        <td>{{$ba->total_order}}</td>
                                        <td>{{$temp[$ba->agen_id]}}</td>
                                    </tr>
                                 @endforeach
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
