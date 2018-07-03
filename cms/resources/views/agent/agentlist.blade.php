@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Agen</h2>
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
                                                <th>Nama</th>
                                                <th>Alamat</th>
                                                <th>Parent</th>
                                                <th>Nomor telpon</th>
                                                <th>KK</th>
                                                <th>NIK</th>
                                                <th>Business Name</th>
                                            
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            @if(count($agen) > 0)
                                                @foreach($agen as $agent)
                                                <tr>
                                                <td>{{$agent->name}}</td>
                                                <td>{{$agent->address}}</td>
                                                <td>{{$agent->parent}}</td>
                                                <td>{{$agent->phone}}</td>
                                                <td>{{$agent->KK}}</td>
                                                <td>{{$agent->NIK}}</td>
                                                <td>{{$agent->busname}}</td>
                                                
                                                <td>
                                                    {{$agent->status}}
                                                </td>

                                                <td>
                                                    <a class="btn btn-primary" data-toggle="modal" data-target="#assignStore-{{$agent->id}}">Verify</a>
                                                    <!-- Modal -->
                                                 
                                                    <div class="modal fade" id="assignStore-{{$agent->id}}" tabindex="-1" role="dialog" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                        <form  action="{{route('verify', $agent->id)}}" method="POST" >
                                                        {{csrf_field()}}
                                                            
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Input Store ID</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label>Masukan ID Toko</label>
                                                                    <select name="store_id" class="form-control">
                                                                        <option>Pilih Toko</option>
                                                                        @foreach($stores as $store)
                                                                            <option value="{{$store->id}}">{{$store->store_name}}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                                            </div>
                                                        </form>

                                                        </div>
                                                    </div>
                                                    </div>
                                                     
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


