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
</style>
<!-- adminOperation.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader" class="t-left">
		<span class="fon16 fonb">
		기간 조회
		</span>
		<span class="seldate">
				<span class="input-group input-group1">
					<input type="text" id="startDate" name="startDate" class="datepicker inputSel bor-non" value="">
					<span class="input-group-addon">
	                	<span class="glyphicon calbutton"></span>
	                </span>
				</span>
		</span>
		<span class="fonb fon16">-</span><span class="seldate">
			<span class="input-group input-group2">
				<input type="text" id="endDate" name="endDate" class="datepicker inputSel bor-non" value="">
				<span class="input-group-addon">
                	<span class="glyphicon calbutton"></span>
                </span>
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
	<div id=loadMonthlySalReport>
	<!-- loadMonthlySalReport의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		//datetimepicker 
		$(".input-group1, .input-group2").datetimepicker({
		      format: 'YYYY.MM'
		  });
		
		$('.input-group1, .input-group2').on('dp.change', function (e) {
			  var datetimeval = e.date;   //선택된 날짜값 정보
			  var newDay  = e.date.format("YYYY.MM"); //변경된 날(문자열로)
			  
			  var weekFistDay = moment(datetimeval, "YYYY.MM").day(0).format("YYYY.MM"); //주의 첫째날
			  var weekLastDy =  moment(datetimeval, "YYYY.MM").day(6).format("YYYY.MM"); //주의 마
			 
			 if($(this).attr('class') == 'input-group input-group1') {
				 $("#startDate").val(newDay); 
			} else {
				$("#endDate").val(newDay); 
			}
			   
			// $("#endDate").val(firstDate + " - " + lastDate);  //주날짜 뿌려주고싶을때 참고
		});
		
		//loadMonthlySalReport에 파라미터로 넘길 변수들
		var tableName = $('#tableName').val();
		var startDate = getFistDate(firstMonth);
		var endDate = getLastDate(nowMonth);
		
		//loadMonthlySalReport을 불러온다.
		$('#loadMonthlySalReport').load(
			'<%=request.getContextPath()%>/admin/adminOperation/monthlySal/loadMonthlySalReport?startDate=' + startDate + '&endDate=' + endDate + '&tableName=' + tableName + '&pageNumber=1'
		);
		
		//input 태그에 오늘 날짜 불러온다.
		$( "#startDate" ).val(firstMonth);
		$( "#endDate" ).val(nowMonth);
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#salReport', '#monthlySal');
		
		//다운로드 버튼을 누르면 엑셀로 다운받는다.
		$('#excel').on('click', function(){
			
			var startDate = getFistDate($( "#startDate" ).val());
			var endDate = getLastDate($( "#endDate" ).val());
			var tableName = $('#tableName').val();
			var pageNumber = $('#currentPage').attr('name');
			
			location.href = '<%=request.getContextPath()%>/admin/adminOperation/monthlySal/excelMonthlySalReport?startDate=' + startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber + '&totalAmount=' + totalAmount;
		});
	
	});
</script>
