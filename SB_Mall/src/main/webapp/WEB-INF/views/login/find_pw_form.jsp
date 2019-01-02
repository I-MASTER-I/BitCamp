<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css">
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/find.css">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="commonBannerBox">
		<h3 class="rowdCommonBannerH3">비밀번호 찾기</h3>
	</div>
	<div class="containerAll">
		<div class="containerSub">
			<form method="post">
				<div class="mainbox" >
				
					<p>
						<label>아이디</label>
						<input class="namebox" type="text" id="userId" name="userId" required style="margin-bottom: 13px;">
					</p>
					<p>
					<label>이름</label>
					<input class="phonebox" type="text" id="userName" name="userName" required style="margin-left:27px;">
					</p>					
					<p class="selectbox">
						<button type="submit" id=findBtn class="submitbox">찾기</button>
						<button type="button" onclick="history.go(-1);" class="cancelbox">취소</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
