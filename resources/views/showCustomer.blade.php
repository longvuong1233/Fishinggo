<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Customer Detail</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
    <a class="btn btn-danger btn-block mt-3" href="{{route('home')}}">Home</a>
        @if(isset($customer))
        <h2 class="text-center"><b>INFORMATION CUSTOMER</b></h2>
            <table class="table">
                <thead>
                <tr>
               
                    <th scope="col">ID_Customer</th>
                    <th scope="col">Name</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Note</th>
                </tr>
                </thead>
                <tbody>
                        <tr>
                        <th scope="row">{{$customer->id}}</th>
                            <td>{{$customer->name}}</td>
                            <td>{{$customer->gender}}</td>
                            <td>{{$customer->email}}</td>
                            <td>{{$customer->address}}</td>
                            <td>{{$customer->phone}}</td>
                            <td>{{$customer->note}}</td>
                           
                          
                        </tr>
                </tbody>
            </table>
        @endif
        <a class="btn btn-primary btn btn-block" href="{{route('bill.index')}}"> Turn Back</a>
        
    </div>
</body>
</html>