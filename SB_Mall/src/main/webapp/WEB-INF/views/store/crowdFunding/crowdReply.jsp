<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Gothic+A1:900|Open+Sans:300,300i,400,400i" rel="stylesheet">

    <script>
     var nowReply
   	 var tmp;
     var tmp2;
     var tmp3;
     var test;
	    $(document).ready(function(){
	    	
	    	//페이지 선택 시 function
	    	<%-- $.fn.pageSelectOnClickEvt = function(){
		    	$(this).on("click", function(){
		    		/* alert($(this).html()); */
		    		$.ajax({
		    			url:'<%=request.getContextPath()%>/reply',
		    			data: {page : $(this).html()},
			    		error: function(){
			    			alert("error");	
			    		},
			    		success:function(data){
			    			var reply = $(data).filter('#replyPaged').html();
		    				var page = $(data).filter('#paging').html();
		    				$('#replyGetBox').html(reply);
		    				$('#replyPageBox').html(page);
		    				$(".pageSelect").pageSelectOnClickEvt();
			    		}
		    		})
		    	})	
		    } --%>
		    
		    $('input[type="text"]').keydown(function() {
		        if (event.keyCode === 13) {
		            event.preventDefault();
		        }
		    });
		    
		  
	    
		   function replyCall(page) {
		    		$.ajax({
		    			url:'<%=request.getContextPath()%>/crowd/reply',
		    			data: {page : page},
			    		error: function(){
			    			alert("error");	
			    		},
			    		success:function(data){
			    			var findNum = $(data).find('.replyUnit').length;

			    			if(findNum>0){
				    			var aa = $(data).find($('div[class^="replyUnit"]'));
				    			
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
			    			 }else{
			    				var plzAdd = 
			    						'<div class="replyEmptyBox">'
			    						+'<h1 class="replyEmpty">후기가 없습니다. 첫 후기를 작성해주세요</h1>'
			    						+'</div>'
			    				
			    				$('#replyGetBox').html(plzAdd);
			    			}
		    				 
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
				   	url:'<%=request.getContextPath()%>/crowd/replyWrite',
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
				   	url:'<%=request.getContextPath()%>/crowd/reply/modify',
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
		   function replyDelete(crReplySeq){
			   $.ajax({
				   url:'<%=request.getContextPath()%>/crowd/replyDelete',
				  	data:{crReplySeq : crReplySeq},
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
		   
		   
		   //평점
		  $('.rating').on('mouseover',function(){
			var rating = 0;
			var index = $(this).attr('alt');
			var ratingImg = $('.rating');
			
			$(ratingImg).each(function(){
				if($(this).attr('alt')<=index){
					$(this).attr('src','<%=request.getContextPath()%>/img/star.png');
					rating++;
				}else{
					$(this).attr('src','<%=request.getContextPath()%>/img/star_em.png');
				}
				
			})
			
			$('.ratingNum').html(rating+'.0');
			$('.ratingHidden').val(rating);
			
			  
		  })
		   
		   
		   

	    	
	    	
	    	
	    });
	    
    </script>
 
    
    
    
    
    
    <div class="replylayout">
    	<h1 class="reply_h1" >상품 후기</h1>
    	
   		<form id="replyFormBox">
	    	<div class="replyInputBox">
	    		<div class="replyRightBox">
	    			<h3 class="reply_h3">후기 쓰기</h3>
	    		</div>
	    		
	    		<div class="replyLeftBox">
	    			<div class="ratingBox">
			    		<h3 class="reply_h3 ratingTitle">별점 주기</h3>
		    			<input type="hidden"  class ="ratingHidden" name="rating" value="5">
	    				<c:forEach begin="1" end="5" varStatus="count">
	    					<img src="<%=request.getContextPath()%>/img/star.png" alt="${count.index}" class="rating">
	    				</c:forEach>
	    				<h3 class="ratingNum">5.0</h3>
	    			</div>
	    			<br>
	    			<!-- 후기 입력창 -->
	    			<div class="replyTextClass replyTextAreaBox" style="border-radius:10px 0px 0px 10px;">
	   					<textarea class="replyInputText"  id="replyText" name="crReply"  style="resize: none;" placeholder="후기를 작성해주세요."></textarea>
	    			</div><input class="replyTextClass replyInputBtn" type="button" id="replyWrite" value="등록">
					
					<!-- 히든 상품넘버 -->
					<input  type="hidden" id="replyText" value="${boardSeq}" name="crowdBoardSeq" >
				</div>
	    			
	    	</div>
   		</form>
   		
   		
    	<div id="replyGetBox"></div>
    	<div id="replyPageBox"></div>
    	
    	
    </div>
    
    <div id="replyModifyBigBox">
	    <div id="replyModifyForm">
	    	<form id="replyModifyFormBox">
	    		<h4 id="replyModifyUserId"></h4><h6 id="replyTime"></h6>
	    		<input type="hidden" name="crReplySeq" id="replyModifyReplySeq">
	    		<textarea class="replyModifyText"  id="replyModify" name="crReply"  style="resize: none;" placeholder="댓글을 작성해주세요."></textarea>
	    		<a id="replyModifyCancel">취소</a>
	    		<a id="replyModifyConfirm">수정</a>
	    	</form>
	    </div>
    </div>
