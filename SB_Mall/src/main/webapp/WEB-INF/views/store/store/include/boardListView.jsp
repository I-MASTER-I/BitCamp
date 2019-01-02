<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
	});
	function numComma(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</head>
<body>
	<c:if test="${!viewList.isEmpty()}">
		<c:forEach var="productList" items="${viewList.storeList}">
			<a href="<%=request.getContextPath()%>/store/board/${productList.salesSeq}"
				class="nodeco"> 
			<span class="productListBox"> 
				<img src="${productList.photo}" alt="사진없음" class="productListThumb"
					onerror="imgError(this)">
					<span class="BoardListTitle">${productList.title}</span> 
					<span class="BoardListDetail">${productList.detail}</span>
					<span class="BoardListB2">
						<span class="BoardListPrice">
							<fmt:formatNumber value="${productList.price}" pattern="#,###"/>원~
						</span>
						<span class="BoardListViewCnt">
							<img src="<%=request.getContextPath()%>/img/viewSeq01.png"/>
							${productList.viewSeq}
						</span>
					</span>
			</span>
			</a>
		</c:forEach>
			<%-- [${viewList.currentPageNumber}/${viewList.pageTotalCount}] --%>
		<div class="storeListPaging">
		<c:forEach varStatus="i" begin="1" end="${viewList.pageTotalCount}">
			<c:choose>
				<c:when test="${i.count==viewList.currentPageNumber}">
					<span class="storeBtn storePagingBtn selectedPagingBtn">${i.count}</span>
				</c:when>
				<c:otherwise>
					<button value="${i.count}" class="storeBtn storePagingBtn" 
					onclick="afnc(this)">${i.count}</button>
				</c:otherwise>
			</c:choose>
		</c:forEach> 
		</div>
		<input type="hidden" class="pageNumber" name="pageNumber"
			value="${viewList.currentPageNumber}">
		<input type="hidden" class="countPerPage" name="countPerPage"
			value="${viewList.countPerPage}">
	</c:if>
</body>
</html>