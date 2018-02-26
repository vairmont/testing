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
		<form method="GET" action="{{ url('/voucher') }}" enctype="multipart/form-data">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword" placeholder="Search for voucher code..." @if(isset($request->keyword) && !empty($request->keyword)) value="{{ $request->keyword }}" @endif>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="submit">search</button>
				</span>
			</div>
		</form>
	</div>
</div>
<main class="container-fluid pt-3">
	<div class="card mb-5">
		<div class="card-header">Discount Voucher</div>
		<div class="card-block p-0">
			<table class="table table-bordered table-sm m-0 sortable table-responsive">
				<thead class="">
					<tr>
						<th>No.</th>
						<th>Voucher Code</th>
						<th>Discount Rate (%)</th>
						<th>For</th>
						<th>Product Category</th>
						<th>Description</th>
						<th>Validity</th>
						<th>Quota</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					@foreach($vouchers as $index => $voucher)
					<tr>
						<td>{{ $index + 1 }}</td>
						<td>{{$voucher->voucher_code}}</td>
						<td>{{$voucher->discount_rate}}</td>
						<td>{{ $voucher->for }}</td>
						<td>{{ $voucher->category_name }}</td>
						<td>{{strip_tags($voucher->description)}}</td>
						<td>{{Carbon\Carbon::parse($voucher->valid_from)->format('d M Y')}} - {{Carbon\Carbon::parse($voucher->valid_until)->format('d M Y')}} </td>
						<td>{{number_format($voucher->quota)}}</td>
						<td class="text-center">
							<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#editModal-{{ $voucher->id }}">Edit</button>
							<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal-{{ $voucher->id }}">Remove</button>

							<!-- Modal Edit -->
							<div class="modal fade" id="editModal-{{ $voucher->id }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Edit Voucher</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="POST" action="{{ route('updateVoucher', $voucher->id) }}" enctype="multipart/form-data">
											{{ csrf_field() }}
											<div class="modal-body">
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Voucher Code</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="voucher_code" value="{{ $voucher->voucher_code }}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Discount Rate (%)</label>
													<div class="col-sm-8">
														<input type="number" min="0" max="100" class="form-control" name="discount_rate" value="{{ $voucher->discount_rate }}">
													</div>
												</div>
												<div class="form-group row">
													<label for="" class="col-sm-4 col-form-label">For</label>
													<div class="col-sm-8">
														<select name="for" class="form-control">
															<option value="">Choose</option>
															<option value="Customer" @if($voucher->for == 'Customer') selected @endif>Customer</option>
															<option value="Reseller" @if($voucher->for == 'Reseller') selected @endif>Reseller</option>
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label for="" class="col-sm-4 col-form-label">Product Category</label>
													<div class="col-sm-8">
														<select name="product_category" class="form-control">
															<option value="">Choose</option>
															@foreach($productCategories as $pc)
																<option value="{{ $pc->id }}" @if($voucher->product_category == $pc->id) selected @endif>{{ $pc->name }}</option>
															@endforeach
														</select>
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Valid From</label>
													<div class="col-sm-8">
														<input type="date" name="valid_from" class="form-control" value="{{ $voucher->valid_from }}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Valid Until</label>
													<div class="col-sm-8">
														<input type="date" name="valid_until" class="form-control" value="{{ $voucher->valid_until }}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Quota</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="quota" value="{{ $voucher->quota }}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Description</label>
													<div class="col-sm-8">
														<textarea name="description" class="form-control">{{ strip_tags($voucher->description) }}</textarea>
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
							<div class="modal fade" id="deleteModal-{{ $voucher->id }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Delete</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="POST" action="{{ route('deleteVoucher',$voucher->id) }}" enctype="multipart/form-data">
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
				{{ $vouchers->appends(['keyword' => $request->keyword])->links() }}
			</nav>
		</div>
	</div>
</main>

<!-- Modal New -->
<div class="modal fade" id="newModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">New Item</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form method="POST" action="{{url('/voucher/add')}}" enctype="multipart/form-data">
				{{ csrf_field() }}
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Voucher Code</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="voucher_code" value="{{ old('voucher_code') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Discount Rate (%)</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="discount_rate" value="{{ old('discount_rate') }}">
						</div>
					</div>
					<div class="form-group row">
						<label for="" class="col-sm-4 col-form-label">For</label>
						<div class="col-sm-8">
							<select name="for" class="form-control">
								<option value="">Choose</option>
								<option value="Customer">Customer</option>
								<option value="Reseller">Reseller</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label for="" class="col-sm-4 col-form-label">Product Category</label>
						<div class="col-sm-8">
							<select name="product_category" class="form-control">
								<option value="">Choose</option>
								@foreach($productCategories as $pcat)
									<option value="{{ $pcat->id }}">{{ $pcat->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Valid From</label>
						<div class="col-sm-8">
							<input type="date" name="valid_from" class="form-control" value="{{ old('valid_from') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Valid Until</label>
						<div class="col-sm-8">
							<input type="date" name="valid_until" class="form-control" value="{{ old('valid_until') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Quota</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="quota" value="{{ old('quota') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Description</label>
						<div class="col-sm-8">
							<textarea name="description" class="form-control">{{ old('description') }}</textarea>
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