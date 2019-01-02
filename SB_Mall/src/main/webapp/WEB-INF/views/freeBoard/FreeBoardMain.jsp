<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/freeBoardMain.css">
</head>

<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- <h1>자유게시판</h1> -->
<div class="commonBannerBox">
	<h3 class="rowdCommonBannerH3">자유게시판</h3>
</div>


	<div id="freeboard_wrap_1">
		<div id="freeboard_wrap_2">
		
		
			<!-- Start of Header -->
			<div id="freeboard_Header">
				<button class="all_Button">최신순</button>
				<button class="all_Button">조회순</button>
				<span id="icon_Search_span">
					<input type="text" id="icon_Search_input"><img alt="" id="icon_search_img" src="<%=request.getContextPath()%>/img/icon_search.png">
				</span>
			</div><!-- End of div freeboard_header-->
			
			<!-- Start of Content -->
			<div id="freeboard_Content">
				 
				<c:forEach items="${FreeBoardList}" var="freeBoard">
				<div class="contentBox">
					<!--상단 :게시글 번호, 날짜-->
					<div class="content_up">
						<div class="boardSeqBox">#${freeBoard.boardSeq}</div>
						<div class="boardWriteDateBox">${freeBoard.boardWriteDate}</div>
					</div><!-- End of div up -->
					<!--하단 : 게시글 제목, 조회수, 아이디  -->
					<div class="content_down">
						<div class="boardTitleBox"><A class="boardTitleFont" href="<%=request.getContextPath()%>/freeBoard/select?boardSeq=${freeBoard.boardSeq}">${freeBoard.boardTitle}</A></div>
						
						<div class="content_down_rightBox">
							<img class="viewSeqImg" src="<%=request.getContextPath()%>/img/viewSeq01.png">
							<div class="viewSeqBox">${freeBoard.viewSeq}</div>
							<div class="writerNameBox">${freeBoard.writerName}</div> 
						</div>
					</div><!-- End of div down -->
				</div>
<!-- 				<hr class="content_hr"> -->
				</c:forEach>
			</div><!-- End of div freeboard_Content-->
			
			<!-- Start of footer -->
			<div id="freeboard_Footer">
				<a type="button" 
				
				href="<%=request.getContextPath()%>/freeBoard/writePage"
				><button id="button_write" class="all_Button">글쓰기</button></a>
			
			</div><!-- End of div freeboard_footer-->
	
		</div><!-- end of <div class="freeboard_wrap_2">-->
	</div><!-- end of <div class="freeboard_wrap_1">-->
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>