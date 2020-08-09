<?php
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Type Products</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
  {!! Form::open(['route'=>['typeproduct.update', $typeProduct->id], 'method'=>'PUT', 'files'=>true]) !!}
            @csrf
            <div class="form-group">
                <label for="name">Tên Loại Sản Phẩm:</label>
            <input type="text" class="form-control" placeholder="Nhập Không Dấu" name="name" value="{{old('name',$typeProduct?$typeProduct->name:null)}}">
            </div>
    
            <div class="form-group">
                <label for="description">Mô Tả:</label>
            <input type="text" class="form-control" placeholder="Description" name="description" value="{{old('description',$typeProduct?$typeProduct->description:null)}}">
            </div>
            <div class="form-group">
                <h5>Change image</h5>
                <input type="checkbox" id="changeImage" name="changeImg" >
            </div>
            <div class="form-group">
                <label for="image">Ảnh:</label>
                <input disabled type="file" class="form-control" placeholder="Type Products" name="image" id="img">
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Edit</button>
            </div>
        </form>
    </div>
    <script>
        
    </script>
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