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
<!-- adminOrder.jsp 에서 불러온다. -->
<div id="mainContent">
	
	<!-- 날짜 선택 -->
	<div id="mainHeader" class="t-left">
		<div>
			<span class="fon16 fonb">
				검색 조건
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
				<select id="payment">
					<option value="-1" selected="selected">결제수단</option>
					<option value="1">카드</option>
					<option value="0">현금</option>
				</select>
			</span>
			<span>
				<select id="status">
					<option value="-1" selected="selected">주문상태</option>
					<option value="0">입금전</option>
					<option value="1">결제완료</option>
					<option value="2">배송준비</option>
					<option value="3">배송중</option>
					<option value="4">배송완료</option>
				</select>
			</span>
			<span class="search">
				<input type="text" id="search" placeholder="검색어 입력" value="">
			</span>
			<span>
				<input type="submit" id="select" class="select" value="조회">
			</span>
		</div>
	</div>
	
	<!-- 중단 -->
	<div id="mainMid">
		
	<!-- mainMid의 끝 -->
	</div>
	
	<!-- 하단 -->
	<div id="loadOrderList">
	<!-- loadDailySalReport의 끝 -->
	</div>
	
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		//datetimepicker 
		$(".input-group1, .input-group2").datetimepicker({
		      format: 'YYYY.MM.DD'
		  });
		$('.input-group1, .input-group2').on('dp.change', function (e) {
			  var datetimeval = e.date;   //선택된 날짜값 정보
			  var newDay  = e.date.format("YYYY.MM.DD"); //변경된 날(문자열로)
			  
			  var weekFistDay = moment(datetimeval, "YYYY.MM.DD").day(0).format("YYYY.MM.DD"); //주의 첫째날
			  var weekLastDy =  moment(datetimeval, "YYYY.MM.DD").day(6).format("YYYY.MM.DD"); //주의 마
			 
			 if($(this).attr('class') == 'input-group input-group1') {
				 $("#startDate").val(newDay); 
			} else {
				$("#endDate").val(newDay); 
			}
		});
		
		var tableName = $('#tableName').val();
		var status = $('#status').val();
		var payment = $('#payment').val();
		var search = $('#search').val();
		
		//주문상세보기에서 뒤로 왔을경우
		var orderBackVO = '${OrderBackVO}';
		if (orderBackVO != null && orderBackVO != '') {
			
			var startDate = '${OrderBackVO.startDate}';
		 	var endDate = '${OrderBackVO.endDate}';
			var tableName = '${OrderBackVO.tableName}';
			var status = '${OrderBackVO.status}';
			var payment = '${OrderBackVO.payment}';
			var search = '${OrderBackVO.search}';
			var pageNumber = '${OrderBackVO.pageNumber}';
			
			$('#loadOrderList').load(
					'<%=request.getContextPath()%>/admin/adminOrder/orderManager/loadOrderList?startDate=' 
					+ startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber
					+ '&status=' + status + '&payment=' + payment + '&search=' + search
				);
			
		//주문관리 메인에서 바로 왔을 경우
		} else {
			$('#loadOrderList').load(
					'<%=request.getContextPath()%>/admin/adminOrder/orderManager/loadOrderList?startDate='
							+ firstDate + '&endDate=' + nowString + '&tableName=' + tableName + '&pageNumber=1'
							+ '&status=' + status + '&payment=' + payment + '&search=' + search
				);
		}

		
		//input 태그에 오늘 날짜 불러온다.
		$( "#startDate" ).val(firstDate);
		$( "#endDate" ).val(nowString);
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#orderManager', 0);
		
		

		
	});
</script>
