<%@ page language="java" contentType="application/vnd.ms-excel; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("Content-Disposition","attachment;filename=daily_sales_report.xls");
response.setHeader("Content-Description", "JSP Generated Data");
%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>

	<table id="dailySalTab" class="tablesorter resultTab">
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
			<tr>
				<td class="ds1">1111</td>
				<td class="ds2">1111</td>
				<td class="ds3">1111</td>
				<td class="ds4">
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<br>
	<div class="t-right">
		<span class="toResult">
			<span>총 매출</span>
			<span id="totalAmount"></span>
		</span>
	</div>
</body>

</html>