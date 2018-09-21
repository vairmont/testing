@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Wanee History</h2>
        <!-- H2 -->
        </div>
        <div class="col-lg-4">
            <a href="{{ url('/bywaneehistory') }}?date=1" class="btn btn-primary">Hari ini</a>
            <a href="{{ url('/bywaneehistory') }}?date=2" class="btn btn-primary">Bulan ini</a>
            </div>

            <div class="row">
            <form class="form-inline" method="GET" action="">
                <div class="form-group col-lg-6">
                    <input class="form-control mr-sm-2" type="text" name="keyword" placeholder="Nama Agen" aria-label="Search">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <button type="reset" class="btn btn-danger">Clear</button>
                </div>
              
            
            <!--
                <div class="form-group col-md-3">         
                    <select id="inputState" class="form-control" name="stock">
                    <option value="all" selected>Semua</option>
                    <option value="low">Verify</option>
                    <option value="sold">Reject</option>
                    </select>
                </div>
            -->      <div class="col-lg-1">
                    <button type="submit" name="is_export" value="1" class="btn btn-success">Export</button>
                    </div>
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
                                                <th>Nama Agen</th>
                                                <th>Amount</th>
                                                <th>Tanggal</th>
                                                <th>Nomor telpon</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        @if(count($history) > 0)
                                            @foreach($history->all() as $his)
                                            <tr>
                                                <td>{{$his->name}}</td>
                                                <td>Rp.{{number_format($his->amount)}}</td>
                                                <td>{{$his->date}}</td>
                                                <td>{{$his->phone}}</td>
                                                <td>
                                                <a href="{{ route('status1', ['id' => $his->id]) }}" class="btn btn-primary">Verifikasi</a>
                                                
                                                </td>
                                            </tr>
                                            @endforeach
                                        @endif       
                                        </tbody>
                                        <tfoot>
                                    
                                        </tfoot>
                                    </table>
                                </div>
                        </div>
                    </div>  
    <!-- container -->
    </div>
@endsection


