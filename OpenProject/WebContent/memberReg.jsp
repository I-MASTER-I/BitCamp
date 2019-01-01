<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
	List<MemberInfo> members = null;

	if(application.getAttribute("members") != null){
		members = (List<MemberInfo>)application.getAttribute("members");			
	} else {
		members = new ArrayList<MemberInfo>();
	}
--%>
<%
	//request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	String userName = request.getParameter("userName");

	MemberInfo memberInfo = new MemberInfo();
	memberInfo.setUserId(userId);
	memberInfo.setUserName(userName);
	memberInfo.setPassword(password);

	//members.add(memberInfo);
	//application.setAttribute("members", members);

	// 데이터 베이스 입력처리 : 2018.09.20
	Connection conn = null;
	PreparedStatement pstmt = null;

	String sql = "insert into member (idx, userid, password, username, userphoto ) values(seq_member.nextval, ?, ?, ?, ?)";

	try {
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:open");

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberInfo.getUserId());
		pstmt.setString(2, memberInfo.getPassword());
		pstmt.setString(3, memberInfo.getUserName());
		pstmt.setString(4, memberInfo.getUserPhoto());
		int resultCnt = pstmt.executeUpdate();
		System.out.println(resultCnt);
	} catch (Exception e) {

	} finally {
		pstmt.close();
		conn.close();
	}
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

		<h2>회원가입 정보</h2>

		<hr>
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><%=userId%></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=password%></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=userName%></td>
			</tr>
			<tr>
				<td>사진</td>
				<td></td>
			</tr>
		</table>



	</div>











</body>
</html>