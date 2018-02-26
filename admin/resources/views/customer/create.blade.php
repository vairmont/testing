@extends('master-layout')

@section('title')
	{{ $title }}
@endsection

@section('content')
	@include('error.template')
	<div class="pt-3">
		{{--  <div class="col-2">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newModal">Add New</button>
		</div>  --}}

		<div class="col-md-6 pt-3">
			<form method="get" action="{{ url('/customer') }}" enctype="multipart/form-data">
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
			<div class="card-header">Customer</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead class="">
					<tr>
						<th>No</th>
						<th>Name</th>
						<th>Email</th>
						<th>Phone</th>
						<th>Address</th>
						<th>City</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					@foreach($customers as $index=>$customer)
					<tr>
						<td>{{ $index+1 }}</td>
						<td>{{ $customer->name }}</td>
						<td>{{ $customer->email }}</td>
						<td>{{ $customer->phone }}</td>
						<td>{{ $customer->address_2 }}</td>
						<td>{{ $customer->city_name }}</td>
						<td>{{ $customer->status }}</td>
						<td class="text-center">
							<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#editModal-{{ $customer->identifier }}">Edit</button>
							<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal-{{ $customer->identifier }}">Remove</button>

							<!-- Modal Edit -->
							<div class="modal fade" id="editModal-{{ $customer->identifier }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Edit Customer</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="{{ route('updateCustomer', $customer->identifier) }}" enctype="multipart/form-data">
											{{ csrf_field() }}
										<div class="modal-body">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Name</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="name" value="{{ $customer->name }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Email</label>
												<div class="col-sm-8">
													<input type="email" class="form-control" name="email" value="{{ $customer->email }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Phone</label>
												<div class="col-sm-8">
													<input type="tel" name="phone" class="form-control" value="{{ $customer->phone }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Address</label>
												<div class="col-sm-8">
													<textarea name="address" class="form-control">{{ $customer->address_2 }}</textarea>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">City</label>
												<div class="col-sm-8">
													<select name="city" class="form-control">
														@foreach($cities as $city)
															<option value="{{ $city->id }}" @if($customer->city_id == $city->id) selected @endif>{{ $city->name }}</option>
														@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Status</label>
												<div class="col-sm-8">
													<select class="form-control" name="status">
														<option value="active" @if($customer->status == 'active') selected @endif>Active</option>
														<option value="inactive" @if($customer->status == 'inactive') selected @endif>Inactive</option>
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
							<div class="modal fade" id="deleteModal-{{ $customer->identifier }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Delete</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="{{ route('deleteCustomer', $customer->identifier) }}" enctype="multipart/form-data">
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
					{{ $customers->appends(['keyword' => $request->keyword])->links() }}
				</nav>
			</div>
		</div>
	</main>

	<!-- Modal New -->
	{{--  <div class="modal fade" id="newModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">New Customer</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="#" enctype="multipart/form-data">
				{{ csrf_field() }}
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Name</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="name" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Email</label>
						<div class="col-sm-8">
							<input type="email" class="form-control" name="email" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Phone</label>
						<div class="col-sm-8">
							<input type="tel" name="phone" class="form-control" value="">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Address</label>
						<div class="col-sm-8">
							<textarea name="address" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">City</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="city" value="">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-md-8">
						<button type="button" class="btn btn-primary">Add</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>  --}}
@endsection
