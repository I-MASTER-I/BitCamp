<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String fileName = "weekly sales report";
response.setHeader("Content-Disposition","attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">

* {

   box-sizing: border-box;
   font-weight : normal;
   
}
<%--  --%>
#tab td{
	 border : 1px solid #C6D9E8;	 
}
<%-- 기본 정렬 --%>
td {
 	text-align : right;
}
<%-- 헤더 --%>
thead tr td {
	color : #ffffff;
    text-align : center;
    background-color: #6298C0;
}
<%-- 숫자 3자리수마다 콤마 --%>
.t2, .t3, .t4, .total {
	mso-number-format:\#\,\#\#0\;
}

.t1, .t2, .t3, .t4 {
}
<%-- 왼쪽 빈 여백 --%>
.t0{
	border: none !important; 
	background-color : #ffffff !important;
}
<%--  --%>
.t1 {
	width: 260px;
	text-align : center !important;
}
.t2 {
	width: 150px;
}
.t3 {
	width: 150px;
}
.t4 {
	width: 280px;
}
<%-- 제목과 총계 --%>
.title{
	text-align : center !important;
	font-weight : bold !important;
	font-size : 28px;
	color : #282828;
	background-color : #ffffff !important;
	height : 60px;
	border : none !important;
}
.total{
	text-align : center !important;
	font-weight : bold !important;
	font-size : 24px;
}


</style>
</head>
<body>
<c:set var="viewData" value="${viewData}"/>

	<table id="tab">
		<thead>
			<tr>
				<td class="t0"></td>
				<td class="title" colspan="4">
					Weekly Sales Report
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
				<td class="total" colspan="3">${totalAmount}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>