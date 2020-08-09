@extends('layouts.layout')

@section('content')
    @if(isset($billDetail))
    <div v-if='reportOrder' class="contaier">
        <div class="alert alert-success alert-dismissible" style="position:relative; z-index:3; ">
            <button type="button" class="close" @click='reportOrder=false'>&times;</button>
        <deleteorder-component :customer='{!!json_encode($customer)!!}' route='{{route('cancelOrder.store')}}' :id_bill='{{$bill->id}}'><p slot='csrf'>@csrf</p></deleteorder-component>
        </div>
    </div>
        <div>
            <h3 class="text-center">Tên Khách Hàng: {{$customer->name}}</h3>
        </div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Created_At</th>
                <th>Image</th>
            </tr>
            </thead>
            <tbody>
                @for($i =0;$i<count($products);$i++)
                    <tr>
                        <td>{{$products[$i]['name']}}</td>
                        <td>{{$billDetail[$i]['quantity']}}</td>
                        <td>{{$billDetail[$i]['quantity'] *$billDetail[$i]['unit_price']}},000</td>
                        <td>{{$billDetail[$i]['created_at']}}</td>
                    <td><img src="{{$products[$i]['image']}}" alt="img" style="width:50px"></td>
                    </tr>
                @endfor
            </tbody>
        </table>
    <div class="row">
        <h4 class="text-center col-6 offset-3">Total: {{$bill->total}},000</h4>
        <button class="btn btn-danger col-1 offset-2" @click='reportOrder=!reportOrder'>Delete</button>
    </div>
    
    @endif
    
@endsection