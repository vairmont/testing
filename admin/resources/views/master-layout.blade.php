<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>@yield('title') :: Brother Admin Site</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link rel="stylesheet" href="{{asset('font-awesome/css/font-awesome.min.css') }}">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Lato:400" />
        <link rel="stylesheet" href="{{ asset('css/style.css') }}">
        <style>
          body {
            font-family: Lato;
          }
        </style>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
    </head>
    <body>
      <section class="header">
        <nav class="navbar navbar-expand-lg navbar-dark brother">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarToggler">
            <a class="navbar-brand" href="{{ url('/dashboard') }}"><img src="{{ asset('image/logo_brother.png') }}"></a>
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/dashboard') }}">Dashboard</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuAccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Account Data
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuAccount">
                  <a class="dropdown-item" href="{{url('/customer')}}">Customer</a>
                  <a class="dropdown-item" href="{{url('/reseller')}}">Reseller</a>
                  <a class="dropdown-item" href="{{url('/masterdealer')}}">Master Dealer</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/product') }}">Product</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/voucher') }}">Voucher</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/newspromo') }}">News & Promo</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/service-location') }}">Services</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ url('/ticket-support') }}">Ticket Support</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuAccount" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Report
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuAccount">
                  <a class="dropdown-item" href="{{ url('report/orders') }}">Orders</a>
                  <a class="dropdown-item" href="{{ url('report/product') }}">Product</a>
                </div>
              </li>
            </ul>
            <span class="navbar-text">
              <span>{{ session('name') }}</span> | <span><a class="link" href="{{ url('/logout') }}">Logout</a></span>
            </span>
          </div>
        </nav>
      </section>
      
      <section class="content-wrapper">
        @yield('content')
      </section>
    </body>
</html>
