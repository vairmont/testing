@extends('master')

@section('title')
    {{$title}}
@endsection

@section('content')

<div>
                <h2>Diskon</h2>
        </div>
  <div class="col-md-12">
    <a href="adddiskon" class="btn btn-primary">+ADD Discount</a>
  </div>              
  <div>
    <div class="panel-body">
        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
          <thead>
            <tr>
              <th>Diskon</th>
              <th>Rate</th>
              <th>Akses dilarang</th>
              <th>Action</th>
            </tr>
          </thead>
          
          <tbody>
              @if ($discounts)
                @foreach ($discounts as $discount)
                  <tr>
                    <th>{{ $discount->name }}</th>
                    <th>
                      @if ($discount->type=="percent") {{ $discount->rate }} %
                      @else Rp. {{ $discount->rate }},-
                      @endif
                    </th>
                    <th>{{ $discount->restriction==1 ? "Yes" : "No" }}</th>
                    <th>
                      <a href="editdiskon/{{ $discount->id }}">Edit</a>
                      <a href="deletediskon/{{ $discount->id }}">Delete</a>
                    </th>
                  </tr>
                @endforeach
              @endif
          </tbody>
        </table>
      </div>
  </div>
</div>
  
@endsection