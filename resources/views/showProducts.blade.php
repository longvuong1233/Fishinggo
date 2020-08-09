@extends('layouts.layout')

@section('content')
    @if(isset($item))
      <div class="row content-row mb-0">
        <div class="product-gallery col large-6">      
          <div class="card" style="width:400px">
            <img class="card-img-top" src="../..{{$item->image}}" alt="Card image">
            <div class="card-body bg-warning">
              <h4 class="card-title">{{$item->name}}</h4>
              <p class="card-text">
                {{$item->description}}
              </p>
            </div>
          </div>
        </div>
        <div class="product-info summary col-fit col entry-summary product-summary">
          <h1 class="text-center">{{$item->name}}</h1>
          <hr>    
          <div class="is-divider small"></div>
          <div class="price-wrapper ">
            <p class="price product-page-price ">
            <span class="woocommerce-Price-amount amount" style="font-size:20px">{{$item->unit_price}},000<span class="woocommerce-Price-currencySymbol">₫</span></span></p>
          </div>   
          <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input step="1" type="number"  v-model='quantity' data-decimals="0" min="0" max="360"/>
            <button class="btn btn-success " @click='add({{$item->id}},quantity)'> Add Cart </button>
          </div>
          <hr>
        </div>
      </div> 
    @endif
    
@endsection