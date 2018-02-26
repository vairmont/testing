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
			<form method="get" action="{{ url('reseller') }}" enctype="multipart/form-data">
				<div class="form-group">
					<select name="role_type" class="form-control">
							<option value="">Choose Role</option>
						@foreach($roles as $r)
							<option value="{{ $r->id }}" @if(isset($request->role_type) && $request->role_type != "" && $request->role_type == $r->id) selected @endif>{{ $r->name }}</option>
						@endforeach
					</select>
				</div>
				<div class="input-group">
					<input type="text" class="form-control" name="keyword" placeholder="Search for..." @if(isset($request->keyword) && $request->keyword != "") value="{{ $request->keyword }}" @endif>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="submit">search</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	<main class="container-fluid pt-3">
		<div class="card mb-5">
			<div class="card-header">Reseller</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead class="">
					<tr>
						<th>No</th>
						<th>Shop's Name</th>
						<th>Name</th>
						<th>Role</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address 1</th>
						<th>Address 2</th>
						<th>City</th>
						<th>Printer Inkjet</th>
						<th>Printer Laser</th>
						<th>Printer Label</th>
						<th>Scanner</th>
						<th>Mesin Jahit</th>
						<th>Lain-lain</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					@foreach($resellers as $index => $reseller)
					<tr>
						<td>{{ $index+1 }}</td>
						<td>{{ $reseller->store_name }}</td>
						<td>{{ $reseller->name }}</td>
						<td>{{ $reseller->role_name }}</td>
						<td>{{ $reseller->email }}</td>
						<td>{{ $reseller->phone }}</td>
						<td>{{ $reseller->address_1 }}</td>
						<td>{{ $reseller->address_2 }}</td>
						<td>{{ $reseller->city_name }}</td>
						<td class="text-center">@if($reseller->printer_inkjet == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($reseller->printer_laser == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($reseller->printer_label == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($reseller->scanner == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($reseller->mesin_jahit == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($reseller->lain_lain == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td>{{ $reseller->status }}</td>
						<td>
							<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#editModal-{{ $reseller->identifier }}">Edit</button>
							<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal-{{ $reseller->identifier }}">Remove</button>
							<a href="{{ route('placeSearch') }}?id={{ $reseller->identifier }}&state=reseller"><button type="button" class="btn btn-sm btn-primary">Add Location</button></a>

							<!-- Modal Edit -->
							<div class="modal fade" id="editModal-{{ $reseller->identifier }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Edit Reseller</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="{{ route('updateReseller', $reseller->identifier) }}" enctype="multipart/form-data">
											{{ csrf_field() }}
										<div class="modal-body">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Shop's Name</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="shop_name" value="{{ $reseller->store_name }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Name</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="name" value="{{ $reseller->name }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Product Category</label>
												<div class="col-sm-8">
													<input type="checkbox" name="printer_inkjet" value="1" @if($reseller->printer_inkjet == 1) checked @endif> Printer Inkjet <br>
													<input type="checkbox" name="printer_laser" value="1" @if($reseller->printer_laser == 1) checked @endif> Printer Laser <br>
													<input type="checkbox" name="printer_label" value="1" @if($reseller->printer_label == 1) checked @endif> Printer Label <br>
													<input type="checkbox" name="scanner" value="1" @if($reseller->scanner == 1) checked @endif> Scanner <br>
													<input type="checkbox" name="mesin_jahit" value="1" @if($reseller->mesin_jahit == 1) checked @endif> Mesin Jahit <br>
													<input type="checkbox" name="lain_lain" value="1" @if($reseller->lain_lain == 1) checked @endif> Lain-lain
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Email</label>
												<div class="col-sm-8">
													<input type="email" class="form-control" name="email" value="{{ $reseller->email }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Role</label>
												<div class="col-sm-8">
													<select name="role" class="form-control">
													@foreach($roles as $role)
														<option value="{{ $role->id }}" @if($reseller->role_id == $role->id) selected @endif>{{ $role->name }}</option>
													@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Phone</label>
												<div class="col-sm-8">
													<input type="tel" name="phone" class="form-control" value="{{ $reseller->phone }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Address</label>
												<div class="col-sm-8">
													<textarea name="address" class="form-control">{{ $reseller->address_2 }}</textarea>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">City</label>
												<div class="col-sm-8">
													<select name="city" class="form-control">
													@foreach($cities as $city)
														<option value="{{ $city->id }}" @if($reseller->city_id == $city->id) selected @endif>{{ $city->name }}</option>
													@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Status</label>
												<div class="col-sm-8">
													<select class="form-control" name="status">
														<option value="active" @if($reseller->status == 'active') selected @endif>Active</option>
														<option value="inactive" @if($reseller->status == 'inactive') selected @endif>Inactive</option>
													</select>
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
							<div class="modal fade" id="deleteModal-{{ $reseller->identifier }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Delete</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="{{ route('deleteReseller', $reseller->identifier) }}" enctype="multipart/form-data">
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
					{{ $resellers->appends(['keyword' => $request->keyword, 'role_type' => $request->role_type])->links() }}
				</nav>
			</div>
		</div>
	</main>

	<!-- Modal New -->
	 <div class="modal fade" id="newModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">New Reseller</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="{{ url('reseller/store') }}" enctype="multipart/form-data">
				{{ csrf_field() }}
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Shop's Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="shop_name" value="{{ old('shop_name') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="name" value="{{ old('name') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Role</label>
						<div class="col-sm-8">
							<select name="role" class="form-control">
								@foreach($roles as $role)
								<option value="{{ $role->id }}">{{ $role->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Phone</label>
						<div class="col-sm-8">
							<input type="tel" name="phone" class="form-control" value="{{ old('phone') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Address</label>
						<div class="col-sm-8">
							<textarea name="address" class="form-control">{{ old('address') }}</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">City</label>
						<div class="col-sm-8">
							<select name="city" class="form-control">
								@foreach($cities as $city)
									<option value="{{ $city->id }}">{{ $city->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Email</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" name="email" value="{{ old('email') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Password</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="password" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Confirmation Password</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="confirmation_password" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Product Category</label>
						<div class="col-sm-8">
							<input type="checkbox" name="printer_inkjet" value="1"> Printer Inkjet <br>
							<input type="checkbox" name="printer_laser" value="1"> Printer Laser <br>
							<input type="checkbox" name="printer_label" value="1"> Printer Label <br>
							<input type="checkbox" name="scanner" value="1"> Scanner <br>
							<input type="checkbox" name="mesin_jahit" value="1"> Mesin Jahit <br>
							<input type="checkbox" name="lain_lain" value="1"> Lain-lain
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
