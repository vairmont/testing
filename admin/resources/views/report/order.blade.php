@extends('master-layout')

@section('title')
	{{ $title }}
@endsection

@section('content')
	<div class="pt-3">
		<div class="col-md-12">
			<form method="get" action="" enctype="multipart/form-data">
			<div class="row">
				<div class="col-md-3">
					<select name="order_status" class="form-control">
						<option>Order Status</option>
						<option value="New">New</option>
						<option value="On Progress">On Progress</option>
						<option value="Cancel">Cancel</option>
						<option value="Finish">Finish</option>
					</select>
				</div>
				<div class="col-md-3">
					<select name="payment_status" class="form-control">
						<option>Payment Status</option>
						<option value="Settlement">Accept/Settlement</option>
						<option value="Denied">Denied</option>
						<option value="Pending">Pending</option>
					</select>
				</div>
				<div class="col-md-3">
					<select name="category" class="form-control">
					<option>Search By</option>
					<option value="Order ID">Order ID</option>
						<option value="Buyer">Buyer</option>
						<option value="Seller">Seller</option>
					</select>
				</div>
				<div class="input-group col-md-3">
					<input type="text" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-primary" type="submit">search</button>
					</span>
				</div>
			</div>
			</form>
		</div>
	</div>

	<main class="container-fluid pt-3">
		<div class="card mb-5">
			<div class="card-header">Order</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead>
						<tr>
							<th>No</th>
							<th>Order ID</th>
							<th>Buyer</th>
							<th>Seller</th>
							<th>Order Status</th>
							<th>Payment Status</th>
							<th>Task Status</th>
							<th>Notes</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>52cbsajqw2191</td>
							<td>
								Mr. Nicko  <br>
								0812 5678 2456 <br>
								Jl. Kembangan Utara No. 55, Jakarta Barat.
							</td>
							<td>
								-
							</td>
							<td>New</td>
							<td>Pending</td>
							<td>Mencari Penjual</td>
							<td>-</td>
							<td>
								<a class="btn btn-sm btn-secondary" href="">view chat</a> <br><br>
								<a class="btn btn-sm btn-secondary" href="">view item</a>
							</td>
						</tr>

						<tr>
							<td>2</td>
							<td>52cbsajqw2191</td>
							<td>
								Mr. Nicko  <br>
								0812 5678 2456 <br>
								Jl. Kembangan Utara No. 55, Jakarta Barat.
							</td>
							<td>
								-
							</td>
							<td>New</td>
							<td>Denied</td>
							<td>Pembayaran di tolak</td>
							<td>-</td>
							<td>
								<a class="btn btn-sm btn-secondary" href="">view chat</a> <br><br>
								<a class="btn btn-sm btn-secondary" href="">view item</a>
							</td>
						</tr>

						<tr>
							<td>3</td>
							<td>52cbsajqw2191</td>
							<td>
								Mr. Nicko  <br>
								0812 5678 2456 <br>
								Jl. Kembangan Utara No. 55, Jakarta Barat.
							</td>
							<td>
								Brother Indonesia  <br>
								021 555 555<br>
								Jl. Raya Utara No. 50, Jakarta Barat.
							</td>
							<td>On Progress</td>
							<td>Settlement</td>
							<td>Menunggu Penawaran</td>
							<td>-</td>
							<td>
								<a class="btn btn-sm btn-secondary" href="">view chat</a> <br><br>
								<a class="btn btn-sm btn-secondary" href="">view item</a>
							</td>
						</tr>

						<tr>
							<td>4</td>
							<td>52cbsajqw2191</td>
							<td>
								Mr. Nicko  <br>
								0812 5678 2456 <br>
								Jl. Kembangan Utara No. 55, Jakarta Barat.
							</td>
							<td>
								Brother Indonesia  <br>
								021 555 555<br>
								Jl. Raya Utara No. 50, Jakarta Barat.
							</td>
							<td>Cancel</td>
							<td>Pending</td>
							<td>Negosiasi harga</td>
							<td>Harga tidak sesuai</td>
							<td>
								<a class="btn btn-sm btn-secondary" href="">view chat</a> <br><br>
								<a class="btn btn-sm btn-secondary" href="">view item</a>
							</td>
						</tr>

						<tr>
							<td>5</td>
							<td>52cbsajqw2191</td>
							<td>
								Mr. Nicko  <br>
								0812 5678 2456 <br>
								Jl. Kembangan Utara No. 55, Jakarta Barat.
							</td>
							<td>
								Brother Indonesia  <br>
								021 555 555<br>
								Jl. Raya Utara No. 50, Jakarta Barat.
							</td>
							<td>Finish</td>
							<td>Settlement</td>
							<td>Transaksi Selesai</td>
							<td>-</td>
							<td>
								<a class="btn btn-sm btn-secondary" href="">view chat</a> <br><br>
								<a class="btn btn-sm btn-secondary" href="">view item</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="card-footer p-0">
				<nav aria-label="...">
					<ul class="pagination justify-content-end mt-3 mr-3">
						<li class="page-item disabled">
							<span class="page-link">Previous</span>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item active">
								<span class="page-link">2<span class="sr-only">(current)</span>
								</span>
						</li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</main>
@endsection