<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int indexNo = -1;

	String idx = request.getParameter("idx");

	if (idx != null){
		indexNo = Integer.parseInt(idx);
	}
	
	List<MemberInfo> members = null;

	if(application.getAttribute("members") != null){
		members = (List<MemberInfo>)application.getAttribute("members");			
	} else {
		members = new ArrayList<MemberInfo>();
	}
	
	
	if ( indexNo < 0 || indexNo > members.size()-1 ) {
		%>
		<script>
			alert('부적절한 인덱스값이 전달되었습니다.\n이전페이지로 돌아갑니다.');
			history.go(-1);
		</script>
		<%
	}
	
	MemberInfo memberInfo = members.get(indexNo);
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/default.css">
<style>
h2, td {
	padding: 10px;
}
</style>
</head>
<body>

	<%@ include file="common/header.jsp"%>


	<div id="contents">

		<h2>회원가입</h2>

		<hr>
		<form action="memberEdit.jsp" method="post">
			<input type="hidden" name="idx" value="<%= request.getParameter("idx")%>">
			<table>
				<tr>
					<td>아이디(이메일)</td>
					<td><input type="text" name="userId" value="<%= memberInfo.getUserId()%>"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" value="<%= memberInfo.getPassword()%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" value="<%= memberInfo.getUserName()%>"></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="photoFile"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"></td>
				</tr>
			</table>

		</form>



	</div>











</body>
</html>