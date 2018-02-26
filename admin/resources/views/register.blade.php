<!doctype html>
<html lang="{{ app()->getLocale() }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ $title }} :: Brother Admin Site</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Lato:400" />
        <link rel="stylesheet" href="{{ asset('css/style.css') }}">
        <style>
          body {
            font-family: Lato;
          }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="text-center">
                <h3>Admin Registration</h3>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card mt-2">
                        <div class="card-body">
                            @include('error.template')
                            <form action="{{ url('/register/store') }}" method="post" enctype="multipart/form-data">
                                {{ csrf_field() }}
                              <div class="form-group">
                                  <label for="name">Name</label>
                                  <input type="text" name="name" class="form-control" placeholder="Enter name" value="{{ old('name') }}">
                              </div>
                              <div class="form-group">
                                  <label for="phone">Phone</label>
                                  <input type="tel" name="phone" class="form-control" placeholder="Enter phone" value="{{ old('phone') }}">
                              </div>
                              <div class="form-group">
                                  <label for="department">Department</label>
                                  <input type="text" name="department" class="form-control" placeholder="Enter department" value="{{ old('department') }}">
                              </div>
                              <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" value="{{ old('email') }}">
                              </div>
                              <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" id="password" placeholder="Enter password">
                              </div>
                              <div class="form-group">
                                <label for="password">Password Confirmation</label>
                                <input type="password" name="password_confirmation" class="form-control" placeholder="Enter password confirmation">
                              </div>
                              <button type="submit" class="btn btn-primary col-md-3">Register</button>
                              <a href="{{ url('/') }}"><button type="button" class="btn btn-primary col-md-3">Login</button></a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
