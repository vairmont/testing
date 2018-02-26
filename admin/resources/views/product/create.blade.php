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
			<form method="get" action="{{ url('/product') }}" enctype="multipart/form-data">
			<div class="input-group">
				<input type="text" class="form-control" name="keyword" placeholder="Search for product name..." @if(isset($request->keyword) && !empty($request->keyword)) value="{{ $request->keyword }}" @endif>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="submit">search</button>
				</span>
			</div>
			</form>
		</div>
	</div>
	<main class="container-fluid pt-3">
		<div class="card mb-5">
			<div class="card-header">Product List</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead class="">
					<tr>
						<th>No.</th>
						<th>Image</th>
						<th>Brochure</th>
						<th>Product Name</th>
						<th>Category</th>
						<th>Price for Customer</th>
						<th>Price for Reseller</th>
						<th>Description</th>
						<th>Update Image</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					@foreach($products as $index => $product)
					<tr>
						<td>{{ $index + 1 }}</td>
						<td><img src="../{{ $product->img_url }}" width="60px"></td>
						<td style="text-align: center;">@if($product->brochure_url != "") <i class="fa fa-check" style="color: green"></i> @else <i class="fa fa-close" style="color: red"></i> @endif</td>
						<td>{{ $product->product_name }}</td>
						<td>{{ $product->category_name }}</td>
						<td>Rp {{ number_format($product->price_for_customer) }}</td>
						<td>Rp {{ number_format($product->price_for_reseller) }}</td>
						<td>{{strip_tags($product->description) }}</td>
						<td class="text-center"><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#imageModal-{{ $product->id }}">Change Image</button></td>
						<td class="text-center">
							<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#editModal-{{ $product->id }}">Edit</button>
							<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal-{{ $product->id }}">Remove</button>
							<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#uploadbrosur-{{ $product->id }}">Upload Brochure</button>
						</td>

						<!-- Modal Image -->
						<div class="modal fade" id="imageModal-{{ $product->id }}">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Image</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<p class="text-center"><img src="../{{ $product->img_url }}" width="240px" class="img-thumbnail"></p>
										<hr>
										<div class="container">
											<div class="row">
												<div class="col-md-12">
													<form method="POST" enctype="multipart/form-data" action="{{ route('updateProduct',$product->id) }}">
													{{ csrf_field() }}
														<div class="form-group files">
															<label>Upload Your Image </label>
															<input type="file" name="product_image" class="form-control">
															<input type="hidden" name="action" value="Update Image">
														</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-8">
										<button type="submit" class="btn btn-primary">Save</button></form>
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Modal Upload -->
						<div class="modal fade" id="uploadbrosur-{{ $product->id }}">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Upload Your Brosur</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form method="POST" enctype="multipart/form-data" action="{{ route('updateProduct',$product->id) }}">
										{{ csrf_field() }}
									<div class="modal-body">
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">Choose Brosur</label>
											<div class="col-sm-8">
												<div class="form-group">
			    									<label>File input</label>
			    									<input type="file" name="brochure" class="form-control-file" aria-describedby="fileHelp">
			    									<small id="fileHelp" class="form-text text-muted">.pdf file</small>
			    									<input type="hidden" name="action" value="Upload Brochure">
				 								</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-8">
											<button type="submit" class="btn btn-primary">Upload</button>
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Modal Edit -->
						<div class="modal fade" id="editModal-{{ $product->id }}">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Edit Item</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="{{ route('updateProduct', $product->id) }}" enctype="multipart/form-data" method="POST">
										{{ csrf_field() }}
										<input type="hidden" name="action" value="Update Data">
									<div class="modal-body">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Product Name</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="product_name" value="{{ $product->product_name }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Category Name</label>
												<div class="col-sm-8">
													<select class="form-control" name="category_name">
														@foreach($categories as $cat)
															<option value="{{ $cat->id }}" @if($product->category_id == $cat->id) selected @endif>{{ $cat->name }}</option>
														@endforeach
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Price for Customer</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="price_for_customer" value="{{ $product->price_for_customer }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Price for Reseller</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="price_for_reseller" value="{{ $product->price_for_reseller }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Description</label>
												<div class="col-sm-8">
													<textarea name="description" class="form-control" rows="8">{{strip_tags($product->description) }}</textarea>
												</div>
											</div>
									</div>
									<div class="modal-footer">
										<div class="col-md-8">
											<button type="submit" class="btn btn-primary">Confirm</button>
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Modal Delete -->
						<div class="modal fade" id="deleteModal-{{ $product->id }}">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Delete</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form action="{{ route('deleteProduct',$product->id) }}" method="POST" enctype="multipart/form-data">
										{{ csrf_field() }}
									<div class="modal-body">
										<div class="container">
											<div class="form-group row">
												<label class="col-sm-12 col-form-label text-center">Are you Sure?</label>
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
					</tr>
					@endforeach
					</tbody>
				</table>
			</div>
			<div class="card-footer p-0">
				<nav aria-label="...">
					{{ $products->appends(['keyword' => $request->keyword])->links() }}
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
				<form method="POST" action="{{ url('/product/add') }}" enctype="multipart/form-data">
					{{ csrf_field() }}
				<div class="modal-body">
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Product Name</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="product_name" value="{{ old('product_name') }}">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Category Name</label>
							<div class="col-sm-8">
								<select class="form-control" name="category_name">
									<option value="">Choose Category</option>
									@foreach($categories as $c)
										<option value="{{ $c->id }}">{{ $c->name }}</option>
									@endforeach
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Price for Customer</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="price_for_customer" value="{{ old('price_for_customer') }}">
								</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Price for Reseller</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="price_for_reseller" value="{{ old('price_for_reseller') }}">
								</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-4 col-form-label">Description</label>
								<div class="col-sm-8">
									<textarea name="description" class="form-control" rows="8"></textarea>
								</div>
						</div>
						<div class="form-group">
							<div class="form-group files">
								<label>Upload Your Image </label>
								<input type="file" class="form-control" name="product_image">
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
