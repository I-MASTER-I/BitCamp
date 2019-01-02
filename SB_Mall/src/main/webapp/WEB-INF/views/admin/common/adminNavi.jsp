<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	 <div class="headerTop">
		<div id="adminInfo">
					<c:choose>
							<c:when test='${memberInfo eq null || memberInfo.gradeNum < 3}'>
									<span>
										<a id="memberNaviText"
										href="<%=request.getContextPath()%>/admin/adminLogin">로그인</a>
									</span>
							</c:when>
							<c:otherwise>
									<span>
										${memberInfo.userName}
									</span>
									<span>
										관리자님 환영합니다.
									</span>
									<span>
										<a id="memberNaviText"
										href="<%=request.getContextPath()%>/admin/logout">로그아웃</a>
									</span>
							</c:otherwise>
					</c:choose>
 
		</div>
	 </div>
	 <div class="headerBottom">
		<ul id="headerNavi">
					<li><a class="${adminCalendar}" href="<%=request.getContextPath()%>/admin/adminCalendar">일정관리</a></li>
					<li><a class="${adminStatistics}" href="<%=request.getContextPath()%>/admin/adminStatistics">통계</a></li>
					<li><a class="${adminMember}" href="<%=request.getContextPath()%>/admin/adminMember">회원관리</a></li>
					<li><a class="${adminOrder}" href="<%=request.getContextPath()%>/admin/adminOrder">주문관리</a></li>
					<li><a class="${adminOperation}" href="<%=request.getContextPath()%>/admin/adminOperation">매출관리</a></li>
		  <li ><a class="${adminMain}" href="<%=request.getContextPath()%>/admin">관리홈</a></li>
		</ul>
	 </div>
