<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 중단 당일 통계 리포트-->
<div id="mainMid">
	<div id="dashbord" class="testBorder">
		<ul>
			<li class="statTopReport">
				<div class="utitle fon13">오늘 가입자</div> <strong class="uresult">${memberStatVO.dayCount}</strong>
				<c:choose>
					<c:when test="${today}">
						<span class="fon12">${newDate}&nbsp&nbsp&nbsp${nowTimeSec} 기준</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="statTopReport uitem testBorder" >
				<div class="utitle">월간 가입자</div> <strong class="uresult">${memberStatVO.monthCount}</strong>
				<c:choose>
					<c:when test="${today}">
						<span class="fon12">${newDate}&nbsp&nbsp&nbsp${nowTimeSec} 기준</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</li>
			<li class="statTopReport uitem">
				<div class="utitle">연간 가입자</div> <strong class="uresult">${memberStatVO.yearCount}</strong>
				<c:choose>
					<c:when test="${today}">
						<span class="fon12">${newDate}&nbsp&nbsp&nbsp${nowTimeSec} 기준</span>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</div>
	<!-- mainMid의 끝 -->
</div>

<!-- 하단 그래프 삽입-->
<div id="mainBottom">

	<div id="component">
		<ul>
			<li id="memberTotal" class="umenu uactive">회원 통계</li>
			<li id="fifthJoin" class="umenu">최근</li>
			<li id="monthlyJoin" class="umenu">월별</li>
		</ul>
	</div>
	
	<div id="chartwrap" style="display: none;"></div>
	<div id="chartwrap2">
		<div class="leftchart" >
			<div id="ageTotal"  class="testBorder"></div>
			<div id="genderTotal"  class="testBorder"></div>
		</div>
		<div id="countryTotal"  class="testBorder"></div>
	</div>

	<!-- salesReport의 끝 -->
</div>

<script type="text/javascript">

//component에 선택된 아이템을 색깔 변경해주는 것
function removeUactive(id){
	//클래스 제거
	$('.umenu').removeClass('uactive');
	//현재 페이지 메뉴에 css를 먹인다.
	$('#' + id).addClass('uactive');
}

function memberTotal(){
	
	//차트1 숨기고 차트2 보인다.
	$('#chartwrap').css('display', 'none');
	$('#chartwrap2').css('display', 'block');
	$('#ageTotal').html('');
	$('#genderTotal').html('');
	$('#countryTotal').html('');
	
	//페이지의 날짜
	var newDate = $( ".datepicker" ).val();
	
	//차트에 들어갈 데이터 - 컨트롤러에서 JSON 문자열로 받아서 파싱해서 자바스크립트 객체로 변환
	var memberTotal;
	var ageTotal;
	var genderTotal;
	var countryTotal;
	
	//ajax로 차트에 사용할 데이터를 가져온다.
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/adminStatistics/memberStat/loadMemberStatReport/memberTotal?nowDate=' + newDate,
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			memberTotal = JSON.parse(data);
			ageTotal = memberTotal.ageTotal; //연령별 통계
			genderTotal = memberTotal.genderTotal; //성별 통계
			countryTotal = memberTotal.countryTotal; //지역별 통계
			
			console.log(ageTotal);
			console.log(genderTotal);
			console.log(countryTotal);
			//ageTotal 차트를 그린다.
			var chart = jui.include("chart.builder");
			
			var max = ageTotal[0].max;

			if(max % 10 != 0){
			   var m = 10-(max % 10);
			   max += m;
			}
			
			chart("#ageTotal", {
				
			  width : 350,
			  height : 360,
			  padding : {
				 top: 30,
				 bottom : -20,
				 right : 30,
				 left : 30
			  },
			  style :{
			    titleFontSize : 13,
			    titleFontWeight : 700,
			    titleFontColor : "#505050"
			  },
			    axis : {
			        c : {
			            type : "radar",
			            domain : "age",
			           max : max
			        },
			        data : ageTotal
			    },
			    brush : {
			        type : "path",
			        target : [ "count" ],
			      colors : ["#ffc828"]
			    },
					widget : [{type : "title",   orient : "top",  text : "연령별 통계" 
			    }]
				
			});
			
			//genderTotal 차트를 그린다.
			var chart = jui.include("chart.builder");
			
			chart("#genderTotal", {
				
				 padding :30,
				    width: 395,
				    height : 350,
				    theme : "gradient",
				    padding : {
				    	top : 40
				    },
				    axis : {
				        data : [ genderTotal ]
				    },
				    brush : {
				        type : "donut",
				        showText : "inside",
				        colors : [ 6,2 ],
				        format : function(k, v) {
				            return v + "명";
				        },
				      size : 50,
				    },
				  widget : [{type : "title",   orient : "top",  text : "성별 통계" 
				    }, {
				        type : "tooltip",
				        orient : "left",
				        format : function(data, k) {
				            return {
				                key: [k],
				                value: data[k]
				            }
				        }
				    }, {
				        type : "legend",
				      orient : "bottom"
				    }],
				  style : {
				  	 titleFontSize : 13,
				     titleFontWeight : 700,
					 titleFontColor : "#505050",
				     pieInnerFontSize: 12,
				   // pieInnerFontColor: '#f0f0f0'
					}
			});
			
			//countryTotal 차트를 그린다.
			var chart = jui.include("chart.builder");
			
			chart("#countryTotal", {
				
				    width : 389,
		            height : 750,
		   		    padding : {
		     		   top :  50,
		     		   left : 0,
		     		   right : 0,
		     		   bottom : 0
		    	   },
			   	 style :{
					    titleFontSize : 13,
					    titleFontWeight : 700,
					    titleFontColor : "#505050",
		    	        mapSelectorHoverColor: "#505050",
		    	        mapPathBorderColor: "#282828",
		                mapPathBackgroundColor: "#ffffff",
		                mapSelectorActiveColor: "#ffc828"
// 		           		fontFamily: "noto sans, sans-serif",
// 		                backgroundColor: "#ffc828",
// 		                mapPathBackgroundColor: "rgb(255,229,149)",
// 		                mapPathBorderColor: "#ffcb2b",
// 		                mapPathBorderWidth: 0.5,
// 		                mapControlButtonColor: "#ffcb2b",
// 		                mapSelectorHoverColor: "rgb(255,255,255)",
// 		                mapSelectorActiveColor: "rgb(242,140,8)",
// 		                mapMinimapPathBackgroundColor: "#fff",
// 		                mapMinimapPathBackgroundOpacity: 1,
// 		                mapMinimapDragBackgroundColor: "#BEAB1E",
// 		                mapMinimapDragBorderColor: "#A88007"
					  },
		            axis : [{
		                map : {
		                    path : "<%=request.getContextPath()%>/chart/img/map/korea-500x650.svg",
		                    width : 500,
		                    height : 650
		                },
		                data : countryTotal
		            }],
		            brush : [{
		                type : "map.bubble",
		                colors : function(d) {
		                    if(d.value > 20) {
		                        return "linear(top) #ff686c,0.9 #fa5559";
		                    } else if(d.value > 5) {
		                        return "linear(top) #ff9d46,0.9 #ff7800";
		                    }

		                    return "linear(top) #9694e0,0.9 #7977C2";
		                }
		            }, {
		                type : "map.selector",
		                activeEvent : "map.click"
		            }],
		      widget : {type : "title",   orient : "top",  text : "지역별 통계" }
			});
		}
	});
}

function fifthJoin(){
	
	//차트2 숨기고 차트1 보인다.
	$('#chartwrap').css('display', 'block');
	$('#chartwrap2').css('display', 'none');
	$('#chartwrap').html('');
	
	//페이지의 날짜
	var newDate = $( ".datepicker" ).val();
	
	//차트에 들어갈 데이터 - 컨트롤러에서 JSON 문자열로 받아서 파싱해서 자바스크립트 객체로 변환
	var fifthJoin;
	
	//ajax로 차트에 사용할 데이터를 가져온다.
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/adminStatistics/memberStat/loadMemberStatReport/fifthJoin?nowDate=' + newDate,
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			fifthJoin = JSON.parse(data);
			
			//차트를 그린다.
			var chart = jui.include("chart.builder");
			
			chart("#chartwrap", {
			    axis : {
			        x : {
			            type : "fullblock",
			            domain : "regDate",
			            line : true,
			            textRotate : -30
			        },
			        y : {
			            type : "range",
			            domain : "count",
			            step : 10
			        },
			        data : fifthJoin
			    },
			    brush : [{
			        type : "line",
			        animate : true
			    }, {
			        type : "scatter",
			        hide : true
			    }],
			    widget : [
			    	{ type : "title", text : "최근 15일간 가입자 통계" },
// 			    	{ type : "legend" },
			        { type : "tooltip", brush : 1 }
			    ]
			});
		}
	});
	
}

function monthlyJoin(){
	
	//차트2 숨기고 차트1 보인다.
	$('#chartwrap').css('display', 'block');
	$('#chartwrap2').css('display', 'none');
	$('#chartwrap').html('');
	
	//페이지의 날짜
	var newDate = $( ".datepicker" ).val();
	
	//차트에 들어갈 데이터 - 컨트롤러에서 JSON 문자열로 받아서 파싱해서 자바스크립트 객체로 변환
	var monthlyJoin;
	
	//ajax로 차트에 사용할 데이터를 가져온다.
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/adminStatistics/memberStat/loadMemberStatReport/monthlyJoin?nowDate=' + newDate,
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			
			monthlyJoin = JSON.parse(data);
			
			//차트를 그린다.
			var chart = jui.include("chart.builder");
			
			chart("#chartwrap", {
			    axis : {
			        x : {
			            type : "fullblock",
			            domain : "regMonth",
			            line : true,
			            textRotate : -30
			        },
			        y : {
			            type : "range",
			            domain : "count",
			            step : 10
			        },
			        data : monthlyJoin
			    },
			    brush : [{
			        type : "line",
			        animate : true
			    }, {
			        type : "scatter",
			        hide : true
			    }],
			    widget : [
			    	{ type : "title", text : "월별 가입자 통계" },
// 			    	{ type : "legend" },
			        { type : "tooltip", brush : 1 }
			    ]
			});
		}
	});
}

$(document).ready(function(){
	
	// 	chartSelect가 false면 기본 차트를 불러온다
	if(!chartSelect){
		chartSelect = true;
		memberTotal();
	} else {
		removeUactive(thisId);

		switch(thisId){
		case 'memberTotal' : memberTotal();
			break;
		case 'fifthJoin' : fifthJoin();
			break;	
		case 'monthlyJoin' : monthlyJoin();
			break;
		}
	}
	
	
	$('.umenu').on('click', function () {
		
		thisId = $(this).attr('id');
		
		removeUactive(thisId);
		
		switch(thisId){
		case 'memberTotal' : memberTotal()
			break;
		case 'fifthJoin' : fifthJoin()
			break;	
		case 'monthlyJoin' : monthlyJoin()
			break;
		}
	});
	
});
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>
