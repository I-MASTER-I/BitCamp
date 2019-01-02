<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div id="newProductBigBox">
	
	<c:if test="${newProduct!=null}">
		<div class="newProBox">
		<c:forEach var="newPro" items="${newProduct}">
			<span class="newProduct">
				<a href="<%=request.getContextPath()%>/store/board/${newPro.salesSeq}">
					<img class ="newProPhoto" alt="이미지 준비중입니다." src="${newPro.photo}">	
				</a>	
				<h4 class="newProH4">${newPro.productName}</h4>
				<h6 class="newProH6"><fmt:formatNumber value="${newPro.price}"  pattern="#,###"/>won</h6>
			</span>
		</c:forEach>
		</div>
	</c:if>
	
	
	
	
</div>