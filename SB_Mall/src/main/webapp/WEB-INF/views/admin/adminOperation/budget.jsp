<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.calbutton{
	width: 20px;
	height: 21px;
	top : 2px;
	background-size : 19px;
	background-image: url("<%=request.getContextPath()%>/img/calendar.png");
}
</style>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader">
		<span>
<!-- 			<button class="preDate fon22" name="preDate"> &lt; </button>  -->
<!-- 			<input type="text" id="budgetDatepicker" name="year" class="datepicker dateInput fon22 fonb" readOnly value=""> -->
<!-- 			<button class="nextDate fon22" name="nextDate"> &gt; </button>  -->
			<button class="preDate fon22" name="preDate"> &lt; </button> 
				<span class="input-group">
					<input id="budgetDatepicker" name="year" class="datepicker dateInput inputSel fon22 fonb" value="">
					<span class="input-group-addon">
	                	<span class="glyphicon calbutton"></span>
	                </span>
				</span>
			<button class="nextDate fon22" name="nextDate"> &gt; </button> 
		</span>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="mainBottom">
		<form id="budgetModify">
			<div id="loadBudgetReport">
<!-- 				loadBudgetReport.jsp를 불러온다. -->
			</div>
		</form>
		
	<!-- mainBottom의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>

<script type="text/javascript">

function loadBudgetReport(newYear){
	$.ajax({
		url : '<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport?nowYear=' + newYear,
		error : function(error) {
			alert(error);
	    },
		success : function(data) {
			$('#loadBudgetReport').html(data);
		}
	});
}

$(document).ready(function(){
	
	//datetimepicker 
	var thisDate = nowYear;
	$(".input-group").datetimepicker({
	      format: 'YYYY'
	  });
	
	//datetimepicker - 날짜 선택시 팝업 
	$('.input-group').on('dp.change', function (e) {
		   var datetimeval = e.date;   //선택된 날짜값 정보
		   var newDay  = e.date.format("YYYY"); //변경된 날(문자열로)
		   var weekFistDay = moment(datetimeval, "YYYY").day(0).format("YYYY"); //주의 첫째날
		   var weekLastDy =  moment(datetimeval, "YYYY").day(6).format("YYYY"); //주의 마지막 날
		   
		   if (thisDate != newDay) {
			   thisDate = newDay;
			   loadBudgetReport(newDay); //새로운 날짜로 새로 불러온다.
			}
		   
		   $(".datepicker").val(newDay); 
		// $(".datepicker").val(firstDate + " - " + lastDate);  //주날짜 뿌려주고싶을때 참고
	});
	
	$('#loadBudgetReport').load('<%=request.getContextPath()%>/admin/adminOperation/budget/loadBudgetReport?nowYear=' + nowYear);
	
	//input 태그에 오늘 년도를 불러온다.
	$( ".datepicker" ).val(nowYear);
	
	//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
	removeActive('#budget', 0);
	
	//이전 날짜 선택시 날짜 바꿔서 ajax 처리
	$('.preDate, .nextDate').on('click', function(){
		var preYear = Number($(".datepicker").val()) - 1;
		var nextYear = Number($(".datepicker").val()) + 1;
		var newYear;
		if ($(this).attr('name') == 'preDate' ) {
			$( ".datepicker" ).val(preYear);
			newYear = preYear;
		} else {
			$( ".datepicker" ).val(nextYear);
			newYear = nextYear;
		}
		
		loadBudgetReport(newYear);
	});
	
	//날짜 변경시 ajax 처리
	$('.datepicker').on('change', function(){
		var newYear = $(".datepicker").val();
		
		loadBudgetReport(newYear);
		
	});
	

	


});
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>