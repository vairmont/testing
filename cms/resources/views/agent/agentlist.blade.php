@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

    <div class="container-fluid">

        <div class="">
                <h2>Agen</h2>
        </div>

            <div class="row">
        
                        <div class="form-group col-md-3">
                                <label for="inputState">Stock Alert</label>
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
                        <button type="reset" class="btn btn-default">Clear</button>
                        </div>
                </div>
              

                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>Nama</th>
                                                <th>NIK</th>
                                                <th>Nomor telpon</th>
                                                <th>No KK</th>
                                                <th>Alamat</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            @if(count($agen) > 0)
                                                @foreach($agen as $agent)
                                                <tr>
                                                <td>{{$agent->name}}</td>
                                                <td>{{$agent->NIK}}</td>
                                                <td>{{$agent->phone}}</td>
                                                <td>{{$agent->KK}}</td>
                                                <td>{{$agent->address}}</td>
                                                <td>
                                                @if($agent->status == 0)
                                                Rejected
                                                @elseif($agent->status == 1)
                                                Pending
                                                @else
                                                Verified
                                                @endif
                                                </td>
                                                @if($agent->status == 1)
                                                <td>
                                                    <a class="btn btn-primary" href="{{route('verify',$agent->id)}}">Verify</a>
                                                    <a class="btn btn-danger" href="{{url('/rejectagent')}}">Reject</a>
                                                </td>
                                                @else
                                                <td>
                                                    <button input="button" class="btn btn-primary" disabled>Verify</button>
                                                    <button input="button" class="btn btn-danger" disabled>Reject</button>
                                                </td>
                                                @endif
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

            
        

    </div>
                          


@endsection