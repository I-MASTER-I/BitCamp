<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.10.0.js"></script>

<script>

	<%-- $(document).ready(function(){
		//댓글달기.
		   $('#qnaWrite').on('click',function(){
			   var qnaForm = $('#qnaFormBox').serialize();
			   $.ajax({
				   	url:'<%=request.getContextPath()%>/qnawrite',
				   	type: "post",
				  	data:qnaForm,
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				$('#qTitle').val("");
		   				$('#qText').val("");
		   			}
			   })
		   })
	}); --%>

</script>

</head>
<body>

<h1>
    게시판 등록하기  
</h1>
    
    <!-- <form id="qnaFormBox"> -->
    <form action="qnaWrite" method="POST">
        <div class="createForm">
            <label >제목</label>
            <input type="text" name="qtitle" class="createForm" placeholder = "QnA 제목">
        </div>
        <div class="createForm">
            <label >내용</label>
            <textarea rows="4" cols="15" name="qtext" class="createForm" placeholder = "QnA 내용"></textarea>
        </div>

        <div class="Formfooter">
                <button type="submit" id="qnaWrite" class="btn_button">작성하기</button>
        </div>
        
    </form>


</body>
</html>