@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

     <div class="container-fluid">
            <div>
                <h2>History Plafon Kredit</h2>
            </div>
                <div class="col-lg-12">
                    <p> </p>
                </div>
                    <div class="row">
                        <a href="{{ url('/bywaneehistory') }}?date=1" class="btn btn-primary">Hari ini</a>
                        <a href="{{ url('/bywaneehistory') }}?date=2" class="btn btn-primary">Bulan ini</a>
                    </div>
                    
                    <div class="row">
                    <p> </p>
                    </div>
                <form class="form-inline" method="GET" action="{{url('/bywaneehistory')}}">
                        <div class="form-group">
                            <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Agen" aria-label="Search" @if(isset($request->keyword)) value="{{$request->keyword}}" @endif>
                        </div>
                        <div class="form-group">
                            <input type="date" class="form-control mr-sm-2" name="dayword1" @if(isset($request->dayword1)) value="{{$request->dayword1}}" @endif>
                            <p class="glyphicon glyphicon-minus"></p>
                            <input type="date" class="form-control mr-sm-2" name="dayword2" @if(isset($request->dayword2)) value="{{$request->dayword2}}" @endif>
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                        <button type="reset" class="btn btn-danger">Clear</button>
                        
                   
                </form>
                @if(session()->has('message'))
                <div class="alert alert-success">
                    {{ session()->get('message') }}
                </div>
                @endif
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Checker</th> 
                                                <th>Nama Agen</th>
                                                <th>Tanggal</th>
                                                <th>Nomor telpon</th>
                                                <th>Saldo Awal</th>
                                                <th>Amount</th>
                                                <th>Saldo Akhir</th>
                                                
                                            </tr>
                                        </thead>
                                    <form class="form-inline" method="POST" action="{{  route('check1')}}">
                                         {{ csrf_field() }}
                            
                                        <button class=" btn btn-primary"type="submit" name="check1">Verifikasi</button> 
                                        <tbody>
                                        @if(count($history) > 0)
                                            @foreach($history->all() as $his)
                                            <tr>
                                                <td>
                                                <input type="checkbox" name="checkbox[]" value="{{ $his->id }}">
                                                </td>
                                                <td>{{$his->name}}</td>
                                                <td>{{$his->date}}</td>
                                                <td>{{$his->phone}}</td>
                                                <td>Rp.{{number_format($his->saldoakhir - $his->amount)}}</td>
                                                <td>Rp.{{number_format($his->amount)}}</td>
                                                <td>Rp.{{number_format($his->saldoakhir)}}</td>                                       
                                                
                                            </tr>
                                            @endforeach
                                        @endif       
                                        </tbody>

                                    </form>
                                        <tfoot>
                                    
                                        </tfoot>
                                    </table>
                                </div>
                        </div>
                    </div>  
    <!-- container -->
    </div>

@endsection


