<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Cancel Orders</title>
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
                    <th scope="col">ID_Customer</th>
                    <th scope="col">ID_Bill</th>
                    <th scope="col">Note</th>
                    <th scope="col">Status</th>
                    <th scope="col">Created At</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                        <tr>
                        <th scope="row">{{$item->id}}</th>
                            <td>{{$item->id_customer}}</td>
                            <td>{{$item->id_bill}}</td>
                            <td>{{$item->note}}</td>
                            <td>{{$item->status}}</td>
                            <td>{{$item->created_at}}</td>
                            <td>
                                <div class="btn-group btn-group-sm  ">
                                    <a type="button" class="btn btn-primary" href="{{route('cancelOrder.edit',$item->id)}}">Edit</a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    
               
                </tbody>
            </table>
        @endif
        
    </div>
</body>
</html>