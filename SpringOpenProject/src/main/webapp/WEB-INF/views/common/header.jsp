<%@page import="com.bitcamp.op.member.model.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<h1 class="title">OpenProject</h1>

	<ul id="gnb">
		<li><a href="<%= request.getContextPath() %>/">메인</a></li>
		<li><a href="<%= request.getContextPath() %>/member/memberReg">회원가입</a></li>
		<%
			MemberInfo loginInfo = (MemberInfo)request.getSession(false).getAttribute("loginInfo");
		
		if (loginInfo == null) {		
		%>
		<li><a href="<%= request.getContextPath() %>/member/login">로그인</a></li>
		<%} else { %>
		<li><a href="<%= request.getContextPath() %>/member/logout">로그아웃</a></li>
		<%} %>
		<li><a href="<%= request.getContextPath() %>/member/mypage">마이페이지</a></li>
		<li><a href="<%= request.getContextPath() %>/memberList.jsp">회원 리스트</a></li>
	</ul>
	
	
	
	
	
	
	
	
	