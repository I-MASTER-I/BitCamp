<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:forEach var="opt1List" items="${opt1List}">

	<!-- 셀렉트 리스트 박스 -->
	<div class="SL opt1List">

		<!-- 셀렉트 왼쪽 -->
		<div class="SLleft">
			<div class="SLboxOpt optTitleBox">
				<h3 class="optname opt1Name">${opt1List.opt1Name}</h3>
				<h6 class="hidden optionSeq">${opt1List.optionSeq}</h6>
				<h6 class="hidden GoodsNoFk">${opt1List.goodsNo}</h6>
			</div>
		</div>

		<!-- 셀렉트 오른쪽 -->
		<div class="SLright">
			<h3 class="hidden opt1Price">${opt1List.crOpt1Price}</h3>
			<h3 class="SLprice">+ <fmt:formatNumber value="${opt1List.crOpt1Price}" pattern="#,###"/>원</h3>
		</div>
	</div>
</c:forEach>