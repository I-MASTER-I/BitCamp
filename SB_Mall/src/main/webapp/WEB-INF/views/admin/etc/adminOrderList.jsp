<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="viewData" value="${viewData}"></c:set>
<table id="orderlist">
	<thead>
		<tr>
			<th class="">주문번호</th>
			<th class="">결제</th>
			<th class="">주문시간</th>
			<th class="">결제금액</th>
			<th class="">주문상태</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${viewData.objList.isEmpty()}">
				<tr>
					<td colspan="6" class="none-data">등록된 주문이 없습니다.</td>
				</tr>
		    </c:when>
			<c:otherwise>
				<c:forEach var="orderDetail" items="${viewData.objList}">
					<tr>
						<td>${orderDetail.orderDetailNum}
						</td>
						<td><c:choose>
								<c:when test="${orderDetail.payment == 0}">
                             	           무통장
                                    </c:when>
								<c:otherwise>
                                 	       카드
                                    </c:otherwise>
							</c:choose></td>

						<td>${orderDetail.orderTime}</td>
						<td><fmt:formatNumber value="${orderDetail.totalAmount}" pattern="#,###"/></td>
						<td class="">
						<button class="order"
								name="${orderDetail.orderDetailNum}" data-toggle="modal" data-target="#modalOrder">
								상세</button>
						<button class="status"
								name="${orderDetail.orderDetailNum}" data-toggle="modal">
									<c:choose>
										<c:when test="${orderDetail.status == 0}">
                                             	  입금전
                                            </c:when>
										<c:when test="${orderDetail.status == 1}">
                                           		  결제완
                                            </c:when>
										<c:when test="${orderDetail.status == 2}">
                 	                 	              배송전
                                            </c:when>
										<c:when test="${orderDetail.status == 3}">
                                        	        배송중
                                            </c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</button>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<script>
//주문상세버튼
$(document).ready(function() {
	order();
});

$('.status').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>/order/orderDetailStatus/' + $(this).attr('name'),
		dataType : "json",
		error : function(error) {
	        alert("Error!");
	    },
		success : function(orderDetail) {
			
			switch (orderDetail.status) {
			case 0: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("입금전");
				break;
			case 1: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("결제완");
				break;
			case 2: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("배송전");
				break;
			case 3: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("배송중");
				break;

			default:
				$('.status[name='+orderDetail.orderDetailNum+']').prop("disabled", true).html("배송완료");
				break;
			}
		}
	});
});

function order(){
	$('.order').click(function() {
		$.ajax({
			url : '<%=request.getContextPath()%>' + '/order/orderList/' + $(this).attr('name'),
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				$('#popupOrder').html(data);
			}
		});
	});
	}
</script>
