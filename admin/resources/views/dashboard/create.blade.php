@extends('master-layout')

@section('title')
	{{ $title }}
@endsection

@section('content')
<div class="row">
	<div class="card col-md-4">
		<div class="card-body">
			<h3>Account</h3>
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Customer
					<span class="badge @if($customer->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $customer->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Reseller Owner
					<span class="badge @if($reseller_owner->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $reseller_owner->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Reseller Staff
					<span class="badge @if($reseller_staff->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $reseller_staff->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Dealer
					<span class="badge @if($dealer->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $dealer->total }}</span>
				</li>
			</ul>
		</div>
	</div>

	<div class="card col-md-4">
		<div class="card-body">
			<h3>Product</h3>
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Printer Inkjet
					<span class="badge @if($printer_inkjet->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $printer_inkjet->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Printer Laser
					<span class="badge @if($printer_laser->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $printer_laser->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Printer Label
					<span class="badge @if($printer_label->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $printer_label->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Scanner
					<span class="badge @if($scanner->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $scanner->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Mesin Jahit
					<span class="badge @if($mesin_jahit->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $mesin_jahit->total }}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Lain-lain
					<span class="badge @if($lain_lain->total == 0) badge-danger @else badge-primary @endif badge-pill">{{ $lain_lain->total }}</span>
				</li>
			</ul>
		</div>
	</div>

	<div class="card col-md-4">
		<div class="card-body">
			<h3>Voucher</h3>
			@if(count($voucher) > 0)
			<ul class="list-group">
				@foreach($voucher as $v)
				<li class="list-group-item d-flex justify-content-between align-items-center">
					{{ $v->voucher_code }} ({{$v->discount_rate}}%)
					<span class="badge badge-danger badge-pill">Expired: {{Carbon\Carbon::parse($v->valid_until)->format('d M Y')}}</span>
				</li>
				@endforeach
			</ul>
			@else
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Voucher
					<span class="badge badge-danger badge-pill">{{ count($voucher) }}</span>
				</li>
			</ul>
			@endif
		</div>
	</div>
</div>

<div class="row">
	<div class="card col-md-4">
		<div class="card-body">
			<h3>News & Promo</h3>
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Customer
					<span class="badge @if($newspromo_customer->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$newspromo_customer->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Reseller
					<span class="badge @if($newspromo_reseller->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$newspromo_reseller->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Dealer
					<span class="badge @if($newspromo_dealer->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$newspromo_dealer->total}}</span>
				</li>
			</ul>
		</div>
	</div>

	<div class="card col-md-4">
		<div class="card-body">
			<h3>Services</h3>
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Branch Office
					<span class="badge @if($branch_office->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$branch_office->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Head Office
					<span class="badge @if($head_office->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$head_office->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					ITSC Partner
					<span class="badge @if($itsc_partner->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$itsc_partner->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					TSG Partner
					<span class="badge @if($tsg_partner->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$tsg_partner->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					ITSC
					<span class="badge @if($itsc->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$itsc->total}}</span>
				</li>
			</ul>
		</div>
	</div>

	<div class="card col-md-4">
		<div class="card-body">
			<h3>Ticket Support</h3>
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Unreplied
					<span class="badge @if($unreplied->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$unreplied->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Replied
					<span class="badge @if($replied->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$replied->total}}</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
					Closed
					<span class="badge @if($closed->total == 0) badge-danger @else badge-primary @endif badge-pill">{{$closed->total}}</span>
				</li>
			</ul>
		</div>
	</div>
</div>
@endsection