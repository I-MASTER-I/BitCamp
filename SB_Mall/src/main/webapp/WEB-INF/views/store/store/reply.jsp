<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reply.css">
    <script>
     var nowReply
   	 var tmp;
     var tmp2;
     var tmp3;
	    $(document).ready(function(){
		    
		    $('input[type="text"]').keydown(function() {
		        if (event.keyCode === 13) {
		            event.preventDefault();
		        }
		    });
	    	
		   function replyCall(page) {
		    		$.ajax({
		    			url:'<%=request.getContextPath()%>/reply',
		    			data: {page : page},
			    		error: function(){
			    			alert("error");	
			    		},
			    		success:function(data){
			    			var reply = $(data).filter('#replyPaged').html();
		    				var page = $(data).filter('#paging').html();
		    				$('#replyGetBox').html(reply);
		    				$('#replyPageBox').html(page);
		    				//페이징 버튼 이벤트.
		    				$(".pageSelect").on('click', function() {
		    					   replyCall($(this).html());
		    				   })
		    				$('.replyDelete').on('click',function(){
		    					var deleteDo = confirm("삭제하시겠습니까?");
		    					if(deleteDo){
		    						replyDelete($(this).val());
		    					}
		    						
		    				})
		    				
		    				$('.replyModify').on('click',function(){
		    					var replySeq = $(this).val();
		    					var userId = $('.replyNum'+replySeq).find('.getReply_H4').html();
		    					var regTime = $('.replyNum'+replySeq).find('.getReply_H5').html();
		    					var reply = $('.replyNum'+replySeq).find('.getReply_H2').html();
		    					
		    					$('#replyModifyReplySeq').val(replySeq);
		    					$('#replyModifyUserId').html(userId);
		    					$('#replyTime').html(regTime);
		    					$('#replyModify').html(reply);
		    					
		    					$('#replyModifyBigBox').css('display','block');
		    				})//댓글 수정 이벤트연결 끝.
		    				
		    				
			    		}
		    		})
		   }
		   replyCall(1);
		   
		   
		   //댓글달기.
		   $('#replyWrite').on('click',function(){
			   var str = $('#replyText').val();
			   str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			   $('#replyText').val(str);
			   
			   var replyForm = $('#replyFormBox').serialize();
			   $.ajax({
				   	url:'<%=request.getContextPath()%>/replyWrite',
				   	type: "post",
				  	data:replyForm,
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				$('#replyText').val("");
		   				replyCall(1);
		   			}
			   })
		   })
		   
		    //댓글수정.
		   $('#replyModifyConfirm').on('click',function(){
			   var str = $('#replyModify').val();
			   str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			   $('#replyModify').val(str);
			   
			   var replyForm = $('#replyModifyFormBox').serialize();
			   $.ajax({
				   	url:'<%=request.getContextPath()%>/reply/modify',
				   	type: "post",
				  	data:replyForm,
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				$('#replyText').val("");
		   				replyCall(1);
		   				$('#replyModifyBigBox').css('display','none');
		   			}
			   })
		   })
		   
		   //댓글삭제.
		   function replyDelete(replySeq){
			   $.ajax({
				   url:'<%=request.getContextPath()%>/replyDelete',
				  	data:{replySeq : replySeq},
				   	error: function(){
		   				alert("error");	
		   			},
		   			success:function(data){
		   				replyCall(1);
		   			}
			   })
		   }
		   
		   //댓글 변경창 취소.
		   $('#replyModifyCancel').on('click',function(){
			   $('#replyModifyBigBox').css('display','none');
		   })
		   
	    });
	    
    </script>
    <div class="replylayout">
    	<h1 class="reply_h1" >상품 후기</h1>
    	<c:choose>
		    <c:when test="${memberInfo!=null}">
		    	<div class="replyInputBox">
		    		<h3 class="reply_h3">후기 쓰기</h3>
		    		<form id="replyFormBox">
		    			<div class="replyTextClass replyTextAreaBox" style="border-radius:10px 0px 0px 10px;">
		    				<textarea class="replyInputText" id="replyText" name="reply" 
		    				style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
		    			</div>
		    			<input class="replyTextClass replyInputBtn" type="button" id="replyWrite" value="등록">
		    			<input  type="hidden" id="replyText" value="${salSeq}" name="salesSeq" >
		    		</form>
		    	</div>
		    </c:when>
   		</c:choose>
   		
   		
    	<div id="replyGetBox"></div>
    	<div id="replyPageBox"></div>
    	
    	
    </div>
    
    <div id="replyModifyBigBox">
	    <div id="replyModifyForm">
	    	<form id="replyModifyFormBox">
	    		<div id="replyModifyInfoBox">
	    			<h4 id="replyModifyUserId"></h4><h6 id="replyTime"></h6>
	    			<br/>
	    			<a id="replyModifyCancel" class="replyModifyBtn">취소</a>
	    			<a id="replyModifyConfirm" class="replyModifyBtn">수정</a>
	    		</div>
	    		
	    		<input type="hidden" name="replySeq" id="replyModifyReplySeq">
	    		<textarea class="replyModifyText"  id="replyModify" name="reply"  style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
	    		
	    	</form>
	    </div>
    </div>
