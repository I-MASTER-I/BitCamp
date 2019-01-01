<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MemberInfo> members = null;

	if(application.getAttribute("members") != null){
		members = (List<MemberInfo>)application.getAttribute("members");			
	} else {
		members = new ArrayList<MemberInfo>();
	}
%>
<%
	request.setCharacterEncoding("utf-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String userName = request.getParameter("userName");
	
	MemberInfo memberInfo = members.get(idx);
	memberInfo.setUserId(userId);
	memberInfo.setUserName(userName);
	memberInfo.setPassword(password);
	
	//members.add(memberInfo);
	application.setAttribute("members", members);
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

		<h2>회원가입 수정</h2>

		<hr>
			<table>
				<tr>
					<td>아이디(이메일)</td>
					<td><%= userId %></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><%= password %></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%= userName %></td>
				</tr>
				<tr>
					<td>사진</td>
					<td></td>
				</tr>
			</table>



	</div>











</body>
</html>