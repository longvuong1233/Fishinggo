<?php
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create Products</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-success btn-block" href="{{route('products.index')}}">Products</a>
    <form action="{{route('products.store')}}" method="POST" enctype="multipart/form-data">
            @csrf

            @if(@isset($listType))
                <div class="form-group">
                    <label for="id_type">Tên Loại Sản Phẩm:</label>
                    <select class="form-control" name="id_type">
                        @foreach ($listType as $item)
                    <option value="{{$item->id}}">{{$item->name}}</option>
                        @endforeach
                    </select>
                </div>
            @endisset

            <div class="form-group">
                <label for="name">Tên Sản Phẩm:</label>
                <input type="text" class="form-control" placeholder="Name Products" name="name">
            </div>
    
            
            <div class="form-group">
                <label for="description">Mô Tả:</label>
                <input type="text" class="form-control" placeholder="Description" name="description">
            </div>
    
            <div class="form-group">
                <label for="description">Giá sản phẩm:</label>
                <input type="number" class="form-control" placeholder="Unit Price" name="unit_price">
            </div>

            <div class="form-group">
                <label for="description">Giá khuyến mại:</label>
                <input type="number" class="form-control" placeholder="Promotion Price" name="promotion_price">
            </div>

            <div class="form-group">
                <label for="image">Ảnh:</label>
                <input type="file" class="form-control" placeholder="Type Products" name="image">
            </div>

            <div class="form-group">
                <label for="description">Đơn vị:</label>
                <input type="text" class="form-control" placeholder="Unit" name="unit">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Submit</button>
            </div>
        </form>
    </div>
    <script>
        
    </script>
</body>
</html>