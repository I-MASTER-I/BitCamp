<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/find.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='<%=request.getContextPath()%>/member/login';
		})
	})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="commonBannerBox">
		<h3 class="rowdCommonBannerH3">비밀번호 찾기</h3>
	</div>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기 검색결과</h3>
			</div>
			<div>
				<h5 style="height: 100px; padding-top: 33px; padding-left: 16px;">
				<%-- ${pw} --%>
				등록하신 이메일(id)로 임시 비밀번호를 전송했습니다
				
				</h5>
				<p class="w3-center">
					<button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">로그인</button>
<!-- 					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button> -->
				</p>
			</div>
		</div>
	</div>
</body>
</html>
