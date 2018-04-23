@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Penjualan Per Barang</h2>
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
                                        <th>Nama barang</th>
                                        <th>Kategori</th>
                                        <th>Barang yang terjual	</th>
                                        <th>Pendapatan bersih</th>
                                        <th>Harga pokok</th>
                                        <th>Laba kotor</th>
                                        <th>  
                                                    
                                            <div class="button-group">
                                                <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> <span class="caret"></span></button>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#" class="small" data-value="option1" tabIndex="-1"><input type="checkbox"/>&nbsp;Nama Barang</a></li>
                                                    <li><a href="#" class="small" data-value="option2" tabIndex="-1"><input type="checkbox"/>&nbsp;SKU</a></li>
                                                    <li><a href="#" class="small" data-value="option3" tabIndex="-1"><input type="checkbox"/>&nbsp;Kategory</a></li>
                                                    <li><a href="#" class="small" data-value="option4" tabIndex="-1"><input type="checkbox"/>&nbsp;Barang yang terjual</a></li>
                                                    <li><a href="#" class="small" data-value="option5" tabIndex="-1"><input type="checkbox"/>&nbsp;Pendapatan Kotor</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Item yang di kembalikan</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Pengembalian</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Diskon</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Pendapatan bersih</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Harga Pokok</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Laba Kotor</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Margin</a></li>
                                                    <li><a href="#" class="small" data-value="option6" tabIndex="-1"><input type="checkbox"/>&nbsp;Jumlah Pajak</a></li>
                                                </ul>
                                            </div>
                                                            
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                
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
