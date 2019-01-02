<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="viewData" value="${viewData}"/>

	<table id="listTab" class="tablesorter resultTab">
		<thead>
			<tr>
				<th class="om0 sorter-false"><input type="checkbox" class="all-check"></th>
				<th class="om1">주문일</th>
				<th class="om2">주문번호</th>
				<th class="om3">회원</th>
				<th class="om4">이름</th>
				<th class="om5">배송지</th>
				<th class="om6">품목</th>
				<th class="om7">결제</th>
				<th class="om8">상태</th>
				<th class="om9">주문금액</th>
				<th class="notsorter"></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${viewData.isEmpty()}">
					<tr>
						<td colspan="10" style="text-align: center; padding: 120px 0;">등록된 주문이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="OrderDetailVO" items="${viewData.objList}">
						<tr>
							<td class="om0"><input type="checkbox" class="check" name="orderDetailNum" value="${OrderDetailVO.orderDetailNum}"></td>
							<td class="om1 orderResult" name="${OrderDetailVO.orderDetailNum}">${OrderDetailVO.orderTime}</td>
							<td class="om2 orderResult" name="${OrderDetailVO.orderDetailNum}">${OrderDetailVO.orderDetailNum}</td>
							<td class="om3 orderResult" name="${OrderDetailVO.orderDetailNum}">${OrderDetailVO.userSeq}</td>
							<td class="om4 orderResult" name="${OrderDetailVO.orderDetailNum}">${OrderDetailVO.userName}</td>
							<td class="om5 orderResult" name="${OrderDetailVO.orderDetailNum}">${OrderDetailVO.orderAddress}</td>
							<td class="om6 orderResult" name="${OrderDetailVO.orderDetailNum}">${OrderDetailVO.goodsName}</td>
							<td class="om7">
								<c:choose>
									<c:when test="${OrderDetailVO.payment == 0}">
										현금
									</c:when>
									<c:when test="${OrderDetailVO.payment == 1}">
										카드
									</c:when>
								</c:choose>
							</td>
							
							<td class="om8">
								<c:choose>
									<c:when test="${OrderDetailVO.status == 0}">
										입금전
									</c:when>
									<c:when test="${OrderDetailVO.status == 1}">
										결제완료
									</c:when>
									<c:when test="${OrderDetailVO.status == 2}">
										배송준비
									</c:when>
									<c:when test="${OrderDetailVO.status == 3}">
										배송중
									</c:when>
									<c:when test="${OrderDetailVO.status == 4}">
										배송완료
									</c:when>
								</c:choose>
							</td>
							
							<td class="om9">
								<fmt:formatNumber value="${OrderDetailVO.totalAmount}" pattern="#,###"/>
								원
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br>
	<div class="t-left">
		<span>
			<input type="checkbox" id="all-check" class="all-check" style="margin-top: 6px; vertical-align: top; margin-left: 9px;">
		</span>
		<span class="fon12">
			<label for="all-check" class="all-label">
				선택한 주문을
			</label>
		</span>
		<span>
			<select id="changeStatus">
				<option value="1" selected="selected">결제완료</option>
				<option value="2">배송준비</option>
				<option value="3">배송중</option>
				<option value="4">배송완료</option>
				<option value="0">입금전</option>
			</select>
		</span>
		<span class="fon12">
			(으)로
		</span>
		<span>
			<input type="submit" id="update" class="update" value="변경">
		</span>
	</div>
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
						<li class="page-item active"><a id="currentPage" class="page-link" name="1">1<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="${viewData.startPage}"
							end="${viewData.endPage}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active"><a id="currentPage" class="page page-link"
								name="${i.index}">${i.index}<span class="sr-only">(current)</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
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



	
	$(document).ready(function(){
		
		//테이블 정렬
		addParser();
		//테이블 일부 정렬 비활성
		$(".tablesorter").tablesorter(
			{  headers : {
		 		      0 : {sorter : false},
// 		 		      3 : {sorter : false},
		 		      9 : {sorter : 'NumberSort'}
				 	}
			}
		);
		
		//loadOrderList.jsp를 불러오는 함수
		function loadOrderList(pageNumber){
			
		 	var startDate = $( "#startDate" ).val();
		 	var endDate = $( "#endDate" ).val();
			var tableName = $('#tableName').val();
			var status = $('#status').val();
			var payment = $('#payment').val();
			var search = $('#search').val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOrder/orderManager/loadOrderList?startDate=' 
						+ startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber
						+ '&status=' + status + '&payment=' + payment + '&search=' + search,
				type : 'GET',
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#loadOrderList').html(data);
				}
			});
		}
		
		//페이지 번호를 클릭하면 다시 불러온다.
		$('.page').off('click').click(function() {
			var pageNumber = $(this).attr('name');
			loadOrderList(pageNumber);
		});
		
		//검색창에서 엔터를 누르면 다시 불러온다.
		$('#search').off('keydown').keydown(function(key) {
			if (key.keyCode == 13) {
				loadOrderList(1);
			}
		});
		
		//조회 버튼을 클릭하면 다시 불러온다.
		$('#select').off('click').click(function() {
			loadOrderList(1);
			
		});
		
		//all-check를 클릭하면 모든 check가 클릭된다.
		$(".all-check").change(function () {
		    $(".check").prop('checked', $(this).prop("checked"));
		});
		
		//orderResult.jsp를 불러오는 함수
		function orderResult(orderBackVO){
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOrder/orderManager/loadOrderList/orderResult',
				method : 'POST',
				type: "json",
				data : JSON.stringify(orderBackVO),
				contentType: "application/json",
				error : function(error) {
					console.log(error);
			        alert("잘못된주문입니다!");
			    },
				success : function(data) {
					$('#rightContent').html(data);
				}
			});
			
			
		}
		
		//테이블 td 클릭시 해당 주문 조회
		$('.orderResult').on('click', function(){
			
			//POST로 보낼 객체를 생성 후  키 값을 할당한다.
			var orderBackVO = {};
			orderBackVO.orderDetailNum = $(this).attr('name');
			orderBackVO.pageNumber = ${viewData.currentPageNumber};
			orderBackVO.startDate = $( "#startDate" ).val();
			orderBackVO.endDate = $( "#endDate" ).val();
			orderBackVO.tableName = $('#tableName').val();
			orderBackVO.status = $('#status').val();
			orderBackVO.payment = $('#payment').val();
			orderBackVO.search = $('#search').val();
			
			//주문 상세를 불러온다.
			orderResult(orderBackVO);
			
			
		})
		
		//선택한 항목을 업데이트
		$('#update').on('click', function(){
			//선택한 항목을 배열로 만들어준다.
			
		    var orderlength = $("input[name='orderDetailNum']:checked").length;
			if (orderlength > 0) {
			    var orderDetailArray = new Array(orderlength);
			    for(var i=0; i<orderlength; i++){                          
			    	orderDetailArray[i] = $("input[name='orderDetailNum']:checked")[i].value;
			    }
				
			    var status = $('#changeStatus').val();
			    var tableName = $('#tableName').val();
			    
				$.ajax({
					url : '<%=request.getContextPath()%>/admin/adminOrder/orderManager/loadOrderList/changeStatus/' + status + '/' + tableName,
					method : 'POST',
					type: "json",
					data : JSON.stringify(orderDetailArray),
					contentType: "application/json",
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						alert(data);
						//기본 화면으로 불러온다. 여기서는 주문 관리
						$('#rightContent').load('<%=request.getContextPath()%>/admin/adminOrder/orderManager');
					}
				});
			} else {
				alert("선택된 주문이 없습니다.");
			}
		});
		
		
		

		
	//$(document).ready의 끝
	});
	
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	