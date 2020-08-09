<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Staff</title>
    <link rel="stylesheet" type="text/css" href="/css/app.css">
</head>
<body>
    <div class="container">
        <a class="btn btn-danger btn-block mt-3" href="{{route('home')}}">Home</a>
        <a class="btn btn-success btn-block" href="{{route('staff.create')}}">Add Staff</a>
        @if(isset($list))
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Salary</th>
                    <th scope="col">Work</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Indentity Card</th>
                    <th scope="col">Created At</th>
                    <th scope="col">Updated At</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    @foreach ($list as $person)
                        <tr>
                        <th scope="row">{{$person->id}}</th>
                        <td>{{$person->name}}</td>
                            <td>{{$person->gender}}</td>
                            <td>{{$person->email}}</td>
                           
                            <td>{{$person->address}}</td>
                            <td>{{$person->salary}}</td>
                            <td>{{$person->work}}</td>
                            <td>{{$person->birthday}}</td>
                            <td>{{$person->indentity_card}}</td>
                            <td>{{$person->created_at}}</td>
                            <td>{{$person->updated_at}}</td>
                            <td>
                                <div class="btn-group btn-group-sm  ">
                                <a type="button" class="btn btn-primary " href="{{route('staff.edit',$person->id)}}">Edit</a>
                                {{Form::open(['route'=>['staff.destroy',$person->id], 'method'=>'DELETE'])}}
                                    <button type="submit" class="btn btn-warning" >Delete</button>
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