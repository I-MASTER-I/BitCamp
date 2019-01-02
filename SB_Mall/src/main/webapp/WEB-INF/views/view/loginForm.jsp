<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<script type="text/javascript" src="../resources/js/jquery.cookie.js"></script>
<link rel="stylesheet" href="../css/default.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="../css/logincss.css" rel="stylesheet">

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
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
	//카카오 
	$(document).ready(function() {
		//자바스크립트 키
		Kakao.init("6185270da1b2e6df01f9aae9195154e8");
		function getKakaotalkUserProfile() {
		Kakao.API.request({
			url : '/v1/user/me',
			success : function(res) {
			$("#kakao-profile").append(res.properties.nickname);
			$("#kakao-profile").append(	$(	"<img/>",{	"src" : res.properties.profile_image,
														"alt" : res.properties.nickname
														+ "님의 프로필 사진"
							}));
						},
			fail : function(error) {
			console.log(error);
			}
		});
	}
		//카카오로그인 
		function createKakaotalkLogin() {	
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
							
			var loginBtn = $("<a/>", {
								"class" : "kakao-login-btn",
								"text" : "카카오로그인"
						});
							loginBtn.click(function() {
								Kakao.Auth.login({
								persistAccessToken : true,
								persistRefreshToken : true,
									success : function(authObj) {
									getKakaotalkUserProfile();
									createKakaotalkLogout();
									},
									fail : function(err) {
										console.log(err);
									}
								});
							});
							$("#kakao-logged-group").prepend(loginBtn)
						}
						//로그아웃 
						function createKakaotalkLogout() {
							$(
									"#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn")
									.remove();
							var logoutBtn = $("<a/>", {
								"class" : "kakao-logout-btn",
								"text" : "로그아웃"
							});
							logoutBtn.click(function() {
								Kakao.Auth.logout();
								createKakaotalkLogin();
								$("#kakao-profile").text("");
							});
							$("#kakao-logged-group").prepend(logoutBtn);
						}
						if (Kakao.Auth.getRefreshToken() != undefined
								&& Kakao.Auth.getRefreshToken().replace(/ /gi,
										"") != "") {
							createKakaotalkLogout();
							getKakaotalkUserProfile();
						} else {
							createKakaotalkLogin();
						}
					});
</script>

<body class="text-center">
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="loginSuperBox">
		<form method="post" id="loginForm" class="form-signin">
	
			<div>
				<img class="mb-4"
					src="<%=request.getContextPath()%>/img/SBCompanyLogo.png" alt=""
					width="72" height="72"> <br>
				<h1 class="loginMainFont"
					style="color: #282828; font-family: 'Open Sans', sans-serif; font-size: 30px; font-weight: bolder; display: inline-block;">
					SB Company
				</h1>
			</div>
	
			<label for="login_id" class="sr-only">ID</label> 
			<input type="text" name="userId" id="login_id" class="form-control" placeholder="아이디"required auotofocus> 
		   
		    <label for="inputPassword" class="sr-only">Password</label>
		    <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호" required>
	
			${error}
	
			<!--로그인 버튼  -->
			<button class="btn btn-lg btn-primary btn-block" type="button"
				id=login_button>로그인</button>
			
		<div class="bottomBar">	
			<!--아이디 저장기능  -->
			<div class="checkbox mb-3">
				<input type="checkbox" name="rememberId" id="rememberId"> <label
					for="rememberId" id="rememberIdLabel">아이디 저장 </label>
			</div>
			<div class="kakaologin">
				<!--카카오관련  -->
				<div id="kakao-logged-group"></div>
				<div id="kakao-profile"></div>
			</div>
		</div>	
		<div class="bottomBar2">
			<div>
			<!--아이디찾기  -->
			<a href="<%=request.getContextPath()%>/member/find/find_id">아이디찾기
			</a>
			<!--비밀번호 찾기  -->
			 <a href="<%=request.getContextPath()%>/member/find/find_pw">비밀번호찾기
			</a>
			 <!-- 회원가입 -->
			 <a href="<%=request.getContextPath()%>/member/join">회원가입
			 </a>
	  		 </div>
		</div>
		</form>
	</div>
	
</body>
</html>




