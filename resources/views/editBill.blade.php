<?php
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Bill</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-success btn-block m-3" href="{{route('bill.index')}}">Bill</a>
    {{Form::open(['route'=>['bill.update',$bill->id],'files'=>true,'method'=>'PUT'])}}
            @csrf

           
            <div class="form-group">
                <label for="id_type">ID_Customer:</label>
            <a href="#">{{$bill->id_customer}}</a>
            </div>
          

            <div class="form-group">
                <label for="name">Total:</label>
            <h5>{{$bill->total}}</h5>
            </div>
    
            
            <div class="form-group">
                <label for="description">Payment:</label>
                <input type="text" class="form-control" placeholder="payment" name="payment" value="{{old('payment',$bill?$bill->payment:null)}}">
            </div>
    
            <div class="form-group">
                <label for="description">Note:</label>
                <input type='text' class="form-control"  name="note" value="{{old('note',$bill?$bill->note:null)}}"></input>
              
            </div>

            <div class="form-group">
                <label for="description">Status:</label>
                <input type="text" class="form-control" placeholder="Status" name="status" value="{{old("status",$bill ? $bill->status:null)}}" >
            </div>
           
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Edit</button>
            </div>
        {{Form::close()}}
    </div>
    
</body>
</html>