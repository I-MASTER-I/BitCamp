<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/freeBoard.css">
</head>

<body>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<h1>자유게시판</h1>
<div class="midBannerBox">
	<h3 class="rowdWriteBannerH3">얼리버드</h3>
</div>
	<div id="freeboard_wrap">
		<!-- Start of Header -->
		<div id="freeboard_Header">
			<button>최신순</button>
			<button>조회순</button>
			<div class="icon_search">
				<input type="text" id="icon_search_input"><img alt="" id="icon_search" src="<%=request.getContextPath()%>/img/icon_search.png">
			</div>
		</div><!-- End of div freeboard_header-->
		
		<!-- Start of Content -->
		<div id="freeboard_Content">
		</div><!-- End of div freeboard_Content-->
		
		<!-- Start of footer -->
		<div class="freeboard_Footer">
			<div class="write_button_right">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828"
			href="<%=request.getContextPath()%>/freeBoard/writePage"
			>글쓰기</a>
				
		</div>
		</div><!-- End of div freeboard_footer-->
		
	</div><!-- end of <div class="freeboard_wrap">-->
	
	
	<br>
	<br>
	<br>
	<br>
	<br>
	
	
	
	
	
	
	
	
	
		<table border="1" style="padding: 5px 0 5px 0;">

			<thead>
				<tr>
					<th><input type="checkbox" /></th>
					<th>게시글번호</th>
					<th>게시글제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
			</thead><!-- end of thead -->
			<tbody>
			<c:forEach items="${FreeBoardList}" var="freeBoard">
				<tr>
					<td><input type="checkbox" /></td>
					<td>${freeBoard.boardSeq}</td>
					<td><A href="<%=request.getContextPath()%>/freeBoard/select?boardSeq=${freeBoard.boardSeq}">${freeBoard.boardTitle}</A></td>
					<td>${freeBoard.viewSeq}</td>
					<td>${freeBoard.writerName}</td>
					<td>${freeBoard.boardWriteDate}</td>
				</tr>
			</c:forEach>
			</tbody><!-- end of tbody -->
		</table><!-- The end of Table -->
		
		
	<div class="freeboard_Button">
		<div class="write_button_right">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828"
			href="<%=request.getContextPath()%>/freeBoard/writePage"
			>글쓰기</a>
				
		</div>
		<div class="write_button_left">
			<a type="button" 
			class="btn my-4 btn-block"
			style="background-color: #ffc828"
			href="<%=request.getContextPath()%>/freeBoard"
			>전체글</a>
		</div>
	</div><!-- end of <div class="freeboard_Button"> -->

</body>
</html>