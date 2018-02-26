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
			<form method="GET" action="{{ url('/newspromo') }}" enctype="multipart/form-data">
			<div class="input-group">
				<input type="text" name="keyword" class="form-control" placeholder="Search for title or description..." @if(isset($request->keyword) && $request->keyword != "") value="{{ $request->keyword }}" @endif>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="submit">search</button>
				</span>
			</div>
			</form>
		</div>
	</div>
	<main class="container-fluid pt-3">
		<div class="card mb-5">
			<div class="card-header">News & Promo</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead class="">
					<tr>
						<th>No</th>
						<th>Create Date</th>
						<th>Update Date</th>
						<th>Image</th>
						<th>Title</th>
						<th>Description</th>
						<th>Customer</th>
						<th>Reseller</th>
						<th>Dealer</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					@foreach($news as $index => $n)
					<tr>
						<td>{{ $index + 1 }}</td>
						<td>{{ $n->created_at }}</td>
						<td>{{ $n->updated_at }}</td>
						<td><img src="../{{ $n->image }}" width="100px"></td>
						<td>{{ $n->title }}</td>
						<td>{{ strip_tags($n->description) }}</td>
						<td class="text-center">@if($n->customer == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($n->reseller == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td class="text-center">@if($n->dealer == 1) <i class="fa fa-check"></i> @else <i class="fa fa-close"></i> @endif</td>
						<td>
							<button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#editModal-{{ $n->id }}">Edit</button>
							<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal-{{ $n->id }}">Remove</button>

							<!-- Modal Edit -->
							 <div class="modal fade" id="editModal-{{ $n->id }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Edit News & Promo</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="{{ route('updateNews',$n->id) }}" enctype="multipart/form-data">
										{{ csrf_field() }}
										<div class="modal-body">
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Title</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" name="title" value="{{ $n->title }}">
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Description</label>
												<div class="col-sm-8">
													<textarea name="description" class="form-control" rows="5">{{ strip_tags($n->description) }}</textarea>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-sm-4 col-form-label">Show On</label>
												<div class="col-sm-8">
													<div class="form-check">
													<label class="form-check-label">
													<input type="checkbox" name="customer" class="form-check-input" value="1" @if($n->customer == 1) checked="true" @endif> Customer
													</label>
												</div>

												<div class="form-check">
													<label class="form-check-label">
													<input type="checkbox" name="reseller" class="form-check-input" value="1" @if($n->reseller == 1) checked="true" @endif> Reseller
													</label>
												</div>

												<div class="form-check">
													<label class="form-check-label">
													<input type="checkbox" name="dealer" class="form-check-input" value="1" @if($n->dealer == 1) checked="true" @endif> Dealer
													</label>
												</div>
												</div>
											</div>
											<div class="form-group">
												<div class="form-group files">
													<label>Upload News & Promo Image</label>
													<input type="file" class="form-control" name="image">
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

							<!-- Modal Delete -->
							<div class="modal fade" id="deleteModal-{{ $n->id }}">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Delete</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<form method="post" action="{{ route('deleteNews',$n->id) }}" enctype="multipart/form-data">
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
					{{ $news->appends(['keyword' => $request->keyword])->links() }}
				</nav>
			</div>
		</div>
	</main>

	<!-- Modal New -->
	 <div class="modal fade" id="newModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">New News & Promo</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post" action="{{ url('/newspromo/add') }}" enctype="multipart/form-data">
				{{ csrf_field() }}
				<div class="modal-body">
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Title</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="title" value="{{ old('title') }}">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Description</label>
						<div class="col-sm-8">
							<textarea name="description" class="form-control" rows="5">{{ old('description') }}</textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-4 col-form-label">Show On</label>
						<div class="col-sm-8">
							<div class="form-check">
								<label class="form-check-label">
								<input type="checkbox" name="customer" class="form-check-input" value="1"> Customer
								</label>
							</div>

							<div class="form-check">
								<label class="form-check-label">
								<input type="checkbox" name="reseller" class="form-check-input" value="1"> Reseller
								</label>
							</div>

							<div class="form-check">
								<label class="form-check-label">
								<input type="checkbox" name="dealer" class="form-check-input" value="1"> Dealer
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-group files">
							<label>Upload News & Promo Image</label>
							<input type="file" class="form-control" name="image">
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