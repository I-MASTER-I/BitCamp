<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="orderVOList" value="${orderVOList}"/>

<!-- adminOrder.jsp 에서 불러온다. -->
<div id="mainContent">
	<c:choose>
		<c:when test="${orderVOList.isEmpty()}">
			<div class="emptyResult">
				등록된 주문이 없습니다.
			</div>
		</c:when>
		<c:otherwise>
			<!-- 날짜 선택 -->
			<div id="mainHeader">
				<div class="resultTitle">
					<span>주문상세번호 : &nbsp; ${orderVOList[0].orderDetailNum}</span>
					<span>회원번호 : &nbsp; ${orderVOList[0].userSeq}</span>
					<span>주문자 : &nbsp; ${orderVOList[0].userName}</span>
					   	 
				</div>
			</div>
			
			<!-- 중단 -->
			<div style="margin-top: 25px;">
			</div>
			
			<!-- 하단 -->
			<div id="orderResult">
				<table id="resultTable" class="resultTab">
					<thead>
						<tr>
							<th class="or0">주문번호</th>
							<th class="or1">제품사진</th>
							<th class="or2">상품번호</th>
							<th class="or3">상품명</th>
							<th class="or4">수량</th>
							<th class="or5">옵션1</th>
							<th class="or6">옵션2</th>
							<th class="or7">합계</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="OrderVO" items="${orderVOList}">
							<tr>
								<td class="or0">${OrderVO.orderSeq}</td>
								<td class="or1">
									<img alt="이미지가 없습니다."	onerror="this.src='<%=request.getContextPath()%>/img/noImage.png'"
									 src="${OrderVO.goodsPhoto}">
								</td>
								<td class="or2">${OrderVO.goodsNo}</td>
								<td class="or3">${OrderVO.goodsName}</td>
								<td class="or4">${OrderVO.quantity}</td>
								<td class="or5">${OrderVO.opt1Name}</td>
								<td class="or6">${OrderVO.opt2Name}</td>
								<td class="or7"><fmt:formatNumber value="${OrderVO.salePrice}" pattern="#,###"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br>
				<div>
					<span>
						<input type="button" id="back" class="back" value="목록">
					</span>
				</div>
			<!-- orderResult의 끝 -->
			</div>
		</c:otherwise>
	</c:choose>
<!-- mainContent의 끝 -->
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		//메뉴 및 서브메뉴에 css 적용 - 서브메뉴가 있을 경우 두번째 인자에 서브메뉴 태그 id 또는 클래스명을 넣는다. 0으로 하면 서브메뉴가 없는것
		removeActive('#orderManager', 0);
		
				
		//목록으로 돌아간다.
		$('#back').click(function() {

			var orderBackVO = {};
			orderBackVO.startDate = '${OrderBackVO.startDate}';
		 	orderBackVO.endDate = '${OrderBackVO.endDate}';
			orderBackVO.tableName = '${OrderBackVO.tableName}';
			orderBackVO.status = ${OrderBackVO.status};
			orderBackVO.payment = ${OrderBackVO.payment};
			orderBackVO.search = '${OrderBackVO.search}';
			orderBackVO.pageNumber = ${OrderBackVO.pageNumber};
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOrder/orderManager',
				method : 'POST',
				type: "json",
				data : JSON.stringify(orderBackVO),
				contentType: "application/json",
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#rightContent').html(data);
				}
			});
		});
		

		
	});
</script>
