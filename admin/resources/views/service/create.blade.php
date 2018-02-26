@extends('master-layout')

@section('title')
	{{ $title }}
@endsection

@section('content')

@include('error.template')
	<div class="pt-3">
		<div class="col-2">
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newModal">Add New</button>
		</div> 

		<div class="col-md-6 pt-3">
			<form method="GET" action="{{ url('/service-location') }}" enctype="multipart/form-data">
			<div class="input-group">
					<input type="text" name="keyword" class="form-control" placeholder="Search for Company Name..." @if(isset($request->keyword) && !empty($request->keyword)) value="{{$request->keyword}}" @endif>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="submit">search</button>
					</span>
			</div>
			</form>
		</div>
	</div>
	<main class="container-fluid pt-3">
		<h6><strong style="color: red">OSR:</strong> On-Site Repair <strong style="color: orange">IHR:</strong> In-House Repair <strong style="color: green">SIC:</strong> SI Company <strong style="color: blue">SB:</strong> Selling Brother</h6>
		<div class="card mb-5">
			<div class="card-header">Service Location</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead>
					<tr>
						<th>No. Branch</th>
						<th>City</th>
						<th>Company Name</th>
						<th>Type</th>
						<th>Status</th>
						<th>Province</th>
						<th>Address</th>
						<th>Person In Charge</th>
						<th style="color: red">OSR</th>
						<th style="color: orange">IHR</th>
						<th style="color: green">SIC</th>
						<th style="color: blue">SB</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					@foreach($service as $s)
					<tr>
						<td>{{$s->no_branch}}</td>
						<td>{{$s->city_name}}</td>
						<td>{{$s->company}}</td>
						<td>{{$s->type}}</td>
						<td>{{$s->status}}</td>
						<td>{{$s->province}}</td>
						<td>{{strip_tags($s->address)}}</td>
						<td>{{$s->pic}} <br> <br> {{$s->telephone}} <br> {{$s->email}}</td>
						<td style="text-align:center"><i @if($s->onsite==1) class="fa fa-check" @else class="fa fa-remove" @endif aria-hidden="true"></i></td>
						<td style="text-align:center"><i @if($s->inhouse==1) class="fa fa-check" @else class="fa fa-remove" @endif aria-hidden="true"></i></td>
						<td style="text-align:center"><i @if($s->sic==1) class="fa fa-check" @else class="fa fa-remove" @endif aria-hidden="true"></i></td>
						<td style="text-align:center"><i @if($s->sellbro==1) class="fa fa-check" @else class="fa fa-remove" @endif aria-hidden="true"></i></td>
						<td>
							<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#editModal-{{ $s->no_branch }}"><i class="fa fa-pencil"></i></button>
							<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal-{{ $s->no_branch }}"><i class="fa fa-trash"></i></button>
							<!-- Modal Edit -->
							<div class="modal fade" id="editModal-{{ $s->no_branch }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Edit Service Location</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" method="POST" action="{{ route('updateService', $s->no_branch) }}" enctype="multipart/form-data">
											{{ csrf_field() }}
										<div class="modal-body">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">City</label>
												<div class="col-sm-8">
													<select class="form-control" name="City" id="City">
														@foreach($city as $c)
														<option value="{{ $c->id }}" @if($s->no_area == $c->id) selected @endif>{{ $c->name }}</option>
														@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Company Name</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="Company_Name" value="{{ $s->company }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Type</label>
												<div class="col-sm-8">
													<select name="Type" class="form-control">
														@foreach($type as $t)
															<option value="{{ $t->id }}" @if($s->type ==  $t->id) selected @endif>{{ $t->name }}</option>
														@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Status</label>
												<div class="col-sm-8">
													<select name="Status" class="form-control">
														@foreach($status as $st)
															<option value="{{ $st->id }}" @if($s->status ==  $st->id) selected @endif>{{ $st->name }}</option>
														@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Province</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="Province" value="{{ $s->province }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Address</label>
												<div class="col-sm-8">
													<textarea name="Address" class="form-control" rows="5">{{strip_tags($s->address)}}</textarea>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Person in Charge</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="Person_In_Charge" value="{{ $s->pic }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Telephone</label>
												<div class="col-sm-8">
													<input type="tel" name="Telephone" class="form-control" value="{{ $s->telephone }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Cellphone/Email</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="Email" value="{{ $s->email }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Capability</label>
												<div class="col-sm-8">
													<input type="checkbox" name="onsiterepair" value="1" @if($s->onsite == 1)  checked @endif> On-Site Repair <br>
													<input type="checkbox" name="inhouserepair" value="1" @if($s->inhouse == 1)  checked @endif> In-House Repair <br>
													<input type="checkbox" name="sicompany" value="1" @if($s->sic == 1)  checked @endif>  SI Company <br> 
													<input type="checkbox" name="sellingbrother" value="1" @if($s->sellbro == 1) checked @endif> Selling Brother
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-8">
												<button type="submit" class="btn btn-primary">Update</button>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											</div>
										</div>
										</form>
									</div>
								</div>
							</div>

							<!-- Modal Delete -->
							<div class="modal fade" id="deleteModal-{{ $s->no_branch}}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Delete</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="POST" action="{{ route('deleteService',$s->no_branch) }}" enctype="multipart/form-data">
									{{ csrf_field() }}
										<div class="modal-body">
											<div class="container">
												<div class="form-group row">
													<label class="col-sm-12 col-form-label text-center">Are you sure?</label>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-md-8">
												<button type="submit" class="btn btn-danger">Yes</button>
												<button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
											</div>
										</div>
										</form>
									</div>
								</div>
							</div>
						</td>
					</tr>
					@endforeach
					</tbody>
				</table>
			</div>
			<div class="card-footer p-0">
				<nav aria-label="...">
					{{$service->appends(['keyword' => $request->keyword])->links()}}
				</nav>
			</div>
		</div>
	</main>

	<!-- Modal New -->
	<div class="modal fade" id="newModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">New Location</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="POST" action="{{ url('/service-location/add') }}" enctype="multipart/form-data">
				{{ csrf_field() }}
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">City</label>
						<div class="col-sm-7">
							<select class="form-control" name="City">
								@foreach($city as $c)
									<option value="{{ $c->id }}">{{ $c->name }}</option>
								@endforeach
							</select>
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCityModal">+</button>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Company Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="Company_Name" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Type</label>
						<div class="col-sm-8">
							<select name="Type" class="form-control">
								@foreach($type as $ty)
									<option value="{{ $ty->id }}">{{ $ty->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Status</label>
						<div class="col-sm-8">
							<select name="Status" class="form-control">
								@foreach($status as $stat)
									<option value="{{ $stat->id }}">{{ $stat->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Province</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="Province" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Address</label>
						<div class="col-sm-8">
							<textarea name="Address" class="form-control" rows="5"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Person in Charge</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="Person_In_Charge" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Telephone</label>
						<div class="col-sm-8">
							<input type="tel" name="Telephone" class="form-control" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Cellphone/Email</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="Email" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Capability</label>
						<div class="col-sm-8">
							<input type="checkbox" name="onsiterepair" value="1"> On-Site Repair <br>
							<input type="checkbox" name="inhouserepair" value="1"> In-House Repair <br>
							<input type="checkbox" name="sicompany" value="1">  SI Company <br> 
							<input type="checkbox" name="sellingbrother" value="1"> Selling Brother
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-md-8">
						<button type="submit" class="btn btn-primary">Add</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div> 
	
	<!-- Modal New City -->
	<div class="modal fade" id="addCityModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">New City</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="{{ url('/city/add') }}" enctype="multipart/form-data">
				{{ csrf_field() }}
				<div class="modal-body">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">City Name</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="city_name" value="{{ old('city_name') }}">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<div class="col-md-8">
						<button type="submit" class="btn btn-primary">Add</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>

@endsection