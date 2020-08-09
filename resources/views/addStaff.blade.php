<?php
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Staff</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-success btn-block" href="{{route('home')}}">Home</a>
    <form action="{{route('staff.store')}}" method="POST">
            @csrf
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" placeholder="Name" name="name" >
            </div>
    
            
            <div class="form-group">
                <label for="description">Address:</label>
                <input type="text" class="form-control" placeholder="Address" name="address" >
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select name="gender" >
                    <option value="m" >Male</option>
                    <option value="f" >Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="number" class="form-control" step="0.01" placeholder="Salary" name="salary" >
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" placeholder="Email" name="email"  >
            </div>
        
            <div class="form-group">
                <label for="work">Work:</label>
                <input type="text" class="form-control" placeholder="Work" name="work" >
            </div>
            <div class="form-group">
                <label for="birthday">Birthday:</label>
                <input type="date" class="form-control" placeholder="" name="birthday" >
            </div>
            <div class="form-group">
                <label for="identity_card">Indentity Card:</label>
                <input type="text" class="form-control" placeholder="Identity Card" name="identity_card">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Add</button>
            </div>
       </form>
    </div>
</body>
</html>