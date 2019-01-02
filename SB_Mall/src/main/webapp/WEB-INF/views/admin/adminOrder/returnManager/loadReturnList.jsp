<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="viewData" value="${viewData}"/>

	<table id="resultTable" class="tablesorter resultTab">
		<thead>
			<tr>
				<th class="rm0 sorter-false"><input type="checkbox" class="all-check"></th>
				<th class="rm1">주문번호</th>
				<th class="rm2">회원</th>
				<th class="rm3">주문자</th>
				<th class="rm4">상품번호</th>
				<th class="rm5">상품명</th>
				<th class="rm6">수량</th>
				<th class="rm7">옵션1</th>
				<th class="rm8">옵션2</th>
				<th class="rm9">상태</th>
				<th class="rm10">합계</th>
				<th class="notsorter"></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${viewData.isEmpty()}">
					<tr>
						<td colspan="11" style="text-align: center; padding: 120px 0;">반품 요청이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="ReturnVO" items="${viewData.objList}">
						<tr>
							<td class="rm0"><input type="checkbox" class="check" name="orderSeq" value="${ReturnVO.orderSeq}"></td>
							<td class="rm1">${ReturnVO.orderSeq}</td>
							<td class="rm2">${ReturnVO.userSeq}</td>
							<td class="rm3">${ReturnVO.userName}</td>
							<td class="rm4">${ReturnVO.goodsNo}</td>
							<td class="rm5">${ReturnVO.goodsName}</td>
							<td class="rm6">${ReturnVO.quantity}</td>
							<td class="rm7">${ReturnVO.opt1Name}</td>
							<td class="rm8">${ReturnVO.opt2Name}</td>
							<td class="rm9">
								<c:choose>
									<c:when test="${ReturnVO.refund == 1}">
										반품대기
									</c:when>
									<c:when test="${ReturnVO.refund == 2}">
										반품완료
									</c:when>
								</c:choose>
							</td>
							<td class="rm10">
								<fmt:formatNumber value="${ReturnVO.salePrice}" pattern="#,###"/>
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
			<select id=changeRefund>
				<option value="2" selected="selected">반품완료</option>
				<option value="1">반품대기</option>
				<option value="0">반품철회</option>
			</select>
		</span>
		<span class="fon12">
			로
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
		 		      10 : {sorter : 'NumberSort'}
				 	}
			}
		);
		
		//loadReturnList.jsp를 불러오는 함수
		function loadReturnList(pageNumber){
			
		 	var startDate = $( "#startDate" ).val();
		 	var endDate = $( "#endDate" ).val();
			var tableName = $('#tableName').val();
			var refund = $('#refund').val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOrder/returnManager/loadReturnList?startDate=' 
						+ startDate + '&endDate=' + endDate + '&tableName='+ tableName +'&pageNumber='+ pageNumber
						+ '&refund=' + refund,
				type : 'GET',
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#loadReturnList').html(data);
				}
			});
		}
		
		//페이지 번호를 클릭하면 다시 불러온다.
		$('.page').off('click').click(function() {
			var pageNumber = $(this).attr('name');
			loadReturnList(pageNumber);
		});
		
		//조회 버튼을 클릭하면 다시 불러온다.
		$('#select').off('click').click(function() {
			loadReturnList(1);
		});
		
		//검색창에서 엔터를 누르면 다시 불러온다.
		$('#search').off('keydown').keydown(function(key) {
			if (key.keyCode == 13) {
				loadReturnList(1);
			}
		});
		
		//all-check를 클릭하면 모든 check가 클릭된다.
		$(".all-check").change(function () {
		    $(".check").prop('checked', $(this).prop("checked"));
		});
		
		//선택한 항목을 업데이트
		$('#update').off('click').on('click', function(){
			
			//선택한 항목을 배열로 만들어준다.
		    var orderlength = $("input[name='orderSeq']:checked").length;
		    var orderArray = new Array(orderlength);
		    for(var i=0; i<orderlength; i++){                          
		    	orderArray[i] = $("input[name='orderSeq']:checked")[i].value;
		    }
			
		    var refund = $('#changeRefund').val();
		    var tableName = $('#tableName').val();
		    
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminOrder/returnManager/loadReturnList/refund/' + refund + '/' + tableName,
				method : 'POST',
				type: "json",
				data : JSON.stringify(orderArray),
				contentType: "application/json",
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					alert(data);
					//기본 화면으로 불러온다. 여기서는 주문 관리
					$('#rightContent').load('<%=request.getContextPath()%>/admin/adminOrder/returnManager');
				}
			});
		});
		
		
		

		
	//$(document).ready의 끝
	});
	
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	