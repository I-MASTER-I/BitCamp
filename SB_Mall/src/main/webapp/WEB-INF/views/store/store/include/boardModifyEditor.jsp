<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Store Board Editor</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.3/summernote.js"></script>

<script type="text/javascript">
	$(document).ready(function() { 
		$('.rowdCommonBannerH3').text('Modify');
		$('#summernote').summernote({
			  height: 750,                 // set editor height
			  minHeight: 500,             // set minimum height of editor
			  maxHeight: 1200,             // set maximum height of editor
			  focus: true,                  // set focus to editable area after initializing summernote
			  callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}
		});
		$('#title').val('${salesBoard.title}');
		$('.panel-body').html('${salesBoard.text}');
	});
	function sendCode() {
        $('#text').val($('#summernote').summernote('code'));
        $('#sform').submit();
        
    }
	
	function viewBoard() {
        location.href="<%=request.getContextPath()%>/store/board/${param.salSeq}";
    }
	
	function mathABS(e) {
		e.value = Math.abs(e.value); //number 인풋에 자연수만 들어가도록 변경
	}
	
	function sendFile(file, el) {
		var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
        	data: form_data,
        	type: "POST",
        	url: '<%=request.getContextPath()%>/store/summer/imgUpload',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
          		$(el).summernote('editor.insertImage', 
          						'<%=request.getContextPath()%>/'+img_name);
        	}
      	});
    }
</script>
</head>
<body>
	<c:if test="${userGrade<3}">
		<script type="text/javascript">
			alert("운영진만 수정이 가능합니다.");
			location.href="<%=request.getContextPath()%>/store";
		</script>
	</c:if>
	<div id="summernoteBox">
		<form method="post" enctype="multipart/form-data" id="sform">
			<input type="text" class="modifyTitle" name="title" required="required" id="title"><br>
			<hr>
			<input type="hidden" name="text" id="text">
			<input type="hidden" name="salesSeq" value="${param.salSeq}">
		</form>
		<div id="summernote"></div>
		<button type="button" class="storeBtn storeWriteBtn" onclick="sendCode();">수정완료</button>
		<button type="button" class="storeBtn storeWriteBtn" onclick="viewBoard();">목록으로</button>
	</div>
		
</body>
</html>