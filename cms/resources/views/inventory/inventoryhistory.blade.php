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
            {{ Form::open(['url' => url('byinventoryhistory'), 'method' => 'get']) }}
                <div class="form-group col-md-3">
                    <select id="store_id" class="form-control" name="store_id">
                        <option selected>Semua Toko</option>
                          @foreach ($stores as $store)
                            <option value="{{ $store->id }}" @if(isset($args)&&$args['store_id']==$store->id) echo "selected"; @endif>{{ $store->store_name }}</option>
                          @endforeach
                    </select>
                </div>
                <div class="form-group col-md-3">
                    <button type="submit" class="btn btn-default">Search</button>
                </div>
            {{ Form::close() }}
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
                                            <td>{{ $history->created_at }}</td>
                                            <td>{{ $history->product->product_name }}</td>
                                            <td>{{ $history->store->store_name }}</td>
                                            <td>{{ $history->created_by }}</td>
                                            <td>{{ $history->reason }}</td>
                                            <td>{{ $history->quantity }}</td>
                                            <td>{{ $history->total_stock }}</td>
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
