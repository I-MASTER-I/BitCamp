<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userId");
	String pw = request.getParameter("password");

	if (id != null && pw != null) {

		// 데이터 베이스 입력처리 : 2018.09.20
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where userid=?";

		try {

			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:open");

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				MemberInfo member = new MemberInfo();
				member.setUserId(rs.getString("userid"));
				member.setPassword(rs.getString("password"));
				member.setUserName(rs.getString("username"));
				member.setUserPhoto(rs.getString("userphoto"));

				if (member.checkPassword(pw)) {
					request.getSession(false).setAttribute("loginInfo", member.toLoginInfo());
					response.sendRedirect("myPage.jsp");
				}

			}
		} catch (Exception e) {

		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

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
		<h2>로그인</h2>

		<hr>
		<h1>아이디 또는 비밀번호가 틀립니다. 확인해주세요.</h1>
		<h1>
			<a href="loginForm.jsp">다시로그인하기</a>
		</h1>

	</div>











</body>
</html>