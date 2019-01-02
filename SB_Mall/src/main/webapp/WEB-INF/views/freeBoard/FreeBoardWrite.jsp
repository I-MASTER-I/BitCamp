<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
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
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/freeBoardWrite.css">

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
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="commonBannerBox">
<h3 class="rowdCommonBannerH3">글쓰기</h3>
</div>
<form method="POST" action="insert" id="freeBoard_form_id">
<div id="freeboard_wrap_1">
<div id="freeboard_wrap_2">

	<!-- Start of Header -->
	<div id="freeboard_Header" >
		<input id="header_Input" type="text" name="boardTitle" placeholder="제목을 입력해 주세요" required>
	</div><!-- End of div Header-->
	<hr id="header_hr">
	
	<!-- Start of Content -->
	<div id="freeboard_Content">
		<input type="hidden" id="freeBoard_text" name="boardContent">
		<div id="summernote"></div>	
	</div><!-- End of div Content-->
	
	<!-- Start of Footer -->
	<div id="freeboard_Footer">
		
		<a id="footer_button_Cancel" href="<%=request.getContextPath()%>/freeBoard">
			<div class="all_Button">취소</div>
		</a>
		<button class="all_Button" id="footer_button_Write"	onclick="sendCode();">
			쓰기
		</button>
		
	</div><!-- End of div Footer-->
	
</div><!-- End of freeboard_wrap_1-->
</div><!-- End of freeboard_wrap_2-->
</form>


</body>
</html>