<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<h1 class="title">OpenProject</h1>

	<ul id="gnb">
		<li><a href="<%= request.getContextPath() %>/index.jsp">메인</a></li>
		<li><a href="<%= request.getContextPath() %>/memberRegForm.jsp">회원가입</a></li>
		<%
			String lid = (String)request.getSession(false).getAttribute("userId");
		
		if (lid == null) {		
		%>
		<li><a href="<%= request.getContextPath() %>/loginForm.jsp">로그인</a></li>
		<%} else { %>
		<li><a href="<%= request.getContextPath() %>/logout.jsp">로그아웃</a></li>
		<%} %>
		<li><a href="<%= request.getContextPath() %>/mypage/myPage.jsp">마이페이지</a></li>
		<li><a href="<%= request.getContextPath() %>/memberList.jsp">회원 리스트</a></li>
	</ul>
	
	
	
	
	
	
	
	
	