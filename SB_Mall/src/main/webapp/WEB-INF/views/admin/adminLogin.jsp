<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>통합 관리자 : 로그인</title>
<%@ include file="/WEB-INF/views/admin/common/adminheader.jsp"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.cookie.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminMain.css">
</head>
<body id="adminLoginBody">
	<%@ include file="/WEB-INF/views/admin/common/adminNavi.jsp"%>
	<div id="adminWrapper">
		<div id="adminLoginWrapper">
			<form method="post" id="loginForm" class="form-signin">
				<div>
					<h1 class="loginMainFont">
						통합 관리자 로그인
					</h1>
				</div>
					<label for="login_id" class="sr-only">ID</label> 
					<input type="text" name="userId" id="login_id" class="form-control" placeholder="아이디"required auotofocus> 
				   
				    <label for="inputPassword" class="sr-only">Password</label>
				    <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호" required>
					<div style="color : #c8c8c8">
						${error}
					</div>
					<!--로그인 버튼  -->
					<button class="btn btn-lg btn-primary btn-block" type="button"
						id=login_button>로그인</button>
					
				<div class="bottomBar">	
					<!--아이디 저장기능  -->
					<span class="checkbox mb-3">
						<input type="checkbox" name="rememberId" id="rememberId"> 
						<label for="rememberId" id="rememberIdLabel">아이디 저장 </label>
					</span>
					<div class="bottomBar2">
					   	<a href="<%=request.getContextPath()%>/member/find/find_id">아이디찾기</a>
					   	&nbsp;
						<a href="<%=request.getContextPath()%>/member/find/find_pw">비밀번호찾기</a>
					</div>
				</div>	

			</form>
		</div>
		
	<!--adminWrapper의 끝-->
	</div>
</body>
<script type="text/javascript">
	$('document').ready(function() {

		$('input[type="text"],input[type="password"]').keyup(function() {
			//엔터 쳤을때
			if (event.keyCode == 13) {
				//엔터의 기본 기능을 없앤다
				event.preventDefault();
				//클릭 했을때 로그인 버튼으로	
				$('#login_button').trigger('click');
			}
		});
	});

	$(function() {
		//최초 쿠키에 login_id라는 쿠키값이 존재하면
		var login_id = $.cookie('idcookie');
		if (login_id != undefined) {
			//아이디에 쿠키값을 담는다
			$("#login_id").val(login_id);
			//아이디저장 체크박스 체크를 해놓는다
			$("#rememberId").prop("checked", true);
		}

		//로그인 버튼 클릭시
		$("#login_button").click(function() {
			//아이디 미입력시
			if ($.trim($("#login_id").val()) == "") {
				alert("아이디를 입력하세요");
				return;
				//아이디 입력시
			} else {
				//아이디저장 체크되어있으면 쿠키저장
				if ($("#rememberId").prop("checked")) {
					//아이디저장 미체크면 쿠키에 정보가 있던간에 삭제
				} else {
					$.removeCookie("idcookie");
				}
				/* 	alert("로그인!!"); */
				$('#loginForm').submit();
			}
		})
	})
</script>
</html>




