<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
</style>
<title>Insert title here</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>
<!-- midBannerBox -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<!-- 자유게시판 CSS -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/freeBoardRead.css">

</head>
<script type="text/javascript">
$(document).ready(function() { 
	$('#summernote').summernote({
		  height: 350,                 // set editor height
		  witdth: 1000,
		  minHeight: 300,             // set minimum height of editor
		  maxHeight: 800,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
		        }
			}
	});
	
});

function sendCode() {
    $('#freeBoard_text').val($('#summernote').summernote('code'));
    $('#freeBoard_form_id').submit();
}

</script>

<body>
<div class="commonBannerBox">
<h3 class="rowdCommonBannerH3">자유게시판</h3>
</div>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<form method="POST" action="insert">
<div id="freeboard_wrap_1">
<div id="freeboard_wrap_2">

	<!-- Start of Header -->
	<div id="freeboard_Header" >
	
		<!-- header_up : 게시글 번호, 날짜 -->
		<div id="header_up">
			<div id="header_up_boardSeq">${freeBoard.boardSeq}</div>
			<div id="header_up_boardWriteDate">${freeBoard.boardWriteDate}</div>
		</div><!-- end of header_up -->
		
		<!-- header_down : 제목, 조회수, 아이디 -->
		<div id="header_down">
			<div id="header_down_boardTitle">${freeBoard.boardTitle}</div>
			<div id="header_down_div">
				<img class="header_down_img" src="<%=request.getContextPath()%>/img/viewSeq01.png"> 
				<div id="header_down_viewSeq">${freeBoard.viewSeq}</div>
				<div id="header_down_writerName">${freeBoard.writerName}</div>
			</div>
		</div><!-- end of header_down -->
		
	</div><!-- End of div Header-->
	<hr id="header_hr">
	
	<!-- Start of Content -->
	<div id="freeboard_Content">
		${freeBoard.boardContent}
	</div><!-- End of div Content-->
	
	<!-- Start of Footer -->
	<div id="freeboard_Footer">
		
		<a 
		id="footer_button_Delete"
		href="<%=request.getContextPath()%>/freeBoard/delete?boardSeq=${freeBoard.boardSeq}&&userSeq=${freeBoard.userSeq}">
		<button type="button"  class="all_Button">삭제</button>
		</a>
		<a 
		id="footer_button_Modify"
		href="<%=request.getContextPath()%>/freeBoard/update?boardSeq=${freeBoard.boardSeq}&&userSeq=${freeBoard.userSeq}">
		<button type="button"  class="all_Button">수정</button>
		</a>
		<a 
		id="footer_button_List"
		href="<%=request.getContextPath()%>/freeBoard">
		<button type="button"  class="all_Button">목록</button>
		</a>
		
	</div><!-- End of div Footer-->
	
</div><!-- End of freeboard_wrap_1-->
</div><!-- End of freeboard_wrap_2-->
</form>

</body>
</html>