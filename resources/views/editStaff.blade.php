<?php
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Staff</title>
    
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-success btn-block" href="{{route('staff.index')}}">Staff</a>
    {{Form::open(['route'=>['staff.update',$staff->id],'method'=>'PUT'])}}
            @csrf

           

            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" placeholder="Name" name="name" value="{{old("name",$staff ? $staff->name:null)}}">
            </div>
    
            
            <div class="form-group">
                <label for="description">Address:</label>
                <input type="text" class="form-control" placeholder="Address" name="address" value="{{old('address',$staff?$staff->address:null)}}">
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select name="gender" >
                    <option value="m" {{old('gender',$staff->gender=='m'?'selected':null)}}>Male</option>
                    <option value="f"  {{old('gender',$staff->gender=='f'?'selected':null)}}>Female</option>
                </select>
            </div>
            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="number" class="form-control" step="0.01" placeholder="Salary" name="salary" value="{{old("salary",$staff ? $staff->salary:null)}}">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" placeholder="Email" name="email" value="{{old("email",$staff ? $staff->email:null)}}" >
            </div>
        
            <div class="form-group">
                <label for="work">Work:</label>
                <input type="text" class="form-control" placeholder="Work" name="work" value="{{old("work",$staff ? $staff->work:null)}}">
            </div>
            <div class="form-group">
                <label for="birthday">Birthday:</label>
                <input type="date" class="form-control" placeholder="" name="birthday" value="{{old("birthday",$staff ? $staff->birthday:null)}}">
            </div>
            <div class="form-group">
                <label for="identity_card">Indentity Card:</label>
                <input type="text" class="form-control" placeholder="Identity Card" name="identity_card" value="{{old("identity_card",$staff ? $staff->identity_card:null)}}">
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" name="submit">Edit</button>
            </div>
        {{Form::close()}}
    </div>
</body>
</html>