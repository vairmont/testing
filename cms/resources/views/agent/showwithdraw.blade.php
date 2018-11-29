@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">

                <h2>ShowWithDraw</h2>


        <!-- H2 -->
        </div>

            <div class="row">

            <form class="form-inline" method="GET" action="{{url('/bywithdraw')}}">

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
            -->      
                    <button type="submit" name="is_export" value="1" class="btn btn-success">Export</button>
                    
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

                                                <th>Checker</th>
                                                <th>ID</th>
                                                <th>Nama</th>
                                                <th>Amount</th>
                                                <th>Wanee Agen</th>
                                                <th>Plafon Kredit</th>
                                                <th>No Rekening</th>
                                                <th>Bank</th>
                                                <th>Source</th>
                                                <th>Status</th>
                                                <th>Tanggal</th>
                                            </tr>
                                        </thead>
                                        <form class="form-inline" method="POST" action="{{  route('check3')}}">
                                                {{ csrf_field() }}
                                   
                                               <button class=" btn btn-primary"type="submit" name="check3">Verifikasi</button> 
                                        <tbody>
                                         @if(count($withdraw) > 0)
                                            @foreach($withdraw->all() as $draw)
                                           
                                                <tr>
                                                <td>
                                                <input type="checkbox" name="checkbox[]" value="{{ $draw->id }}">
                                                </td>
                                                <td>{{$draw->id}}</td>
                                                <td>{{$draw->name}}</td>
                                                <td>Rp.{{number_format($draw->amount)}}</td>
                                                <td>Rp.{{number_format($draw->wanee)}}</td>
                                                <td>Rp. {{ number_format($draw->plafon) }}</td>
                                                <td>{{$draw->nokredit}}</td>
                                                <td>{{ $draw->bank }}</td>
                                                <td>{{$draw->source}}</td>
                                                <td>{{$draw->status}}</td>
                                                <td>{{$draw->date}}</td>
                                               
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


