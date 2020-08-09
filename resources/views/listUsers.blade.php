<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Users</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
    <a class="btn btn-danger btn-block mt-3" href="{{route('home')}}">Home</a>
        @if(isset($list))
            <table class="table">
                <thead>
                <tr>
               
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Level</th>
                    <th scope="col">Email Verified At</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                        <tr>
                        <th scope="row">{{$item->id}}</th>
                            <td>{{$item->name}}</td>
                            <td>{{$item->username}}</td>
                            <td>{{$item->email}}</td>
                            <td>{{$item->level}}</td>
                            <td>{{$item->email_verified_at}}</td>
                        </tr>
                    @endforeach
                    
               
                </tbody>
            </table>
        @endif
        
    </div>
</body>
</html>