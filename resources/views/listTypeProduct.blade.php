<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Type Product</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-danger btn-block mt-3" href="{{route('home')}}">Home</a>
        <a class="btn btn-success btn-block" href="{{route('typeproduct.create')}}">Add Type Products</a>
        @if(isset($list))
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Image</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    @foreach ($list as $item)
                        <tr>
                        <th scope="row">{{$item->id}}</th>
                            <td>{{$item->name}}</td>
                            <td>{{$item->description}}</td>
                            <td>
                             <img src="../..{{$item->image}}" class="rounded-circle" style="width:60px"/>
                            </td>
                             <td>
                                <div class="btn-group btn-group-sm  ">
                                <a type="button" class="btn btn-primary" href="{{route('typeproduct.edit',$item->id)}}" >Edit</a>
                                 {{Form::open(['route'=>['typeproduct.destroy',$item->id], 'method'=>'DELETE'])}}
                                    <button type="submit" class="btn btn-warning">Delete</button>
                                {{ Form::close() }}
                                    
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