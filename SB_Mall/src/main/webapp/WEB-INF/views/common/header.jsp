<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/default.css">
<link
	href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i"
	rel="stylesheet">
<body>

	<script type="text/javascript">
	<c:if test="${errorMsg!=null}">
	      alert('${errorMsg}');
	</c:if>
	</script>
	
	<div id="headerFullWidth">
		<!-- member관련 메뉴 -->
			<div class="memberNabiBox">
				<div class="memberNaviLayout">
					<div class="memberNavi">
					
						<c:choose>
							<c:when test='${memberInfo eq null}'>
								<a class="memberNaviText"
									href="<%=request.getContextPath()%>/member/login">로그인</a>
								<a class="memberNaviText"
									href="<%=request.getContextPath()%>/member/join">회원가입</a>
							</c:when>
							<c:otherwise>
								<a class="memberNaviText"
									href="<%=request.getContextPath()%>/member/logout">로그아웃</a>
								<a class="memberInfoDrop">${memberInfo.userName}</a>
								<a class="memberNaviText"
									href="<%=request.getContextPath()%>/member/myPage">MY</a>
								<a class="memberNaviText"
									href="<%=request.getContextPath()%>/order/cart">장바구니</a>
								
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
			</div>
		<div id="headerLayout">
		
			<!-- 로고 및 메뉴바. -->
			<div id="headerNavi">
				<a href="<%=request.getContextPath()%>/"> <img id="headerLogo"
					src="<%=request.getContextPath()%>/img/SBCompanyLogo.png">
				</a>
				

				
				<div class="headerRightMenuBox">
					<a class="headerNaviUnit"
						href="<%=request.getContextPath()%>/store">스토어</a>
					<a class="headerNaviUnit"
						href="<%=request.getContextPath()%>/crowd/crowdBoard">얼리버드</a>
					<%-- <a class="headerNaviUnit"
						href="<%=request.getContextPath()%>/crowd/crowdWritePage">crowdWritePage</a> --%>
						
					<!-- 커뮤니티 -->
					<div class="headerDropBox">
						<a class="headerDrop">커뮤니티</a>
						
						<div class="headerSubDrop">
							<a class="subDropUnit" href="<%=request.getContextPath()%>/qna">질문게시판</a>
							<div class="lineInSub"></div>
							<a class="subDropUnit" href="<%=request.getContextPath()%>/freeBoard">자유게시판</a>
						</div>
						
					</div>
					
					<a class="headerNaviUnit" href="<%=request.getContextPath()%>/subway">지하철</a>
					<a class="headerNaviUnit" href="<%=request.getContextPath()%>/weather">날씨</a>
				</div>
				
			</div>

		</div>
	</div>


</body>
