@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

     <div class="container-fluid">
            <div>
                <h2>Wanee History</h2>
            </div>

           
                <div class="col-lg-12">
                    <p> </p>
                </div>
                <!--
                <div class="col-lg-12">
                    <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                </div>
            -->
            <form class=" form-inline" method="GET" action="{{url('/bywaneehistory')}}">
            <div class="form-group">
                <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Agen" aria-label="Search" @if(isset($request->keyword)) value="{{$request->keyword}}" @endif>
            </div>
            <button type="submit" class="btn btn-primary">Search</button>
            <button type="reset" class="btn btn-danger">Clear</button>
            </form>
           
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Nama Agen</th>
                                                <th>Saldo Awal</th>
                                                <th>Amount</th>
                                                <th>Saldo Akhir</th>
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
                                                <td>Rp.{{number_format($his->saldoakhir - $his->amount)}}</td>
                                                <td>Rp.{{number_format($his->amount)}}</td>
                                                <td>Rp.{{number_format($his->saldoakhir)}}</td>
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


