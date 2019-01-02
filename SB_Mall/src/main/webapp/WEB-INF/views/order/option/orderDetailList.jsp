<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<style>
.order_last_td {
	width : 220px !important;
	padding-top: 5px !important; 
	padding-bottom: 5px !important;
}
</style>
<c:set var="viewData" value="${viewData}"></c:set>
<c:choose>
	<c:when test="${viewData.isEmpty()}">
            등록된 주문이 없습니다.
    </c:when>
	<c:otherwise>
		<div class="px-4" style="text-align: center;"> 

			<div class="table-wrapper" style="text-align: center;">
				<!--Table-->
				<table class="memList table table-hover mb-0">

					<!--Table head-->
					<thead>
						<tr>

							<th class="th-lg">주문상세번호</th>
							<th class="th-lg">회원번호</th>
							<th class="th-lg">결제수단</th>
							<th class="th-lg">주문시간</th>
							<th class="th-lg">결제금액</th>
							<th class="th-lg">주문상태</th>
						</tr>
					</thead>
					<!--Table head-->

					<!--Table body-->
					<tbody>
						<c:forEach var="orderDetail" items="${viewData.objList}">
							<tr>
								<td>${orderDetail.orderDetailNum}</td>
								<td><a
									href="<%=request.getContextPath()%>/memberInfo/member?userSeq=${orderDetail.userSeq}">${orderDetail.userSeq}</a>
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
								<td class="order_last_td">
								<button class="status btn btn-blue-grey"
										name="${orderDetail.orderDetailNum}" data-toggle="modal" style="padding: 2px 5px; width: 80px; ">
											<c:choose>
												<c:when test="${orderDetail.status == 0}">
                                                     	  입금미확인
                                                    </c:when>
												<c:when test="${orderDetail.status == 1}">
                                                   	  결제완료
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
									<button class="order memberDelete btn btn-blue-grey"
										name="${orderDetail.orderDetailNum}" data-toggle="modal" data-target="#modalOrder" style="padding: 2px 5px; width: 80px">
										주문상세</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
				<br>
				<!--Table-->
				<nav aria-label="Page navigation example">
					<ul class="pagination pg-dark">
						<c:choose>
							<c:when test="${viewData.currentPageNumber == 1}">
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber}">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber - 1}">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						
						<c:forEach varStatus="i" begin="1"
							end="${viewData.pageTotalCount}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active" style="back"><a class="page page-link"
								name="${i.index}">${i.index}<span class="sr-only">(current)</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
								name="${i.index}">${i.index}</a></li>
							</c:otherwise>
							</c:choose>
							
						</c:forEach>
						
						
						<c:choose>
							<c:when test="${viewData.currentPageNumber == viewData.pageTotalCount}">
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber}">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
									name="${viewData.currentPageNumber + 1}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>

	</c:otherwise>
</c:choose>
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
		/*  alert(orderDetail.status); 
			$('.status[name='+orderDetail.orderDetailNum+']').attr('name', orderDetail.orderDetailNum); */
			
			switch (orderDetail.status) {
			case 0: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("입금미확인");
				break;
			case 1: 
				$('.status[name='+orderDetail.orderDetailNum+']').html("결제완료");
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

$('.page').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/order/orderDetailList?page=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#viewList').empty();
			$('#viewList').append(data);
		}
	});
});
</script>
