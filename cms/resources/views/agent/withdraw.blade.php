@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>WithDraw</h2>
        <!-- H2 -->
        </div>

            <div class="row">
                <div class="form-group col-md-3">         
                    <select id="inputState" class="form-control" name="stock">
                    <option value="all" selected>Semua</option>
                    <option value="low">Verify</option>
                    <option value="sold">Reject</option>
                    </select>
                    <input class="form-control mr-sm-2" type="text" name="" placeholder="Search" aria-label="Search">
                </div>
                    <div class="form-group col-md-3">
                        <button type="submit" name="is_export" value="1" class="btn btn-default">Export</button>
                        <button type="submit" class="btn btn-default">Search</button>
                    </div>
                    <!-- row -->
                </div>
              

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>ID_agen</th>
                                                <th>Amount</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                         @if(count($withdraw) > 0)
                                            @foreach($withdraw->all() as $withdraw)
                                           
                                                <tr>
                                                <td>{{$withdraw->id}}</td>
                                                <td>{{$withdraw->agenid}}</td>
                                                <td>{{$withdraw->amount}}</td>
                                                <td>{{$withdraw->status}}</td>
                                                <td>
                                                    <a href="{{ route('status', ['id' => $withdraw->id]) }}" class="btn btn-primary">here</a>                                                 
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


