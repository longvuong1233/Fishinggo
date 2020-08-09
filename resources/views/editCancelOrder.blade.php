<?php
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Cancel Order</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-success btn-block" href="{{route('cancelOrder.index')}}">Cancel Order</a>
    {{Form::open(['route'=>['cancelOrder.update',$cancelOrder->id],'method'=>'PUT'])}}
            @csrf       
            <div class="form-group">
                <label for="description">Status:</label>
                <input type="text" class="form-control" placeholder="New Status" name="status" value="{{old('status',$cancelOrder?$cancelOrder->status:null)}}">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Edit</button>
            </div>
        {{Form::close()}}
    </div>
</body>
</html>