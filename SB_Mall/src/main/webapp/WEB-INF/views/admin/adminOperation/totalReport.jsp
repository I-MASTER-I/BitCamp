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
			<button class="preDate fon22" name="preDate"> &lt; </button> 
				<span class="input-group">
					<input id="totalDatepicker" name="date" class="datepicker dateInput inputSel fon22 fonb" value="">
					<span class="input-group-addon">
	                	<span class="glyphicon calbutton"></span>
	                </span>
				</span>
			<button class="nextDate fon22" name="nextDate"> &gt; </button> 
		</span>
		<span class="absol">
			<span id="excel" class="fon12 downButton">다운로드</span>
			<span id="print" class="fon12 downButton">프린트</span>
		</span>
	</div>
	<div id="bottomReport"></div>
	
<!-- mainContent의 끝 -->
</div>
<style>
<!--
.bootstrap-datetimepicker-widget tr:hover {
    background-color: #f5f5f5;
}
-->
</style>
<script type="text/javascript">


$(document).ready(function(){
	
	//datetimepicker 
	var thisDate = nowString;
	$(".input-group").datetimepicker({
	      format: 'YYYY.MM.DD'
	  });
	
	//datetimepicker - 날짜 선택시 팝업 
	$('.input-group').on('dp.change', function (e) {
		   var datetimeval = e.date;   //선택된 날짜값 정보
		   var newDay  = e.date.format("YYYY.MM.DD"); //변경된 날(문자열로)
		   var weekFistDay = moment(datetimeval, "YYYY.MM.DD").day(0).format("YYYY.MM.DD"); //주의 첫째날
		   var weekLastDy =  moment(datetimeval, "YYYY.MM.DD").day(6).format("YYYY.MM.DD"); //주의 마지막 날
		   
		   if (thisDate != newDay) {
			   thisDate = newDay;
			   loadBottomReport(newDay); //새로운 날짜로 새로 불러온다.
			}
		   
		   $(".datepicker").val(newDay); 
		// $(".datepicker").val(firstDate + " - " + lastDate);  //주날짜 뿌려주고싶을때 참고
	});
	
	
	//input 태그에 오늘 날짜 불러온다.
	$( ".datepicker" ).val(nowString);
	
	//오늘 날짜로 페이지 정보를 불러온다.
	$('#bottomReport').load('<%=request.getContextPath()%>/admin/adminOperation/totalReport/loadBottomReport?nowDate=' + nowString);

	//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
	removeActive('#totalReport', 0);
	
		
	//이전 날짜 선택시 날짜 바꿔서 ajax 처리
	$('.preDate, .nextDate').on('click', function(){
		var preDate = getPreDate($(".datepicker").val());
		var nextDate = getNextDate($(".datepicker").val());
		var newDate;
		if ($(this).attr('name') == 'preDate') {
			$( ".datepicker" ).val(preDate);
			newDate = preDate;
		} else {
			$( ".datepicker" ).val(nextDate);
			newDate = nextDate;
		}
		
		loadBottomReport(newDate);
	});
	
	//다운로드 버튼을 누르면 엑셀로 다운받는다.
	$('#excel').on('click', function(){
		
		var newDate = $( ".datepicker" ).val();
		
		location.href = '<%=request.getContextPath()%>/admin/adminOperation/totalReport/excelBottomReport?nowDate=' + newDate
				
	});
	
	
	//영업 현황 불러온다.
	function loadBottomReport(newDate){
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/adminOperation/totalReport/loadBottomReport?nowDate=' + newDate,
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				$('#bottomReport').html(data);
			}
		});
	}
	
	

});
</script>