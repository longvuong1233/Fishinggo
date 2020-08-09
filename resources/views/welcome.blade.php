
@extends('layouts.layout')

@section('content')
    <div v-if="getShowProduct==false">
        <div id="list_product" >
            <div v-if='ajax==false'>
                <div class="row">
                    @if(isset($name))
                        @foreach ($list as $item)
                            <div class="col-sm-4">
                                <div class="product-image-wrapper rounded-lg" style="height:380px; width:298px; box-sizing: border-box;">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <div class="img-product">
                                            <a @click="callAjax({{$item->id}})"><img src="../..{{$item->image}}"  alt="img" class="rounded-circle transition-img"></a>
                                            </div>
                                            @if(isset($item->unit_price))
                                                <div class="">
                                                    <h2>{{$item->unit_price}}.000</h2>
                                                    <p class="text-body bg-info" style=""><b>{{$item->name}}</b></p>
                                                </div>
                                                <div id="" >
                                                    
                                                    <div class="button" >
                                                        
                                                        <a  href="#" class="btn btn-success add-to-cart" @click='add({{$item->id}},1)'><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                        
                                                    </div>
                                                </div>
                                            @else
                                            <p><h3>{{$item->name}}</h3></p>
                                            @endif
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @endif
                </div>
                    <div class="col-12 d-flex justify-content-center">
                        {{$list->links()}}
                    </div>
            </div>
            <div v-else id="paginationProduct">
                <div class="row">
                    <div class="col-sm-4" v-for='(item,index) in list'>
                        <div class="product-image-wrapper rounded-lg" style="height:380px; width:298px; box-sizing: border-box;">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <div class="img-product">
                                    <a @click=" routeShowProduct(item['id'])"  ><img :src="item['image']"  alt="img" class="rounded-circle transition-img"></a>
                                    </div>
                                    <div class="">  
                                        <h2>@{{item['unit_price']}}.000</h2>
                                        <p class="text-body bg-info" style=""><b>@{{item['name']}}</b></p>
                                    </div>
                                    <div id="" >
                                        
                                        <div class="button" >
                                            
                                            <a  href="#" class="btn btn-success add-to-cart" @click="add(item['id'],1)"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                            
                                        </div>
                                    </div>
                                    
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 d-flex justify-content-center" style="">
                      <pagination-component  
                        :total-pages=row
                        :current-page="currentPage"
                        @pagechanged="onPageChange">
                    </pagination-component>
                    
                </div>
            </div>
        </div>
    </div>
    <div v-else>
        <div class="row content-row mb-0">
            <div class="product-gallery col large-6">      
                <div class="card" style="width:400px">
                    <img class="card-img-top" :src="product['image']" alt="Card image">
                    <div class="card-body bg-warning">
                        <h4 class="card-title">@{{product['name']}}</h4>
                        <p class="card-text">
                            @{{product['description']}}
                        </p>
                    </div>
                </div>
            </div>
            <div class="product-info summary col-fit col entry-summary product-summary">
                <h1 class="text-center">@{{product['name']}}</h1>
                <hr>    
                <div class="is-divider small"></div>
                <div class="price-wrapper ">
                    <p class="price product-page-price ">
                    <span class="woocommerce-Price-amount amount" style="font-size:20px">@{{product['unit_price']}},000<span class="woocommerce-Price-currencySymbol">₫</span></span></p>
                </div>   
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input step="1" type="number"  v-model='quantity' data-decimals="0" min="0" max="360"/>
                    <button class="btn btn-success " @click="add(product['id'],quantity)"> Add Cart </button>
                </div>
                <hr>
            </div>
        </div> 
    </div>
    
    
       
        
    
@endsection



<style>
    
    
    html,body{
        max-width: 100%;
        overflow-x: hidden;
    }
    .single-products {
        position: relative;
    }
    .product-image-wrapper {
        border: 2px groove #c0c0c0;
        overflow: hidden;
        margin-bottom:30px;
        margin-top: 30px;
        padding: 50px;
       
    }
    .img-product{
        cursor: pointer;
    }
    .transition-img{
        height:150px; 
        width:200px;
        transition: width 2s, height 2s, transform 1s
    }
    .transition-img:hover {

        transform: rotate(360deg);
    }
    nav{
        clear: both;
    }
   
    
</style>