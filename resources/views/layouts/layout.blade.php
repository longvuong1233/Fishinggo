<?php 

use App\Products;
   $products =  Products::all();

?>
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>FISHINGGO</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/css/app.css">

        <!-- Styles -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
        
    </head>
    <body>
         <div id = "particles"  style="position:fixed;left: 0px;top: 0px; z-index:-1; overflow-y:hidden" >
            <link rel="stylesheet" href="/img/background2/style.css"/>
            <section  style="background-image:url('../../../img/background/1755.jpg')">
                <div >
                    <img src="/img/background2/fish1.png" class="fish fish1">
                    <img src="/img/background2/fish2.png" class="fish fish2">
                    <img src="/img/background2/seahorseGroup.png" class="seahorse">
                    <img src="/img/background2/fish3.png" class="fish fish3">
                    <img src="/img/background2/fish4.png" class="fish fish4">
                    <img src="/img/background2/fish5.png" class="fish fish5">
                    <img src="/img/background2/fish6.png" class="fish fish6">
                    <img src="/img/background2/diver.png" class="diver">
                    <img src="/img/background2/turtle.png" class="fish turtle">
                </div>
            </section>
         
            <script  src="/img/background2/particles.js"></script>
            <script src="/img/background2/app.js"></script>
        </div>
        
       <div id="app">
           <div class="" ref="app">
              
           <menu-component route="{{route('findOrder')}}"><p slot='csrf'>@csrf</p></menu-component>
               
            </div>
       
      
        <div class=" container">
        <item-component :list='{!!json_encode($products) !!}' route="{{route('confirm')}}" :sesstion='deleteSession'><p slot='csrf'>@csrf</p></item-component>
        </div>
        

        <div >
            <div class="py-4 container" >
                @yield('content')
            </div>
        </div>
        <hr>
    </div>
     <div class="text-center">  
		<p>Copyright &copy;Images are copyrighted shopthuysinh.com</p>
    </div>
        <script src="/js/app.js"></script>
    </body>
    <style>
        body{
            /* background-image: url('../../../img/background/1755.jpg') */
        }
    </style>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>
(function() {
  $(".cart").on("click", function() {
    $(".shopping-cart").fadeToggle("fast");
  });
})();
</script>
</html>