<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<!--화면 높이를 가져오기 위해 필수로 추가-->
 <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, minimum-scale=1,maximum-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

   	<!-- Basic style components -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui/dist/ui-jennifer.min.css" />

<!-- Grid style components -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/jui/jui-grid/dist/grid-jennifer.min.css" />

<!-- Required script files -->
<script src="<%=request.getContextPath()%>/jui/jui/lib/jquery-1.8.0.min.js"></script>
<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>

<!-- Basic script components -->
<script src="<%=request.getContextPath()%>/jui/jui/dist/ui.min.js"></script>

<!-- Grid script components -->
<script src="<%=request.getContextPath()%>/jui/jui-grid/dist/grid.min.js"></script>

<script src="<%=request.getContextPath()%>/jui/jui-core/dist/core.min.js"></script>
<script src="<%=request.getContextPath()%>/jui/jui-chart/dist/chart.js"></script>
	
<!-- datepicker -->
<!-- 	// jQuery UI CSS파일  -->
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   -->
<!-- <!-- // jQuery 기본 js파일 --> 
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
<!-- <!-- // jQuery UI 라이브러리 js파일 --> 
<!-- <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>   -->

<!-- monthpicker -->
<%-- <script src="<%=request.getContextPath()%>/monthpicker/js/jquery.mtz.monthpicker.js"></script>   --%>
<%-- <script src="<%=request.getContextPath()%>/monthpicker/js/jquery-1.11.1.min.js"></script>   --%>
<%-- <script src="<%=request.getContextPath()%>/monthpicker/js/jquery-ui.min.js"></script>   --%>

<!-- datetimepicker -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  type="text/css" /> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css"   type="text/css" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.10.6/moment.min.js" ></script>
<script src="https://cdn.jsdelivr.net/bootstrap.datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js" ></script>

<!-- 테이블 정렬 -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.tablesorter.min.js"></script> 
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/tablesorter.css" type="text/css">

<script>
//화면 크기 줄일 경우 높이를 다시 맞춰주는 함수
/* function resize(){
    var h = $(window).height();
    $('#leftContent').css({'height':(h-58)+'px'});
} */

//테이블 정렬
function addParser(){
	$.tablesorter.addParser({
	  id: 'NumberSort',
	  is:function(s){return false;},
	  format: function(s) {
		  return s.replace(/,/gi,'')
		  .replace(/원/,'');},
	  type: 'numeric'
	});
}

// $(".tablesorter").tablesorter(
// 		{
// 	    headers : {
// 	      0 : {sorter : false},
// 	      0 : {sorter : false},
// 	      9 : {sorter : 'NumberSort'},
// 	      10 : {sorter : 'NumberSort'},
// 	      11 : {sorter : 'NumberSort'},
// 	      12 : {sorter : 'NumberSort'}
// 	 	}
// 	}
// );

//input 태그를 클릭하면 텍스트 상자 전체선택된다.
function inputSel(){
$('.inputSel').on("focus", function(){
	    $(this).select();
	  });
}
inputSel();

//text타입의 input에서 엔터 누르면 포커스 아웃
function enterText(){
	$('input').keydown(function(key) {
		if (key.keyCode == 13) {
			$('input').blur();
		}
	});
}
enterText();

//text타입의 input에서 엔터 누르면 다음 input으로 포커스
function nextFocus(){
	$('input').keydown(function(key) {
		if (key.keyCode == 13) {
			$(this).next().find('input').focus();
		}
	});
}
nextFocus();

//특정 클래스 타입의 input에서 엔터 누르면 다음 input으로 포커스
function nextFocusName(name){
	$('name').keydown(function(key) {
		if (key.keyCode == 13) {
			$(this).next().find(name).focus();
		}
	});
}


//3자리수마다 콤마 찍어주는 함수
function comma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//콤마풀고 Number로 변환
function uncomma(str) {
    str = String(str);
    return Number(str.replace(/[^\d]+/g, ''));
}
//date포맷 함수
String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};

Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};
 


//오늘을 date 형식으로 구하기
var now = new Date();
//특정일 Date 형식으로 담을 변수
var thisDate;
//특정달 및 년을 yyyy.MM.dd 형식으로 변환
function getDate(object){
	return new Date(object).format("yyyy.MM.dd");
}
// 현재 시간 구하기
var nowTime = new Date().format('hh:mm');
//오늘 구하기
var nowString =  now.format("yyyy.MM.dd");
//특정일 구하기
function getThisDate(object){return new Date(object).format("yyyy.MM.dd");}
//이번달 구하기
var nowMonth = now.format("yyyy.MM");
//이번년도를 구하기
var nowYear = now.format("yyyy");
//이번달 1일 말일을 각각 구하기
var firstDate = new Date(now.getFullYear(), now.getMonth(), 1).format("yyyy.MM.dd");
var lastDate =  new Date(now.getFullYear(), now.getMonth()+1, 0).format("yyyy.MM.dd");
//이번년도 1월 12월을 각각 구하기
var firstMonth = now.format("yyyy.01");
var lastMonth = now.format("yyyy.MM");
//이번년도 1월 1일을 구하기
var firstMonthDate = now.format("yyyy.01.01");

//특정달 1일 구하기
function getFistDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth(), 1).format("yyyy.MM.dd");
}
//특정달 말일 구하기
function getLastDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth()+1, 0).format("yyyy.MM.dd");
}
//특정일 전날 구하기
function getPreDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth(), dateSource.getDate()-1).format("yyyy.MM.dd");
}
//특정일 다음날 구하기
function getNextDate(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth(), dateSource.getDate()+1).format("yyyy.MM.dd");
}
//특정달 전달 구하기
function getPreMonth(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth()-1).format("yyyy.MM");
}
//특정달 다음달 구하기
function getNextMonth(object){
	var dateSource = new Date(object);
	return new Date(dateSource.getFullYear(), dateSource.getMonth()+1).format("yyyy.MM");
}
//특정년 전년 구하기
function getPreYear(object){
	return new Date(object).format("yyyy")-1;
}
//특정년 전년 구하기
function getNextYear(object){
	return new Date(object).format("yyyy")+1;
}



// //2011년 09월 11일 오후 03시 45분 42초
// console.log(new Date('2018.01.01').format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
 
// //2011-09-11
// console.log(new Date().format("yyyy-MM-dd"));
 
// //'11 09.11
// console.log(now.format("yyyy.MM.dd"));
 
// //2011-09-11 일요일
// console.log(new Date().format("yyyy-MM-dd E"));
 
// //현재년도 : 2011
// console.log("현재년도 : " + new Date().format("yyyy"));




$('document').ready(function(){
/* 	resize();
	window.onresize = resize; */
    //좌측 메뉴 클릭시 서브메뉴 토글
    $('.leftMenu, .leftMenulast').on('click', function(){
        $(this).next('.leftSubmenu').slideToggle();
    })
    //	//inputSel 클래스 선택시 글자 전체선택한다.
    inputSel();
    
/*document.ready의 끝*/  
})

	//데이트 피커 - totalReport
// 	$(function() {
// 	    $( ".datepicker" ).datepicker({
// 	    	dateFormat:'yy.mm.dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
// 	            , showOn: 'both' // 우측에 달력 icon 을 보인다.
<%-- 	            , buttonImage: '<%=request.getContextPath()%>/img/calendar.png'  // 우측 달력 icon 의 이미지 패스  --%>
// 	            , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
// 	            , changeMonth: true // 월선택 select box 표시 (기본은 false)
// 	            ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
// 	            ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
// 	            ,closeText : "닫기"
// 	            ,currentText : "오늘"
// 	    });
// 	    $('img.ui-datepicker-trigger').css('width', '22px');
// 	    $('img.ui-datepicker-trigger').css('padding-left', '6px');
// 	    $('img.ui-datepicker-trigger').css('padding-top', '2px');
// 	    $('img.ui-datepicker-trigger').css('vertical-align', 'top');
// 	    $('img.ui-datepicker-trigger').css('cursor', 'pointer');
// 	});

// 	//데이트 피커 - dailySal
// 	$(function() {
// 	    $( ".datepicker" ).datepicker({
// 	    		dateFormat:'yy.mm.dd' // 만약 2011년 4월 29일 선택하면  inputbox 에 '2011/04/29' 로표시
// 	            , showOn: 'both' // 우측에 달력 icon 을 보인다.
<%-- 	            , buttonImage: '<%=request.getContextPath()%>/img/calendar.png'  // 우측 달력 icon 의 이미지 패스  --%>
// 	            , buttonImageOnly: true //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
// 	            , changeMonth: true // 월선택 select box 표시 (기본은 false)
// 	            ,changeYear: true  // 년선택 selectbox 표시 (기본은 false)
// 	            ,showButtonPanel: true // 하단 today, done  버튼기능 추가 표시 (기본은 false)
// 	            ,closeText : "닫기"
// 	            ,currentText : "오늘"
// 	    });
// 	    $('img.ui-datepicker-trigger').css('width', '22px');
// 	    $('img.ui-datepicker-trigger').css('padding-left', '6px');
// 	    $('img.ui-datepicker-trigger').css('padding-top', '1px');
// 	    $('img.ui-datepicker-trigger').css('vertical-align', 'top');
// 	    $('img.ui-datepicker-trigger').css('cursor', 'pointer');
// 	});

// 	//month 피커
//     $(".datepicker1, .datepicker2").monthpicker({ 
//     	pattern : 'yyyy.mm',
// 		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
//    	});
//     $('.monthButton1').bind('click', function(){
//     	$(".datepicker1").monthpicker('show');
//     });
//     $('.monthButton2').bind('click', function(){
//     	$(".datepicker2").monthpicker('show');
//     });

// 	//날짜 변경시 ajax 처리
// 	$('.datepicker').on('change', function(){
// 		var newDate = getDate($( ".datepicker" ).val());
		
// 		loadBottomReport(newDate);
// 	});
</script>


<!-- 캘린더 객체 생성 -->
<%
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMM");
	ArrayList<Object> monthArr = new ArrayList<Object>();

		for(int i=0; i <= 11; i++) {
			
			if(i > 0){
			cal.add(cal.MONTH, -1);
			} else {
				cal.add(cal.MONTH, 0);
			}
			String year = dateFormat.format(cal.getTime()).substring(0,4);
			String month = dateFormat.format(cal.getTime()).substring(4,6);
			
			request.setAttribute("year"+ i, year);
			request.setAttribute("month"+ i, month);
			monthArr.add(month);
		}
	request.setAttribute("monthArr", monthArr);
		
// 	//숫자를 소수점 버리고 포맷 변환하는 함수
// 	double val = 1234525635.12;
// 	DecimalFormat numFormat = new DecimalFormat(",###");
	/* System.out.println(numFormat.format(val)); */
%>

