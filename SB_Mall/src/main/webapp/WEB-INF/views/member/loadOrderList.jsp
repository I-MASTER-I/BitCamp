<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 	주문 리스트 -->
<c:set var="orderVOList" value="${orderVOList}"></c:set>
<c:choose>
	<c:when test="${orderVOList.isEmpty()}">
	</c:when>
	<c:otherwise>
	
		<div class="olTopBigBox">
			<div class="olTopMidBox">
				<div class="olTopestBox">
					<h2 class="olTopest">주문 상세정보</h2>
				</div>
				<div class="olTopBox">
					<h3 class="olTop olOrderNum">주문번호</h3>
					<h3 class="olTop olGoodsImg">제품사진</h3>
					<h3 class="olTop olGoodsNo">상품번호</h3>
					<h3 class="olTop olGoodsName">상품명</h3>
					<h3 class="olTop olQuan">수량</h3>
					<h3 class="olTop olOption1">옵션1</h3>
					<h3 class="olTop olOption2">옵션2</h3>
					<h3 class="olTop olSumPrice">합계</h3>
					<h3 class="olTop olRefund">반품</h3>
				</div>
				
				<div class="olOverFlowBox">
					<div class="olContentBigBox"> 
					<c:forEach var="orderVO" items="${orderVOList}">
						
						<div class="olUnit">
							<h5 class="orderDetailNum olOrderNum" name="${orderVO.orderDetailNum}">${orderVO.orderSeq}</h5>
							<div class="orderDetailNum olGoodsImg" name="${orderVO.orderDetailNum}">
								<img class="myPageOrderImg" alt="이미지가 없습니다."	onerror="this.src='<%=request.getContextPath()%>/img/noImage.png'"
											 src="${orderVO.goodsPhoto}">
							</div>
							<h5 class="orderDetailNum olGoodsNo" name="${orderVO.orderDetailNum}">${orderVO.goodsNo}</h5>
							<h5 class="orderDetailNum olGoodsName" name="${orderVO.orderDetailNum}">${orderVO.goodsName}</h5>
							<h5 class="orderDetailNum olQuan" name="${orderVO.orderDetailNum}">${orderVO.quantity}</h5>
							<h5 class="orderDetailNum olOption1" name="${orderVO.orderDetailNum}">${orderVO.opt1Name}</h5>
							<h5 class="orderDetailNum olOption2" name="${orderVO.orderDetailNum}">${orderVO.opt2Name}</h5>
							<h5 class="orderDetailNum olSumPrice olTextRight" name="${orderVO.orderDetailNum}">
							<fmt:formatNumber value="${orderVO.salePrice}" pattern="#,###"/>원</h5>
							<div class="orderDetailNum olRefund" name="${orderVO.orderDetailNum}">
								<c:choose>
									<c:when test="${orderVO.refund == 0}">
										<button class="refund" orderDetailNum="${orderVO.orderDetailNum}" orderSeq="${orderVO.orderSeq}" value="1">반품 요청</button>
									</c:when>
									<c:when test="${orderVO.refund == 1}">
										<button class="refund" orderDetailNum="${orderVO.orderDetailNum}" orderSeq="${orderVO.orderSeq}" value="0">반품 철회</button>
									</c:when>
									<c:when test="${orderVO.refund == 2}">
										<h5 class="olRefundH5">반품 완료</h5>
									</c:when>
								</c:choose>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="olCloseBox">
					<button class="olCloseBtn">닫기</button>
				</div>
			</div>
		</div>	
	</c:otherwise>
</c:choose>
<script type="text/javascript">

	//반품요청
	$('.refund').on('click', function(){
		var tableName = $('#tableName').val();
		var orderSeq = $(this).attr('orderSeq');
		var refund = $(this).val();
		var orderDetailNum = $(this).attr('orderDetailNum');
		
		$.ajax({
			url : '<%=request.getContextPath()%>/member/changeRefund?tableName=' 
					+ tableName + '&orderSeq=' + orderSeq + '&refund=' + refund + '&orderDetailNum=' + orderDetailNum,
			type : 'GET',
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				alert(data);
				loadOrderList(orderDetailNum);
			}
		});
	})
	
	$('.olCloseBtn').on('click',function(){
		$('#loadOrderList').hide();
	})
</script>