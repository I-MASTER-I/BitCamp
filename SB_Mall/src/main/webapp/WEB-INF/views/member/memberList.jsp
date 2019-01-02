<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
 .member_last_td {
width : 105px !important;
padding : 0 !important; 
padding-top: 5px !important;
}

.memberModify, .memberDelete {
padding: 2px 5px !important; 
margin-top: 0 !important; 
margin-bottom: 0 !important;
} 

.addPage {
text-align: center; 
cursor: pointer; 
border-bottom: 0.5px solid black; 
border-top: 0.5px solid black; 
background-color: gray;
}

.addPage p  {
margin-bottom: auto;
}
</style>
<c:set var="viewData" value="${viewData}"></c:set>
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	등록된 회원이 없습니다.
		</c:when>
	<c:otherwise>
		<div class="px-4"">

			<div class="table-wrapper">
				<!--Table-->
				<table class="memList table table-hover mb-0">

					<!--Table head-->
					<thead>
						<tr>

							<th class="th-lg">회원번호</th>
							<th class="th-lg">아이디</th>
					<!-- 		<th class="th-lg">비밀번호</th> -->
							<th class="th-lg">회원이름</th>
							<th class="th-lg">주소1</th>
							<th class="th-lg">전화번호</th>
							<th class="th-lg">가입일</th>
							<th class="th-lg">회원등급</th>
							<th class="th-lg">마일리지</th>
							<th class="th-lg">총구매액</th>
							<th class="th-lg">관리</th>
						</tr>

					</thead>
					<!--Table head-->

					<!--Table body-->
					<tbody>
						<c:forEach var="member" items="${viewData.objList}">
							<tr>
								<td>${member.userSeq}</td>
								<td>${member.userId}</td>
	<%-- 							<td>${member.userPw}</td> --%>
								<td>${member.userName}</td>
								<td>${member.address1}</td>
								<td>${member.phone}</td>
								<td>${member.regDate}</td>
								<td>${member.gradeNum}</td>
								<td>${member.point}</td>
								<td>${member.userAmount}</td>
								<td class="member_last_td" style="padding : 0; padding-top: 5px !important;">
									<button type="button" class="memberModify btn btn-blue-grey"
										name="${member.userId}" grade="${member.gradeNum}"
										data-toggle="modal" data-target="#modalCart"
										style="padding: 2px 5px; margin-top: 0; margin-bottom: 0;">수정</button>
									<button class="memberDelete btn btn-blue-grey"
										name="${member.userId}" grade="${member.gradeNum}"
										style="padding: 2px 5px; margin-top: 0; margin-bottom: 0;">
										탈퇴</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
				<!--Table-->
				<br>
				<div class="addPage">
				<c:if test="${viewData.currentPageNumber < viewData.pageTotalCount}">
					<p class="page" name="${viewData.currentPageNumber + 1}"><i class="fa fa-chevron-down" aria-hidden="true"></i> ${viewData.currentPageNumber}/${viewData.pageTotalCount}<br></p>
				</c:if>
				</div>
			</div>
		</div>

	</c:otherwise>
</c:choose>
<script>
$('.page').click(function() {
	$.ajax({
		url : '<%=request.getContextPath()%>' + '/member/memberListAdd?page=' +  $(this).attr('name'),
		dataType : "json",
		error : function(error) {
	        alert("Error!");
	    },
		success : function(viewData) {
				$.each(viewData.objList, function(key, member) {
					if (viewData.currentPageNumber < viewData.pageTotalCount) {
						$('.page').attr('name', viewData.currentPageNumber + 1).html(
								'<i class="fa fa-chevron-down" aria-hidden="true"></i>' +
								viewData.currentPageNumber + '/' + viewData.pageTotalCount)
					} else {
						$('.page').remove();
					}
				/* alert(key + ':' + member.userId)  */
				$('.memList').find('tbody').append(
						'<tr>' + 
						'<td>' + member.userSeq + '</td>' + 
						'<td>' + member.userId + '</td>' +
		/* 				'<td>' + member.userPw + '</td>' + */
						'<td>' + member.userName + '</td>' +
						'<td>' + member.address1 + '</td>' +
						'<td>' + member.phone + '</td>' +
						'<td>' + member.regDate + '</td>' +
						'<td>' + member.gradeNum + '</td>' +
						'<td>' + member.point + '</td>' +
						'<td>' + member.userAmount + '</td>' +
						'<td class="member_last_td">' + 
						'<button class="memberModify btn btn-blue-grey" name="' + member.userId + '" grade="' + member.gradeNum + '" data-toggle="modal" data-target="#modalCart">' +
							'수정' +
						'</button>' +
						'<button class="memberDelete btn btn-blue-grey" name="' + member.userId + '" grade="' + member.gradeNum + '">' +
							'탈퇴' +
						'</button>' +
						'</td>' +
					'</tr>')
				});
				memberModify();
				memberDelete();
		}
	});
});

//회원 수정버튼
$(document).ready(function() {
	memberModify();
	memberDelete();
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
		/* 	$('#viewList').empty(); */
			$('#popup').html(data);
/* 			$('#background').css('display', 'block'); */
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
			$('#viewList').empty();
			$('#viewList').load('<%=request.getContextPath()%>' + '/member/memberList');  
		}
	});
	}
});
}

</script>
