<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>

	
	<!-- 게시물 공간 -->
	<div class="crBoardList">
	
		<c:forEach var="list" items="${boardList}" varStatus="countNum">
			
			<!-- 게시판 유닛 빅 박스 -->
			<div class="boardMidBox">
				<!-- 이미지 -->
				<div class="boardPhotoBox">
					<a href="<%=request.getContextPath()%>/crowd/crowdDetail/${list.crowdBoardSeq}">
						<img src="${list.crPhoto}" class="boardPhoto">
					</a>
				</div>
				
				<!-- 제목 & 조회수 -->
				<div class="titleBox">
					<div class="boardTitleBox">
						<h4 class="boardTitle"> ${list.title}</h4>
					</div>
				</div>
				
				<!-- 가격 정보 -->
				<div class="priceBox">
					<h5 class="price"><fmt:formatNumber value="${list.crPrice}" pattern="#,###"/>원</h5>
					
					<!-- 조회수 -->
					<div class="viewBox">
							<img class="viewImg" src="<%=request.getContextPath()%>/img/viewSeq01.png">
						<h6 class="ib viewH6">&nbsp; ${list.viewSeq}</h6>
					</div>
				</div>
				
				<!-- 달성률 & 남은날짜 -->
				<div class="targetBox">
					<div class="targetBar">
						<c:choose>
							<c:when test="${list.achieve<100}">
								<div class="achieveBar" style="width:${list.achieve}%"></div>
							</c:when>
							<c:when test="${list.achieve>100}">
								<div class="achieveBar" style="width:100%"></div>
							</c:when>
						</c:choose>
					</div>
					<!-- 달성 퍼센트 -->
					<div class="targetPcBox ib">
						<h4 class="ib achHigh"><fmt:formatNumber value="${list.achieve}" pattern="#"/>%</h4>
					</div>
					<!-- 달성금액 -->
					<div class="achievePriceBox ib">
						<h5 class="ib achMid"><fmt:formatNumber value="${list.totalOrderPrice}" pattern="#,###"/>원</h5>
					</div>
					
					<div class="leftDayBox ib"><h5 class="achMid ib">${list.leftDays}일 남음</h5></div>
				</div>
				
			</div>
			
		</c:forEach>
		<c:if test="${doAdd!=0}">
			<c:forEach begin="1" end="${doAdd}" step="1">
				<div class="boardMidBox">
					<div class="boardPhotoBox"></div>
				</div>
			</c:forEach>
		</c:if>
		
	</div>
	
	<div class="pagingBox">
		<c:forEach begin="1" end="${paging}" varStatus="status">
			
			<c:choose>
				<c:when test="${nowPage==status.index}">
					<div class="nowPage ib"><h6 class="pagingBtn">${status.count}</h6></div>
				</c:when>
				<c:when test="${nowPage!=status.index}">
					<div class="pagingBtnBox ib"><h6 class="pagingBtn">${status.count}</h6></div>
				</c:when>
			
			</c:choose>
			
		</c:forEach>
	</div>



