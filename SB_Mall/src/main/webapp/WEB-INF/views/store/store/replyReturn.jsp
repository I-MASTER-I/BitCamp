<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true" %>
		
		
		<div id="replyPaged">
		<c:forEach var="reList" items="${replyList}">
    		<div class="replyUnit replyNum${reList.replySeq}">
    			<h4 class="getReply_H4">${reList.userId}</h4>
    			<h5 class="getReply_H5">${reList.regTime}</h5>
    			
    			<c:choose>
	    			<c:when test="${reList.userSeq==userSession.userSeq}">
	    				<button class="replyBtn replyDelete" value="${reList.replySeq}">삭제</button>
	    				<button class="replyBtn replyModify" value="${reList.replySeq}">수정</button>
	    			</c:when>
	    			<c:when test="${userSession.gradeNum==3 && reList.gradeNum<3}">
	    				<button class="replyBtn replyDelete" value="${reList.replySeq}">삭제</button>
	    			</c:when>
	    			<c:when test="${userSession.gradeNum==4}">
	    				<button class="replyBtn replyDelete" value="${reList.replySeq}">삭제</button>
	    			</c:when>
    			</c:choose>
    			<div class="replyFrame">
    			<h2 class="getReply_H2">${reList.reply}</h2>
    			</div>
    		</div>
    		
    	</c:forEach>
    	</div>
    	
    	<div id="paging">
    	<c:forEach var="i"  begin="1" end="${pageCnt}" step="1">
    		<c:choose>
	    		<c:when test="${i==nowPage}">
	    			<button name="nowPage" class="pageSelect pageActive">${i}</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button name="nowPage" class="pageSelect">${i}</button>
	    		</c:otherwise>
    		</c:choose>
    	</c:forEach>
    	</div>
    	
    	