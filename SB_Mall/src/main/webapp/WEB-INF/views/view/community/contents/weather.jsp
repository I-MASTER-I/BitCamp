<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>날씨</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons-wind.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons-wind.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/weather-icons/css/weather-icons.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/weather.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="commonBannerBox">
		<h3 class="rowdCommonBannerH3">날씨정보</h3>
	</div>
	
<!-- 	전체를 감싸는 컨테이너	 -->
	<div id="container-all">
	
		<div id="container-top">
		
			 <div class="leftBox">
				<div class= "leftBoxT">
					<i id="icon" class="wi" style= "color : #ffc828"></i> 
				</div>
				<div class="leftBoxB">
					<span>
						<span id="temperature"></span>
						<span class="c">C&deg</span>
					</span>
				</div>											
            <!-- leftBox의 끝 -->
			</div>
			<div class="rightBox">
				<div class="rightBoxT">
				<p id="city"></p>
				<p id="weather"></p>
				<!-- rightBoxT의 끝 --> 			
				</div>
				<div class="rightBoxB">
					<div class="xbox">
						<p>풍속</p>					
						<p>습도</p>
						<p>강수확률</p>					
					</div>
					<div class="xbox2">
						<p id="knots"></p>
						<p id="humidity"></p>
						<p id="clouds"></p>
					</div>
				<!-- rightBoxB의 끝 --> 			
				</div>
			<!-- rightBox의끝 -->
			</div>
		
		<!-- container-top의 끝 -->
		</div>
		
		
		<div id="container-bottom">
			<div id="container-bottomB">
		 	   <div id="city0" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city1" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city2" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city3" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city4" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city5" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city6" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city7" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city8" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city9" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city10" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city11" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city12" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi " style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city13" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
				<div id="city14" class ="weahtherBox">
					<div class="sBoxT">
						<div class="leftsBox">
						<i class="weathericon wi" style= "color : #ffc828"></i>
						</div>					
						<div class="rightsBox">
							<div class="cityname">
							</div>
							<div class="weather">
							</div>
							<div class="temperature">
							</div>
						</div>					
					</div>
					<div class="sBoxB">
						<div class="knotwrap">
							<span>
							<i class="wi wi-strong-wind" style= "color : #ffc828"></i>
							</span>
							<span class="knot">
							</span>
						</div>
						<div class="humiditywrap">
							<span>
							<i class="wi wi-raindrop" style= "color : #ffc828"></i>
							</span>
							<span class="humidity">
							</span>
						</div>
						<div class="cloudswrap">
							<span>
							<i class="wi wi-rain" style= "color : #ffc828"></i>
							</span>
							<span class="clouds">
							</span>	
						
						</div>					
					</div>
					
				</div>
				<!-- weatherbox의끝 -->
			
			</div>
			<!-- container-bottomB의 끝 -->
		</div>
		<!-- container-bottom의 끝 -->
	<!-- container-all의 끝 -->
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	var weatherArray = new Array();

	weatherArray[0] = {
		"city" : "서울",
		"lon" : 127,
		"lat" : 37.583328,
	};
	weatherArray[1] = {
		"city" : "경기",
		"lon" : 127.25,
		"lat" : 37.599998,
	};
	weatherArray[2] = {
		"city" : "강원",
		"lon" : 128.25,
		"lat" : 37.75,
	};
	weatherArray[3] = {
		"city" : "충남",
		"lon" : 127,
		"lat" : 36.5,
	};
	weatherArray[4] = {
		"city" : "충북",
		"lon" : 128,
		"lat" : 36.75,
	};
	weatherArray[5] = {
		"city" : "전북",
		"lon" : 127.25,
		"lat" : 35.75,
	};
	weatherArray[6] = {
		"city" : "전남",
		"lon" : 127,
		"lat" : 34.75,
	};
	weatherArray[7] = {
		"city" : "경북",
		"lon" : 128.75,
		"lat" : 36.333328,
	};
	weatherArray[8] = {
		"city" : "경남",
		"lon" : 128.25,
		"lat" : 35.25,
	};
	weatherArray[9] = {
		"city" : "인천",
		"lon" : 126.416107,
		"lat" : 37.450001,
	};
	weatherArray[10] = {
		"city" : "대전",
		"lon" : 127.416672,
		"lat" : 36.333328,
	};
	weatherArray[11] = {
		"city" : "광주",
		"lon" : 126.916672,
		"lat" : 35.166672,
	};
	weatherArray[12] = {
		"city" : "울산",
		"lon" : 129.266663,
		"lat" : 35.566669,
	};
	weatherArray[13] = {
		"city" : "대구",
		"lon" : 128.550003,
		"lat" : 35.799999,
	};
	weatherArray[14] = {
		"city" : "부산",
		"lon" : 129.050003,
		"lat" : 35.133331,
	};
	
	//getLocation()을 실행한다.
	var updateInterval = setInterval(getLocation(), 300000);
	
	//현재 지역의 정보를 받아 getweather(위도와 경도를 받아 값을 반환하는 함수)을 실행한다.
	function getLocation() {
		if ("geolocation" in navigator) {
			navigator.geolocation.getCurrentPosition(function(position) {
				getWeather(position.coords.latitude, position.coords.longitude).done(dataHandler);
			},
			 function(failure) {
		        $.getJSON('https://ipinfo.io/geo', function(response) { 
		            var loc = response.loc.split(',');
		            var coords = {
		                latitude: loc[0],
		                longitude: loc[1]};
		            
		            getWeather(coords.latitude, coords.longitude).done(dataHandler);
		            
		            });  
		        }
			
			
		)} else {
			alert("geolocation not available");
		}
	}
	
	//위도와 경도를 받아 값을 반환한다.
	function getWeather(lat, lon, i) {
		var index = i;
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+ lat + "&lon=" + lon+ "&APPID=56c39f42568ae0dcb25c73fa6db6fc8f";

		return $.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "true",
					success : function(data) {
						//전국 지역 날씨 html에 값을 넣어준다.
						if (index >= 0) {

							$('#city'+ i).find('.cityname').html(weatherArray[index].city);
							$('#city'+ i).find('.weather').html(data.weather[0].main);
							$('#city'+ i).find('.knot').html((data.wind.speed * 1.9438445).toFixed(1));
							$('#city'+ i).find('.temperature').html((data.main.temp - 273.15).toFixed(1)+' C&deg');
							$('#city'+ i).find('.humidity').html(data.main.humidity+'%');
							$('#city'+ i).find('.clouds').html(data.clouds.all+'%');
							switch (data.weather[0].main) {
								  case 'Thunderstorm'  : $('#city'+ i).find('.weathericon').addClass('wi-thunderstorm'); break; 
								  case 'Drizzle'  : $('#city'+ i).find('.weathericon').addClass('wi-day-rain-mix'); break;
								  case 'Rain'  : $('#city'+ i).find('.weathericon').addClass('wi-rain'); break;
								  case 'Snow'  : $('#city'+ i).find('.weathericon').addClass('wi-snow'); break;
								  case 'Clear'  : $('#city'+ i).find('.weathericon').addClass('wi-day-sunny'); break;
								  case 'Clouds'  : $('#city'+ i).find('.weathericon').addClass('wi-cloudy'); break;
								  case 'Mist'  : $('#city'+ i).find('.weathericon').addClass('wi-fog'); break;
								  case 'Haze'  : $('#city'+ i).find('.weathericon').addClass('wi-day-haze'); break;
							}
							
						}
					}
				});
	}

	//getWeather 에서 받은 값을 변수에 넣고 현재 지역 날씨 html태그에 넣어준다.
	function dataHandler(data) {

		var city;
		var weather;
		var knots;
		var temperature;
		var humidity;
		var clouds;

		if (data.main.temp && data.name && data.sys) {

			//지역 
			city = data.name + ", " + data.sys.country;
			// 날씨 
			if (data.weather) {
				weather=data.weather[0].main;
			}
			//풍속 
			if (data.wind) {
				knots = (data.wind.speed * 1.9438445).toFixed(1);
			}
			//온도
			temperature = (data.main.temp - 273.15).toFixed(1);
			//습도			
			humidity = data.main.humidity;
			//구름
			clouds = data.clouds.all;		
		}
		
		$('#city').html(city);
		$('#weather').html(weather);
		$('#knots').html(knots);
		$('#temperature').html(temperature);
		$('#humidity').html(humidity+"%");
		$('#clouds').html(clouds+"%");
		switch (data.weather[0].main) {
		  case 'Thunderstorm'  : $('#icon').addClass('wi-thunderstorm'); break;
		  case 'Drizzle'  : $('#icon').addClass('wi-day-rain-mix'); break;
		  case 'Rain'  : $('#icon').addClass('wi-rain'); break;
		  case 'Snow'  : $('#icon').addClass('wi-snow'); break;
		  case 'Clear'  : $('#icon').addClass('wi-day-sunny'); break;
		  case 'Clouds'  : $('#icon').addClass('wi-cloudy'); break;
		  case 'Mist'  : $('#icon').addClass('wi-fog'); break;
		  case 'Haze'  : $('#icon').addClass('wi-day-haze'); break;
	}
		
	}
	
	
	//weatherArray의 위도와 경도를 getweater 함수에 넣어서 날씨 정보를 받은후 해당하는 div id를 찾아서 입력한다.(미완성)
	function kk() {
		for (var i = 0; i < weatherArray.length; i++) {
			var thisname = weatherArray[i].city;
			var thislon = weatherArray[i].lon;
			var thislat = weatherArray[i].lat;
			getWeather(thislat, thislon, i);
		}	
	}
	

	$(document).ready(function(){
		kk();
		
		//console.log(weatherArray)
	})

</script>

<!-- 							/* $('<div/>').attr({ -->
<!-- 								id:'weahtherBox'+i, -->
<!-- 								'class':'weahtherBox' -->
<!-- 							}).appendTo('#container-bottomB'); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								id:'city'+i -->
<!-- 							}).appendTo('#weahtherBox'+i); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'sBoxT' -->
<!-- 							}).appendTo('#city'+i); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'leftsBox' -->
<!-- 							}).appendTo('#city'+i+'>.sBoxT'); -->
							
<!-- 							$('<i/>').attr({ -->
<!-- 								'class':'wi' -->
<!-- 							}).appendTo('#city'+i+'>.sBoxT>.leftsBox'); -->
<!-- 							switch (data.weather[0].main) { -->
<!-- 								case 'Clouds': $('#city'+i+'>.sBoxT>.leftsBox i').attr('class','wi wi-cloud'); break; -->
<!-- 								case 'Rain': $('#city'+i+'>.sBoxT>.leftsBox i').attr('class','wi wi-rain'); break; -->
<!-- 							} -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'rightsBox' -->
<!-- 							}).appendTo('#city'+i+'>.sBoxT'); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'sBoxB' -->
<!-- 							}).appendTo('#city'+i); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'cityname' -->
<!-- 							}).html(weatherArray[index].city).appendTo('#city'+i+'>.sBoxT>.rightsBox'); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'weather' -->
<!-- 							}).html(data.weather[0].main).appendTo('#city'+i+'>.sBoxT>.rightsBox'); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'knots' -->
<!-- 							}).html((data.wind.speed * 1.9438445).toFixed(1)).appendTo('#city'+i+'>.sBoxB'); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'temperature' -->
<!-- 							}).html((data.main.temp - 273.15).toFixed(1)).appendTo('#city'+i+'>.sBoxT>.rightsBox'); -->
							
<!-- 							$('<div/>').attr({ -->
<!-- 								'class':'clouds' -->
<!-- 							}).html(data.clouds.all).appendTo('#city'+i+'>.sBoxB'); */ -->
<!-- 							/* switch (data.weather[0].description) { -->
<!-- 							  case 'light snow'  : document.write('A 라는 문자입니다.<br />'); break; -->
<!-- 							  case 'light rain' : document.write('똠 이라는 문자입니다.<br />'); break; -->
<!-- 							  case '7'  : document.write('7 이라는 문자입니다.<br />'); break; -->
<!-- 							  default   : document.write('해당되는 문자가 없습니다.<br />'); break; -->
<!-- 							} */ -->

</html>
