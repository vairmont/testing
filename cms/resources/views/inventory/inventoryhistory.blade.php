@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
        <div class="container-fluid">
        
            <div>
                <h2>Riwayat persediaan</h2>
            </div>
            <form class="form-inline">
                    <div class="form-group col-3 ">
                        <label for="inputState">Semua Toko</label>
                        <select id="inputState" class="form-control">
                            <option selected>Semua Toko</option>
                            <option>Mobile MiniGrosir</option>
                            <option>Toko MiniGrosir</option>
                          </select>
                      </div>
                    <div class="form-group col-3 ">
                            <label for="inputState">All Category</label>
                            <select id="inputState" class="form-control">
                              <option selected>All Category</option>
                              @foreach ($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                              @endforeach
                            </select>
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
                                        <th>Tanggal</th>
                                        <th>Barang</th>
                                        <th>Toko</th>
                                        <th>Karyawan</th>
                                        <th>Alasan</th>
                                        <th>Penyesuaian</th>
                                        <th>Stock Akhir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if (isset($histories))
                                    @foreach ($histories as $history)
                                        <tr>
                                            <td>{{ $category->created_at }}</td>
                                            <td>{{ $category->product->product_name }}</td>
                                            <td>{{ $category->store->store_name }}</td>
                                            <td>{{ $category->created_by }}</td>
                                            <td>{{ $category->reason }}</td>
                                            <td>{{ $category->quantity }}</td>
                                            <td>{{ $category->total_stock }}</td>
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
