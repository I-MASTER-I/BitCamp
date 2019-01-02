<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	var totalAmount= 0;
</script>
<style>
.ds1{width: 195px !important;}
.bootstrap-datetimepicker-widget tr:hover {
    background-color: #c8c8c8;
}
</style>
<c:set var="viewData" value="${viewData}"/>

	<table id="weeklySalTab" class="tablesorter resultTab">
		<thead>
			<tr>
				<th class="ds1">날짜</th>
				<th class="ds2">주문수</th>
				<th class="ds3">방문자</th>
				<th class="ds4">매출</th>
				<th class="notsorter"></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${viewData.isEmpty()}">
					<tr>
						<td colspan="5" style="text-align: center; padding: 120px 0;">등록된 주문이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="SalVO" items="${viewData.objList}">
						<script type="text/javascript">
							totalAmount += Number(${SalVO.amount});
						</script>
						<tr>
							<td class="ds1">${SalVO.orderTime}</td>
							<td class="ds2">${SalVO.orderCount} 건</td>
							<td class="ds3">${SalVO.visitCount} 명</td>
							<td class="ds4">
								<fmt:formatNumber value="${SalVO.amount}" pattern="#,###"/>
								원
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br>
	<div class="t-right">
		<span class="toResult">
			<span>총 매출</span>
			<span id="totalAmount"></span>
		</span>
	</div>
<!-- 	페이징 처리 -->
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	</c:when>
	<c:otherwise>
		<nav aria-label="Page navigation example">
			<ul class="pagination pg-dark">
				<c:choose>
					<c:when test="${viewData.currentPageNumber == 1}">
						<li class="page-item"><a class="page-link disabled">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber - 1}">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.pageTotalCount == 1}">
						<li class="page-item active"><a id="currentPage" class="page-link" name="1">1<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="${viewData.startPage}"
							end="${viewData.endPage}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active"><a id="currentPage" class="page page-link"
								name="${i.index}">${i.index}<span class="sr-only">(current)</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
								name="${i.index}">${i.index}</a></li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.currentPageNumber == viewData.pageTotalCount}">
						<li class="page-item"><a class="page-link disabled">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber + 1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</c:otherwise>
</c:choose>

<style type="text/css">

@media print {
	
/* 	body{ */
/* 		z-index: -1; */
/* 	} */

	#backBody{
		display: block !important;
		width : 100%; height : 100%; 
		background-color: white; 
		z-index: 99; 
		position: fixed !important; 
		top: 0; left: 0;
		background-color : #ffffff !important;
	}
	
	#printResult{
	
		display: block;
		z-index: 1000;
		position: fixed;
		top : 0;
		left : 0;
		margin: 50px 70px; !important;
		
	}
	
	#printResult * {
	   box-sizing: border-box;
	   background-color : #ffffff !important;
	   color : #282828;
	   
	}
	#tab {
		margin-top: 50px;
		width : 100%;
	}
	#tab td{
		 border : thin solid #282828;	
		 text-align : right; 
		 padding : 5px 20px;
		 font-size: 20px;
	}
	#printResult thead tr td {
	    text-align : center;
	}
	.t0{
		border: none !important; 
	}
	.t1 {
		width: 220px;
		text-align : center !important;
	}
	.t2 {
		width: 170px;
	}
	.t3 {
		width: 170px;
	}
	.t4 {
		width: 300px;
	}
	#printResult .title{
		text-align : center !important;
		font-size : 28px;
		color : #282828;
		height : 100px;
		border : none !important;
	}
	#printResult .total{
		text-align : center !important;
		font-size : 24px;
	}
}
</style>
<div id="backBody" style="display:none;">
	<div id="printResult">
	<c:set var="viewData" value="${viewData}"/>
	
		<table id="tab">
			<thead>
				<tr>
					<td class="t0"></td>
					<td class="title" colspan="4">
						Daily Sales Report
					</td>
				</tr>
				<tr>
					<td class="t0"></td>
					<td class="t1">날짜</td>
					<td class="t2">주문수</td>
					<td class="t3">방문자</td>
					<td class="t4">매출</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${viewData.isEmpty()}">
						<tr>
							<td colspan="5" style="text-align: center; padding: 120px 0;">등록된 주문이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="SalVO" items="${viewData.objList}" varStatus="i">
							<c:choose>
								<c:when test="${i.index % 2 == 0}">
									<tr>
										<td class="t0"></td>
										<td class="t1" style="background-color: #C6D9E8;">${SalVO.orderTime}</td>
										<td class="t2" style="background-color: #C6D9E8;">${SalVO.orderCount}</td>
										<td class="t3" style="background-color: #C6D9E8;">${SalVO.visitCount}</td>
										<td class="t4" style="background-color: #C6D9E8;">${SalVO.amount}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="t0"></td>
										<td class="t1">${SalVO.orderTime}</td>
										<td class="t2">${SalVO.orderCount}</td>
										<td class="t3">${SalVO.visitCount}</td>
										<td class="t4">${SalVO.amount}</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr>
					<td class="t0"></td>
					<td class="t1">총 매출</td>
					<td id="total" class="total" colspan="3"></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		//테이블 정렬
		addParser();
		$(".tablesorter").tablesorter(
			{
			    headers : {
				  3 : {sorter : 'NumberSort'}
			 	}
			}
		);
		
		//총합을 출력한다.
		$('#totalAmount').text(comma(totalAmount));
		$('#total').text(comma(totalAmount));
		
// 		loadWeeklySalReport.jsp를 불러오는 함수
		function loadWeeklySalReport(pageNumber){
			
		 	var startDate = $("#startDate").val().split(' - ')[0];
		 	var endDate = $( "#endDate" ).val().split(' - ')[1];
			var tableName = $('#tableName').val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOperation/weeklySal/loadWeeklySalReport?startDate=' + startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber,
				type : 'GET',
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#loadWeeklySalReport').empty();
					$('#loadWeeklySalReport').append(data);
				}
			});
		}
				
		//다운로드 버튼을 누르면 엑셀로 다운받는다.
		$('#excel').off('click').on('click', function(){
		 	var startDate = $( "#startDate" ).val();
		 	var endDate = $( "#endDate" ).val();
			var tableName = $('#tableName').val();
			var pageNumber = $('#currentPage').attr('name');
			
			location.href = '<%=request.getContextPath()%>/admin/adminOperation/weeklySal/excelWeeklySalReport?startDate=' + startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber + '&totalAmount=' + totalAmount;
		});
		
		//페이지 번호를 클릭하면 다시 불러온다.
		$('.page').off('click').click(function() {
			var pageNumber = $(this).attr('name');
			loadWeeklySalReport(pageNumber);
		});
		
		//조회 버튼을 클릭하면 다시 불러온다.
		$('#select').off('click').click(function() {
			loadWeeklySalReport(1);
		});
		
	//$(document).ready의 끝
	});
</script>

<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	