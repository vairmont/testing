@extends('master-layout')

@section('title')
	{{ $title }}
@endsection

@section('content')

@include('error.template')
	<main class="container-fluid pt-3">
		<div class="card mb-5">
			<div class="card-header">Ticket Support</div>
			<div class="card-block p-0">
				<table class="table table-bordered table-sm m-0 sortable table-responsive">
					<thead class="">
					<tr>
						<th>No</th>
						<th>Date</th>
						<th>Sender</th>
						<th>Handler Department</th>
						<th>Subject</th>
						<th>Message</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
						@foreach($tickets as $index => $ticket)
						<tr>
							<td>{{ $index + 1 }}</td>
							<td>{{ $ticket->created_at }}</td>
							<td>{{ $ticket->sender_email }}</td>
							<td>{{ $ticket->department }}</td>
							<td>{{ $ticket->subject }}</td>
							<td>{{ strip_tags($ticket->message) }}</td>
							<td>{{ $ticket->status }}</td>
							<td>
								@if($ticket->status == 'Unreplied')<button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#reply-{{ $ticket->id }}">Reply</button>@endif
								@if($ticket->status != 'Closed')<button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#close-{{ $ticket->id }}">Close Ticket</button>@endif

								<!-- Modal Reply -->
								<div class="modal fade" id="reply-{{ $ticket->id }}">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Reply to {{ $ticket->sender_email }}</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form action="{{ url('/ticket-support/reply') }}" method="POST" enctype="multipart/form-data">
												{{ csrf_field() }}
											<div class="modal-body">
												<div class="form-group row p-3">
													User's Message: <br>
													{{ strip_tags($ticket->message) }}
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Subject</label>
													<div class="col-sm-8">
														<input type="text" class="form-control" name="subject" value="RE: {{ $ticket->subject }}">
													</div>
												</div>
												<div class="form-group row">
													<label class="col-sm-4 col-form-label">Message</label>
													<div class="col-sm-8">
														<textarea name="message" class="form-control">Hi, {{ $ticket->sender_email }}</textarea>
													</div>
												</div>
												<input type="hidden" name="ticket_id" value="{{ $ticket->id }}">
												<input type="hidden" name="ticket_sender" value="{{ $ticket->sender_email }}">
											</div>
											<div class="modal-footer">
												<div class="col-md-8">
													<button type="submit" class="btn btn-primary">Reply</button>
													<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												</div>
											</div>
											</form>
										</div>
									</div>
								</div>

								<!-- Modal Close -->
								<div class="modal fade" id="close-{{ $ticket->id }}">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Close Ticket</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<form method="post" action="{{ url('/ticket-support/close') }}" enctype="multipart/form-data">
												{{ csrf_field() }}
											<div class="modal-body">
												<div class="container">
													<div class="form-group row">
														<label class="col-sm-12 col-form-label text-center">Close this ticket?</label>
														<input type="hidden" name="ticket_id" value="{{ $ticket->id }}">
														<input type="hidden" name="ticket_sender" value="{{ $ticket->sender_email }}">
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
					{{ $tickets->links() }}
				</nav>
			</div>
		</div>
	</main>
@endsection