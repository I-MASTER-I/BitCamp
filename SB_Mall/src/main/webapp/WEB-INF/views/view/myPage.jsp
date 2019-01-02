<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>내정보</title>
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<!-- joinForm.css -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/myPage.css">
</head>
<body>

<div class="commonBannerBox">
	<h3 class="rowdCommonBannerH3">마이페이지</h3>
</div>

	<!-- Start of Header : memberInfo.userId-->
	<div id="freeboard_Header">
		<div id="fb_Header_UserID">${memberInfo.userId}</div>
	</div><!-- End of div freeboard_header-->
	
	
	<!-- Start of Content : ${memberInfo.userName},${memberInfo.gradeNum == 0} ,${memberInfo.point},${memberInfo.userAmount}-->
	<div id="freeboard_Content">
			<div id="fb_Content_Name" class="fbContent">
				<div class="content_Font1">회원이름</div>
				<div class="content_Font2">${memberInfo.userName}</div>
			</div>
			
			<div class="myLine"></div>
			
			<div id="fb_Content_Grade" class="fbContent">
				<div class="content_Font1">회원등급</div>
				<div class="content_Font2">
				<c:choose>
				    <c:when test="${memberInfo.gradeNum == 0}">
				       	 정회원
				    </c:when>
				    <c:when test="${memberInfo.gradeNum == 1}">
				    	우수회원
				    </c:when>
				    <c:when test="${memberInfo.gradeNum == 2}">
				   		VIP
				    </c:when>
				    <c:when test="${memberInfo.gradeNum == 3}">
				   		관리자
				    </c:when>
				    <c:when test="${memberInfo.gradeNum == 4}">
				   		대표
				    </c:when>    
				</c:choose>
				</div>
			</div>
			
			<div class="myLine"></div>
			
			<div id="fb_Content_Point" class="fbContent">
				<div class="content_Font1">마일리지</div>
				<div class="content_Font2">${memberInfo.point} 원</div>
			</div>
			
			<div class="myLine"></div>
			
			<div id="fb_Content_Amount" class="fbContent">
				<div class="content_Font1">총 구매금액</div>
				<div class="content_Font2">${memberInfo.userAmount} 원</div>
			</div>
			
			<div id="content_button_wrap">
				<!-- Sign up button -->
  				<button class="originModifyBtn all_Button" name="${member.userId}" grade="${member.gradeNum}"
    			data-toggle="modal" data-target="#modalCart">수정하기</button>
   				<button class="memberDelete all_Button" name="${member.userId}" grade="${member.gradeNum}">탈퇴하기</button>
			</div>
	</div><!-- End of div freeboard_Content-->
	
<!-- 	주문 목록 Ajax로 불러온다.-->
	<div class="tableNameBox">
		<select id="tableName">
			<option value="OrderDetail" selected="selected">일반주문</option>
			<option value="CrowdOrderDetail">얼리버드</option>
		</select>
	</div>
	<div id="loadOrderDetailList"></div>

<!-- Modal: 회원수정 -->
<div class="modal-dialog" role="document">
	<div class="modal-content">
		<!--Header-->
		<div class="modal-header" style="border: none">
		  <h4 class="modal-title" id="myModalLabel">회원 수정</h4>
		</div>
		<!--Body-->
		<form id="memberModify">
			<div class="modal-body">
			       
			</div>
			<!--Footer-->
			<div class="modal-footer">
				<input type="button" class="myModalbtn modalBtnClose" data-dismiss="modal" value="닫기">
				<input type="button" class="myModalbtn modalBtnModify" data-dismiss="modal" value="수정">
			</div>
		
		</form>
	</div>
</div>

<!-- 회원 수정 전 비번 확인 -->
<div class="modal1Box">
	<div class="modal1SubBox">
		<div class="modal1Unit1">
			<h3 class="modal1UserId">${memberInfo.userId}</h3>
		</div>
		
		<div class="modal1Unit2">
			<h4 class="modal1H4">비밀번호 확인</h4>
			<div class="modal1InputBox">
				<input class="modal1Input" type="password">
			</div>
		</div>
		
		<div class="modal1BtnBox">
			<button class="modal1Btn modalBtnClose">닫기</button>
			<button class="modal1Btn memberModify">확인</button>
		</div>
	</div>
</div>

<!-- Modal2: 주문 내역 -->
<div class="">
	<div id="loadOrderList" class="modal2SubBox">
	</div>
</div>


<script>

//시작시 기본으로 주문목록 불러온다.
$('#loadOrderDetailList').load('<%=request.getContextPath()%>/member/loadOrderDetailList?pageNumber=1&tableName=OrderDetail&userSeq=' + ${memberInfo.userSeq});


//loadOrderList.jsp를 불러오는 함수
function loadOrderDetailList(pageNumber){
	
	var tableName = $('#tableName').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/member/loadOrderDetailList?pageNumber='+ pageNumber +'&tableName='+ tableName + '&userSeq=' + ${memberInfo.userSeq},
		type : 'GET',
		error : function(error) {
	        alert("Error!");
	    },
		success : function(data) {
			$('#loadOrderDetailList').html(data);
		}
	});
}



/* modal1 열기 */
$('.originModifyBtn').on('click',function(){
	$('.modal1Box').show();
})

/* modal1 닫기 */
$('.modalBtnClose').on('click',function(){
	$('.modal1Box').hide();
	$('.modal-dialog').hide();
})


/* modal 비밀번호 전송 */
$('.memberModify').click(function() {
		
		console.log('id : '+$('.modal1UserId').html()+', +pw : '+$('.modal1Input').val());
	
		$.ajax({
		url : '<%=request.getContextPath()%>/member/memberModifyCheck',
		data : {
			id : $('.modal1UserId').html(),
			pw : $('.modal1Input').val()
		},
		type: 'POST' ,
		error : function(error) {
	        alert("장난치삼?");
	    },
		success : function(data) {
			var size = $(data).find('.myModalUnit').length;
			
			if(size!=0){
				$('.modal-body').html(data);
				pwChekcFunc();
				$('.modal-dialog').show();
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
			$('.modal1Box').hide();
		}
	});
});


function pwChekcFunc(){
	$('.pwChk').off();
	$('.pwChk').keyup(function(){
		var pw1 = $('.pwCheckInput1').val();
		var pw2 = $('.pwCheckInput2').val();
		
		if(pw1==pw2){
			$('.pwCheckBox').html('<h3 class="pwCheckSuccess">비밀번호가 일치합니다.</h3>');
		}else{
			$('.pwCheckBox').html('<h3 class="pwCheckFail">비밀번호가 일치하지 않습니다.</h3>');
		}
	})
}


/* modal2 변경버튼 */
$('.modalBtnModify').click(function() {
	var pw1 = $('.pwCheckInput1').val();
	var pw2 = $('.pwCheckInput2').val();
	
	if(pw1==pw2){
		$.ajax({
			url : '<%= request.getContextPath() %>/member/memberModify',
			type : 'POST',
			data : $('#memberModify').serialize(),
			error : function(error) {
				alert("장난치삼?");
		    },
			success : function(result) {
				alert(result);
				window.location.reload();
			}
		});
	}else{
		alert("비밀번호가 일치하지 않습니다.");
	}
	
});

//회원 삭제버튼
$('.memberDelete').click(function() {
	var del = confirm('정말 탈퇴하시겠습니까? 후회하실텐데?');
	
	if (del) {
	$.ajax({
		url : '<%=request.getContextPath()%>/member/memberDelete?userId=' +  '${memberInfo.userId}',
		error : function(error) {
			alert("장난치삼?");
	    },
		success : function(result) {
			alert(result);
			location.href= '<%=request.getContextPath()%>/';
		}
	});
	}
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- Header -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>

</body>
</html>