<?php
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Products</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-success btn-block" href="{{route('products.index')}}">Products</a>
    {{Form::open(['route'=>['products.update',$product->id],'files'=>true,'method'=>'PUT'])}}
            @csrf

            @if(@isset($listType))
                <div class="form-group">
                    <label for="id_type">Tên Loại Sản Phẩm:</label>
                    <select class="form-control" name="id_type">
                        @foreach ($listType as $item)
                    <option value="{{$item->id}}" {{old('id_type',$product->id_type)==$item->id? 'selected':null }}>{{$item->name}}</option>
                        @endforeach
                    </select>
                </div>
            @endisset

            <div class="form-group">
                <label for="name">Tên Sản Phẩm:</label>
                <input type="text" class="form-control" placeholder="Name Products" name="name" value="{{old("name",$product ? $product->name:null)}}">
            </div>
    
            
            <div class="form-group">
                <label for="description">Mô Tả:</label>
                <input type="text" class="form-control" placeholder="Description" name="description" value="{{old('description',$product?$product->description:null)}}">
            </div>
    
            <div class="form-group">
                <label for="description">Giá sản phẩm:</label>
                <input type="number" class="form-control" placeholder="Unit Price" name="unit_price" value="{{old("unit_price",$product ? $product->unit_price:null)}}">
            </div>

            <div class="form-group">
                <label for="description">Giá khuyến mại:</label>
                <input type="number" class="form-control" placeholder="Promotion Price" name="promotion_price" value="{{old("promotion_price",$product ? $product->promotion_price:null)}}" >
            </div>
            <div class="form-group">
                <h5>Change image</h5>
                <input type="checkbox" id="changeImage" name="changeImg">
            </div>
            <div class="form-group">
                <label for="image">Ảnh:</label>
                <input type="file" class="form-control" name="image" id='img' disabled>
            </div>
        
            <div class="form-group">
                <label for="unit">Đơn vị:</label>
                <input type="text" class="form-control" placeholder="Unit" name="unit" value="{{old("unit",$product ? $product->unit:null)}}">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Edit</button>
            </div>
        {{Form::close()}}
    </div>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>

        $("#changeImage").click(function(){
            if($(this).prop("checked") == true){
                $('#img').prop("disabled", false);
            }
            else if($(this).prop("checked") == false){
                $('#img').prop("disabled", true);
            }
        });
   
    </script>
</body>
</html>