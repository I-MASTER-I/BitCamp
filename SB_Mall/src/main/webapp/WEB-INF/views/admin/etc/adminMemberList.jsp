<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="viewData" value="${viewData}"></c:set>
<table id="memberlist">
	<thead>
		<tr>
			<th class="">회원번호</th>
			<th class="th-id">아이디</th>
			<th class="mem-name">이름</th>
			<th class="">가입일</th>
			<th class="">등급</th>
			<th class="">관리</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${viewData.objList.isEmpty()}">
				<tr>
					<td colspan="6" class="none-data">가입한 회원이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="member" items="${viewData.objList}">
					<tr>
						<td>${member.userSeq}</td>
						<td>${member.userId}</td>
						<td class="mem-name">${member.userName}</td>
						<td>${member.regDate}</td>
						<td>${member.gradeNum}</td>
						<td class="member_last_td">
							<button type="button" class="memberModify"
								name="${member.userId}" grade="${member.gradeNum}"
								data-toggle="modal" data-target="#modalCart">
								상세</button>
							<button class="memberDelete"
								name="${member.userId}" grade="${member.gradeNum}">
								탈퇴</button>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<script>
//회원 수정버튼
$(document).ready(function() {
	memberModify();
	memberDelete();
	modifyButton();
	
});

function memberModify(){
$('.memberModify').click(function() {
	var sessionId = '${memberInfo.userId}';
	var userId = $(this).attr('name');
	var sessionGrade = '${memberInfo.gradeNum}';
	var gradeNum = $(this).attr('grade');
	if(sessionGrade < 3){
		$('#popup').html(
				'<tr>' + 
				'<th>관리자만 수정 가능합니다.</th>' + 
				'</tr>');
	} else if(sessionId != userId && gradeNum >= 3 && sessionGrade < 4){
		$('#popup').html(
				'<tr>' + 
				'<th>관리자의 수정은 본인만 가능합니다. 단, 그랜드마스터는 제외.</th>' + 
				'</tr>');
	} else {
		$.ajax({
		url : '<%=request.getContextPath()%>/member/memberModify?userId=' +  $(this).attr('name'),
		data : {
			viewType : $(this).val()
		},
		error : function(error) {
	        alert("장난치삼?");
	    },
		success : function(data) {
			$('#popup').html(data);
		}
	});
	}
});
}



//회원 삭제버튼
function memberDelete(){
$('.memberDelete').click(function() {
	var sessionId = '${memberInfo.userId}';
	var userId = $(this).attr('name');
	var sessionGrade = '${memberInfo.gradeNum}';
	var gradeNum = $(this).attr('grade');
	if(sessionGrade < 3){
		alert("관리자만 삭제 가능합니다.");
	} else if(sessionId != userId && gradeNum >= 3 && sessionGrade < 4 ){
		alert("관리자의 탈퇴는 본인만 가능합니다. 단, 그랜드마스터는 제외.");
	} else {
	$.ajax({
		url : '<%=request.getContextPath()%>/member/memberDelete?userId=' +  $(this).attr('name'),
		error : function(error) {
			alert("장난치삼?");
	    },
		success : function(result) {
			alert(result);
			$('#left-innercont').empty();
			$('#left-innercont').load('<%=request.getContextPath()%>' + '/admin/adminMemberList');  
		}
	});
	}
});
}

//회원 수정
function modifyButton(){
$('#modifyButton').click(function() {
	var memberModify = $('#memberModify').serialize();
	var sessionGrade = '${memberInfo.gradeNum}';
	var gradeNum = $('input[name=gradeNum]').val();
	if (gradeNum >= 3 && sessionGrade < 4) {
		alert("회원등급 3 이상은 그랜드마스터만 가능합니다.");
	} else if (gradeNum > 4) {
		alert("회원등급은 4 까지만 존재합니다.");
	} else {
	$.ajax({
		url : '<%= request.getContextPath() %>/member/memberModify',
		type : 'POST',
		data : memberModify,
		error : function(error) {
			alert("장난치삼?");
	    },
		success : function(result) {
			alert(result);
		}
	});
	
	}
});
}


</script>
