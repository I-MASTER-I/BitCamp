<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<c:forEach var="opt2List" items="${opt2List}">

	<!-- 셀렉트 리스트 박스 -->
	<div class="SL opt2List">

		<!-- 셀렉트 왼쪽 -->
		<div class="SLleft">
			<div class="SLboxOpt optTitleBox">
				<h3 class="optname opt2Name">${opt2List.opt2Name}</h3>
				<h6 class="hiddenPick optSeq">${opt2List.optionSeq}</h6>
				
			</div>
		</div>

		<!-- 셀렉트 오른쪽 -->
		<div class="SLright">
			<h3 class="hidden opt2Price">${opt2List.crOpt2Price}</h3>
			<h3 class="SLprice">+ <fmt:formatNumber value="${opt2List.crOpt2Price}" pattern="#,###"/>원</h3>
			<h3 class="optAmount">수량 : ${opt2List.crOptAmount}</h3>
		</div>
	</div>
</c:forEach>