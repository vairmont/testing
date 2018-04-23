<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function getByItem(){



        return view('report.byitem')->withTitle('By item');   
    }
    public function getByStore(){



        return view('report.bystore')->withTitle('By store');   
    }
    public function getByCategory(){


        return view('report.bycategory')->withTitle('By Category');   
    }
    public function getByEmployee(){


        return view('report.byemployee')->withTitle('by employee');
    }
    public function getByChasier(){


        return view('report.bychasier')->withTitle('by Chasier');
    }
}
