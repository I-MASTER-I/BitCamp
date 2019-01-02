<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 	주문 리스트 -->
<c:set var="viewData" value="${viewData}"></c:set>
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	</c:when>
	<c:otherwise>
		<div id="orderPage">
			<div class="modTopBox">
				<h4 class="modTable modDate">주문일</h4>
				<h4 class="modTable modOrderNum">주문상세번호</h4>
				<h4 class="modTable modAddress">배송지</h4>
				<h4 class="modTable modGoodsName">상품</h4>
				<h4 class="modTable modPayment">결제</h4>
				<h4 class="modTable modStatus">상태</h4>
				<h4 class="modTable modOrderPrice">주문금액</h4>
			</div>
			
			<c:forEach var="orderDetailVO" items="${viewData.objList}">
				<div class="myOrderUnit" name="${orderDetailVO.orderDetailNum}">
					<div class="myOrderPixel pixelDate">
						<h6 class="myOrderList">${orderDetailVO.orderTime}</h6>
					</div>
					<div class="myOrderPixel pixelOrderNum">
						<h6 class="myOrderList">${orderDetailVO.orderDetailNum}</h6>
					</div>
					<div class="myOrderPixel pixelAddress">
						<h6 class="myOrderList">${orderDetailVO.orderAddress}</h6>
					</div>
					<div class="myOrderPixel pixelGoodsName">
						<h6 class="myOrderList">${orderDetailVO.goodsName}</h6>
					</div>
					<div class="myOrderPixel pixelPayment">
						<h6 class="myOrderList">
							<c:choose>
								<c:when test="${orderDetailVO.payment==0}">
									현금
								</c:when>
								<c:when test="${orderDetailVO.payment==1}">
									카드
								</c:when>
							</c:choose>
						</h6>
					</div>
					<div class="myOrderPixel pixelStatus">
						<h6 class="myOrderList">
							<c:choose>
								<c:when test="${orderDetailVO.status==0}">
									입금전
								</c:when>
								<c:when test="${orderDetailVO.status==1}">
									결제완료
								</c:when>
								<c:when test="${orderDetailVO.status==2}">
									배송준비
								</c:when>
								<c:when test="${orderDetailVO.status==3}">
									배송중
								</c:when>
								<c:when test="${orderDetailVO.status==4}">
									배송완료
								</c:when>
							</c:choose>
						</h6>
					</div>
					<div class="myOrderPixel pixelOrderPrice">
						<h6 class="myOrderList">
						<fmt:formatNumber value="${orderDetailVO.totalAmount}" pattern="#,###"/>원</h6>
					</div>
				</div>
			
			</c:forEach>
		</div>
	</c:otherwise>
</c:choose>
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
						<li class="page-item action"><a id="currentPage" class="page-link" name="1">1</a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="${viewData.startPage}"
							end="${viewData.endPage}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item action"><a id="currentPage" class="page page-link"
								name="${i.index}">${i.index}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item unAction"><a class="unpage page-link unpage"
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

<script type="text/javascript">

function loadOrderList(orderDetailNum){
	
	var tableName = $('#tableName').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/member/loadOrderList?tableName=' + tableName + '&orderDetailNum=' + orderDetailNum,
		type : 'GET',
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#loadOrderList').html(data);
			$('#loadOrderList').show();
		}
	});
};

//페이지 번호를 클릭하면 다시 불러온다.
$('.page').off('click').click(function() {
	var pageNumber = $(this).attr('name');
	loadOrderDetailList(pageNumber);
});

//테이블 선택하면 리로딩한다.
$('#tableName').off('click').change(function() {
	loadOrderDetailList(1);
});

//테이블 td 클릭시 해당 주문 조회
$('.myOrderUnit').off('click').on('click', function(){
	
	var orderDetailNum = $(this).attr('name');
	
	loadOrderList(orderDetailNum);
	
})
</script>