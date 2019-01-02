<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.calbutton{
	width: 15px;
	height: 16px;
	background-size : 14px;
	background-image: url("<%=request.getContextPath()%>/img/calendar.png");
}
#startDate, #endDate {
	width: 130px;
	font-size: 12px;
	margin-top : 1px;
}
</style>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader" class="t-left">
		<span class="fon16 fonb">
		주간 조회
		</span>
		<span class="seldate">
			<span class="input-group input-group1">
				<input type="text" id="startDate" name="startDate" class="datepicker inputSel bor-non" value="">
			</span>
		</span>
		<span class="fonb fon16">-</span><span class="seldate">
			<span class="input-group input-group2">
				<input type="text" id="endDate" name="endDate" class="datepicker inputSel bor-non" value="">
			</span>
		</span>
		<span>
			<select id="tableName">
				<option value="OrderDetail" selected="selected">일반주문</option>
				<option value="CrowdOrderDetail">크라우드펀딩</option>
			</select>
		</span>
		<span>
			<input type="submit" id="select" class="select" value="조회">
		</span>
		<span class="absol">
			<span id="excel" class="fon12 downButton">다운로드</span>
			<span id="print" class="fon12 downButton">프린트</span>
		</span>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="loadWeeklySalReport">
	<!-- loadWeeklySalReport의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		//datetimepicker 
		$("#startDate, #endDate").datetimepicker({
		      format: 'YYYY.MM.DD'
		  });
		$('#startDate, #endDate').on('dp.change', function (e) {
			  var datetimeval = e.date;   //선택된 날짜값 정보
			  var newDay  = e.date.format("YYYY.MM.DD"); //변경된 날(문자열로)
			  
			  var weekFistDay = moment(datetimeval, "YYYY.MM.DD").day(0).format("YYYY.MM.DD"); //주의 첫째날
			  var weekLastDy =  moment(datetimeval, "YYYY.MM.DD").day(6).format("YYYY.MM.DD"); //주의 마
			 
			 if($(this).attr('id') == 'startDate') {
				 $("#startDate").val(weekFistDay + " - " + weekLastDy);  //주날짜 뿌려주고싶을때 참고
			} else {
				$("#endDate").val(weekFistDay + " - " + weekLastDy);  //주날짜 뿌려주고싶을때 참고
			}
			   
			
		});
		
		var tableName = $('#tableName').val();
		
		$('#loadWeeklySalReport').load(
			'<%=request.getContextPath()%>/admin/adminOperation/weeklySal/loadWeeklySalReport?startDate=' + firstDate + '&endDate=' + nowString + '&tableName=' + tableName + '&pageNumber=1'
		);
		
		//input 태그에 이번달 1일과 오늘의 주를 불러온다.
		var weekFistDay = moment(firstDate, "YYYY.MM.DD").day(0).format("YYYY.MM.DD"); //주의 첫째날
		var weekLastDy =  moment(firstDate, "YYYY.MM.DD").day(6).format("YYYY.MM.DD"); //주의 마
		$("#startDate").val(weekFistDay + " - " + weekLastDy);
		var weekFistDay = moment(nowString, "YYYY.MM.DD").day(0).format("YYYY.MM.DD"); //주의 첫째날
		var weekLastDy =  moment(nowString, "YYYY.MM.DD").day(6).format("YYYY.MM.DD"); //주의 마지막날
		$("#endDate").val(weekFistDay + " - " + weekLastDy);
		
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#salReport', '#weeklySal');
		
		
		
	});
</script>
