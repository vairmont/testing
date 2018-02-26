<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Ticket;
use App\Mail\TicketSupport;

class TicketController extends Controller
{
    public function create() {
    	$tickets = Ticket::select('ticket.*','users.email as sender_email')
        ->join('users','ticket.sender_id','=','users.id')
        ->orderBy('created_at','desc')
        ->paginate(20);

    	return view('ticket.create', compact('tickets'))->withTitle('Ticket Support');
    }

    public function reply(Request $request) {

    	$ticket_id = $request->ticket_id;
    	$ticket_sender = $request->ticket_sender;
    	$subject = $request->subject;
    	$message = $request->message;

        $data = [
            'subject' => $subject,
            'message' => $message
        ];

    	// send email to user
         Mail::to($ticket_sender)->send(new TicketSupport($data));
    	
        // update DB
        $input['status'] = 'Replied';
        $update = Ticket::where('id',$ticket_id)->update($input);

        return back()->withSuccess('Message has been replied.');
    }

    public function close(Request $request) {

        $ticket_id = $request->ticket_id;
        $ticket_sender = $request->ticket_sender;

        $data = [
            'subject' => 'Konfirmasi Ticket Support',
            'message' => 'Ticket Anda sudah kami tutup. Terima kasih telah menghubungi kami.'
        ];

        // send email to user
        Mail::to($ticket_sender)->send(new TicketSupport($data));

        // update DB
        $input['status'] = 'Closed';
        $close = Ticket::where('id',$ticket_id)->update($input);

        return back()->withSuccess('Message has been closed.');
    }
}
