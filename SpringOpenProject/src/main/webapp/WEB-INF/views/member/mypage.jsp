<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/default.css">
<style>
h2, td {
	padding: 10px;
}

#memherPhoto {
	background-image: url('<%= request.getContextPath() %>/uploadfile/userphoto/${loginInfo.userPhoto}');
	background-size: 100%;
	width: 150px;
	height: 150px;
	border: 1px solid #333333;
	border-radius: 75px;
	margin: 20px 0;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>


	<div id="contents">

		<h2>회원 정보</h2>

		<div id="memherPhoto"></div>

		<hr>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td>${loginInfo.userId}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${loginInfo.userName}</td>
			</tr>
		</table>



	</div>











</body>
</html>