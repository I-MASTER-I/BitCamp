<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int indexNo = -1;

	String idx = request.getParameter("idx");

	if (idx != null) {
		indexNo = Integer.parseInt(idx);
	}

	if (indexNo < 0) {
%>
<script>
	alert('부적절한 인덱스값이 전달되었습니다.\n이전페이지로 돌아갑니다.');
	history.go(-1);
</script>
<%
	}
	// 데이터 베이스 입력처리 : 2018.09.20
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "delete from member where idx=?";

	try {
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:open");

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, idx);
		pstmt.executeUpdate();
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

		<h2>회원삭제</h2>

	</div>











</body>
</html>