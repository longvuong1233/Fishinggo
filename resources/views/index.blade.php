@extends('layouts.layout')

@section('content')
<div id="demo" class="carousel slide " data-ride="carousel">

    <!-- Indicators -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li>
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
      <li data-target="#demo" data-slide-to="3"></li>
    </ul>
    
    <!-- The slideshow -->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="../../img/background/top1.jpg" alt="Nga" width="1100" height="500">
        <div class="carousel-caption">
            <h3>Russia</h3>
            <p>The winning work at IAPLC 2010 is "Huong Rung".</p>
          </div>
      </div>
      <div class="carousel-item">
        <img src="../../img/background/top2.jpg" alt="Macao" width="1100" height="500">
        <div class="carousel-caption">
            <h3>Macao</h3>
            <p>
                The aquarium, called "Loess Plateau" by Zhang Jian Feng from Macao, won the Gold Prize of the competition</p>
          </div>
      </div>
      <div class="carousel-item">
        <img src="../../img/background/top3.jpg" alt="Việt Nam" width="1100" height="500">
        <div class="carousel-caption">
            <h3>Viet Nam</h3>
            <p>Contestant Xuan Thuy Nguyen Thi of Vietnam was honored to receive the Silver Award for her work "Colors of Life".</p>
          </div>
      </div>
      <div class="carousel-item">
        <img src="../../img/background/top4.jpg" alt="Nhật Bản" width="1100" height="500">
        <div class="carousel-caption">
            <h3>Japan</h3>
            <p>Silver Award - Yutaka Kanno "Vision"</p>
          </div>
      </div>
    </div>
    
    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon"></span>
    </a>
  </div>
@endsection