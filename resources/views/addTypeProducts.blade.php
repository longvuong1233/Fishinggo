<?php
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create Type Products</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
         <a class="btn btn-success btn-block" href="{{route('typeproduct.index')}}">Type Product</a>
    <form action="{{route('typeproduct.store')}}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label for="name">Tên Loại Sản Phẩm:</label>
                <input type="text" class="form-control" placeholder="Name" name="name">
            </div>
    
            <div class="form-group">
                <label for="description">Mô Tả:</label>
                <input type="text" class="form-control" placeholder="Description" name="description">
            </div>
    
            <div class="form-group">
                <label for="image">Ảnh:</label>
                <input type="file" class="form-control" placeholder="Type Products" name="image">
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