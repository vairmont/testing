@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>JNE</h2>
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
                                
                                                <th>Invoice.No</th>
                                                <th>Nama Pembeli</th>
                                                <th>Alamat</th>
                                                <th>Barang</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th>Approver</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                         @if(count($jne) > 0)
                                            @foreach($jne->all() as $jn)
                                           
                                                <tr>
                                                
                                                <td>{{$jn->invoice}}</td>
                                                <td>{{$jn->name}}</td>
                                                <td>{{ $jn->address}}</td>
                                                <td>{{ $jn->proname}}</td>
                                                <td>{{ $jn->qty }}</td>
                                                <td>Rp.{{ number_format($jn->total)}}</td>
                                                <td>
                                                    <a href="{{ route('statusjne', ['id' => $jn->invoice]) }}" class="btn btn-primary">Print</a>                                                 
                                                </td>
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


