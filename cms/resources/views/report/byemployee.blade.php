@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<!-- div container -->
<div class="container-fluid">
            <div>
                <h2>Penjualan oleh agen</h2>
            </div>

            <form class=" form-inline" method="GET" action="{{url('/byemployee')}}"> 
                <div class="col-lg-4 form group">
                    <input name="keyword" class="form-control mr-sm-2" type="text" placeholder="Nama Agen" aria-label="Search" @if(isset($request->keyword)) value="{{$request->keyword}}" @endif>
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </form>
        

                <div class="col-lg-12">
                    <p> </p>
                </div>
                
                <!--<div class="col-lg-12">
                    <button type="submit" name="is_export" value="1" class="btn btn-primary">Export</button>
                </div>
                -->
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
                                        <td>{{number_format($ba->total_sales)}}</td>
                                        <td>{{number_format($coms[$ba->agen_id])}}</td>
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
