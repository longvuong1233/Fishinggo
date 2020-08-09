@extends('layouts.app')

@section('content')

<div class="container">

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Menu</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="container offset-2">
                      <div class="btn-group btn-group-lg">
                          @if($level==1 || $level==5)
                            <a type="button" class="btn btn-primary" href="{{route('products.index')}}">Products</a>
                            <a type="button" class="btn btn-danger" href="{{route('typeproduct.index')}}">Type Product</a>
                            @endif
                            @if($level==1||$level==3)
                            <a type="button" class="btn btn-success" href="{{route('bill.index')}}">Orders</a>
                            @endif
                            @if($level==1)
                            <a type="button" class="btn btn-warning" href="{{route('user.index')}}">User</a>
                            @endif
                            @if($level==4 ||$level==1)
                            <a type="button" class="btn btn-dark" href="{{route('staff.index')}}">Staff</a>
                            @endif
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
