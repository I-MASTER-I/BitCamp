<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1,maximum-scale=1, user-scalable=no" />
    
<!-- <div id="headerBanner">

</div>
<div id="BannerTextBox">
	<div id="BannerText01">
		<h1 class="fontOpenSans BT_h1">SB COMPANY</h1>	
	</div>
	
	<div id="BannerText02">
		<h4 class="fontOpenSans BT_h4">
		Small electric vehicles from foldable bikes<br>
		and scooters to unicycles and hoverboards<br>
		are becoming more popular as "last mile"<br>
		tansportation
		
		</h4>
	</div>
</div> -->


<script>
	
	window.onload=function(){
		var x = screen.width;
		
		var img = document.getElementsByClassName("headerBannerImg");
		
		for (var i = 0; i < img.length; i++) {
			img[i].style.width=x;
			
		}
		/* var time = ${serverTime};
		alert(time); */

		
	/* 	alert("z"); */
	}


</script>



<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <!-- <li data-target="#demo" data-slide-to="3"></li> -->
  </ul>
  
  
  <div class="carousel-inner">
  
  
    <div class="carousel-item active">
      <img src="<%=request.getContextPath()%>/img/xiaomi01.png" alt="Los Angeles" class="headerBannerImg">
      <div class="BannerDiv01">
     	 <div class="BannerDiv01_inner">
	        <h3 class="Banner01_h3">Xiaomi</h3>
	        <h4 class="Banner01_h4">Foldable Electric Scooter</h4>
	        <div class="BuyItNowBox">
	        	<a href="<%=request.getContextPath() %>/store/board/13" class="HomeBannerBuyItNow">Buy it now</a>
	        </div>
        </div>
      </div>   
    </div>
    
    
    <div class="carousel-item">
   	  <a href="http://localhost:8889/mall/store/board/10">
      	<img src="<%=request.getContextPath()%>/img/xiaomi05.png" alt="Chicago" class="headerBannerImg">
      </a>
      <div class="BannerDiv02">
      	<div  class="BannerDiv02_inner">
	        <h3 class="Banner02_h3">Xiaomi Segway</h3>
	        <h4 class="Banner02_h4">샤오미 나인봇 Ninebot</h4>
	        <div class="BannerDiv02_Detail">
	        	<h5 class="Banner02_h5">제품무게 : </h5><h2 class="Banner02_h2"> 13.5</h2><h3 class="Banner02_h3_2">kg</h3>
	        </div>
	        <div class="BannerDiv02_Detail">
	        	<h5 class="Banner02_h5">최대속도 : </h5><h2 class="Banner02_h2"> 20</h2><h3 class="Banner02_h3_2">km/h</h3>
	        </div>
	        <div class="BannerDiv02_Detail lastDetail">
	        	<h5 class="Banner02_h5">주행거리 : </h5><h2 class="Banner02_h2"> 50</h2><h3 class="Banner02_h3_2">km</h3>
	        </div>
	        <p class="MiniDetail">- 본 상품은 자사와 단독 계약으로 판매중입니다.</p>
	        <p class="MiniDetail">- 본 상품은 인기품목으로 조기품절 될 수 있습니다.</p>
        </div>
      </div>   
    </div>
    
    
    <div class="carousel-item">
      <img src="<%=request.getContextPath()%>/img/headerBanner45.png" alt="New York" class="headerBannerImg">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>   
    </div>
    
    
  </div>
  
  
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>