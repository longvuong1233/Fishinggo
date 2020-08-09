<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Order</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
    <a class="btn btn-success btn-block mt-3" href="{{route('home')}}">Home</a>
        @if(isset($list))
            <table class="table">
                <thead>
                <tr>
               
                    <th scope="col">ID_Customer</th>
                    <th scope="col">Total</th>
                    <th scope="col">Payment</th>
                    <th scope="col">Note</th>
                    <th scope="col">Status</th>
                    <th scope="col">CreatedAt</th>
                    <th scope="col">Updated_At</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                        <tr>
                        <th scope="row"><a href="{{route('customer.show',[$item->id_customer])}}">{{$item->id_customer}}</a></th>
                            <td>{{$item->total}}</td>
                            <td>{{$item->total}}</td>
                            <td>{{$item->payment}}</td>
                            <td>{{$item->note}}</td>
                            <td>{{$item->status}}</td>
                            <td>{{$item->created_at}}</td>
                            <td>{{$item->updated_at}}</td>
                           
                            <td>
                                <div class="btn-group btn-group-sm  ">
                                    <a type="button" class="btn btn-primary" href="{{route('bill.edit',$item->id)}}">Edit</a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    
               
                </tbody>
            </table>
        <a class="btn btn-danger btn-block" href="{{route('cancelOrder.index')}}">List Cancel Order </a>
        @endif
        
    </div>
</body>
</html>