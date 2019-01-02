<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css" rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<script>

	$(document).ready(function() {
		$(".openText").hide();
		
		$('.hideText').click(function() {
			var qnaSeq = $(this).attr('name');
			$('.openText[name=' + qnaSeq + ']').toggle(200, 'linear');
		});
	});
	
</script>
<style>
#wrapper {
	width : 1000px;
	margin: 30px auto 50px auto;
}

table .th-lg, table td {
   
}
.view{
	background-color: #ffc828 !important;
}
.th-lg{
	font-weight: bold;
	color:#282828;
}
.th-lg,table td{
	padding: 16px 16px 16px 0px !important;
    min-width: 50px !important;
}
.qnaAnsBox{
	text-align: center;
}
.lastTh{
	text-align: center;
}
.titleTh{
	min-width: 450px !important;	
}

.topTableBox{
	border-bottom:3px solid #ffc828;
	z-index:9999;
}
.openText{
	padding-left: 91px !important;
}
</style>

</head>
<body>
<div class="commonBannerBox">
	<h3 class="rowdCommonBannerH3">질문게시판</h3>
</div>
	<div id="wrapper">
	<%-- <div class="view view-cascade gradient-card-header special-color narrower py-2 mx-4 mb-3 d-flex justify-content-between align-items-center" style="margin: auto 0 auto 0 !important;">

        <div>
        </div>

        <a href="" class="white-text mx-3">회원 및 주문관리</a>

        <div>
        <a href="" data-toggle="modal" data-target="#modalContactForm"> <!-- <%=request.getContextPath()%>/qna/qnaWrite -->
            <!-- <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
                <i class="fa fa-columns mt-0">문의하기</i>
            </button> -->
            </a>
        </div>

    </div> --%>
			<div class="table-wrapper">
		
	<table class="table table-hover mb-0">

			<thead class="topTableBox">
			<tr class="topTableBox">
			    <th class="th-lg">답변 상태</th>
			    <th class="th-lg">글 번호</th>
			    <th class="th-lg titleTh">제목</th>
			    <th class="th-lg">작성자</th>
			    <th class="th-lg">날짜</th>
			    <th class="th-lg lastTh">답글달기</th>
			</tr>
			</thead>
		
			<tbody>
		<c:if test="${qnaList!=null}">
			<c:forEach items="${ qnaList }" var="qnaBoard">
				<tr>
					<td><%-- <c:set var="data" value="미답변" /> --%>
					<c:choose>
					<c:when test="${ qnaBoard.atext eq null }">
        			미답변
        			</c:when>
        			<c:otherwise>
        			답변완료
        			</c:otherwise>
        			</c:choose></td>
					<td>${ qnaBoard.qnaSeq }</td>
					<td><a href="#this" class='hideText' name="${ qnaBoard.qnaSeq}">${ qnaBoard.qtitle }</a></td>
					<td>${ qnaBoard.userSeq }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${ qnaBoard.qwriteDate }" /></td>
					<td class="qnaAnsBox"><a href="" class="qnaAns" name="${ qnaBoard.qnaSeq}" data-toggle="modal" data-target="#modalAnsForm">답글쓰기</a></td>
				</tr>
				<tr>
					<td colspan="6" class="openText" name="${ qnaBoard.qnaSeq}">질문 : ${ qnaBoard.qtext }</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${ qnaBoard.atext != null && qnaBoard.atext != '' }">
							<td colspan="6" class="openText" name="${ qnaBoard.qnaSeq}">답변 : ${ qnaBoard.atext }</td>
						</c:when>
						<c:otherwise>
							<td colspan="6" class="openText" name="${ qnaBoard.qnaSeq}">답변이 없습니다</td>
						</c:otherwise>
					</c:choose>
<%-- 					<td colspan="6" class="openText" name="${ qnaBoard.qnaSeq}">답변 : ${ qnaBoard.atext }</td> --%>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	
			</div>
		</div>
    
<form action="qnaWrite" method="POST">
<div class="modal fade" id="modalContactForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">문의하기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <i class="fa fa-user prefix grey-text"></i>
                    <input type="text" id="form34" class="form-control validate" disabled >
                    <label data-error="wrong" data-success="right" for="form34">${memberInfo.userName}</label>
                </div>
                <div class="md-form mb-5">
                    <i class="fa fa-tag prefix grey-text"></i>
                    <input type="text" id="form32" class="form-control validate"  name="qtitle">
                    <label data-error="wrong" data-success="right" for="form32">제목</label>
                </div>

                <div class="md-form">
                    <i class="fa fa-pencil prefix grey-text"></i>
                    <textarea type="text" id="form8" class="md-textarea form-control" rows="4"  name="qtext"></textarea>
                    <label data-error="wrong" data-success="right" for="form8">문의내용</label>
                </div>

            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="submit" class="btn btn-unique">전송<i class="fa fa-paper-plane-o ml-1"></i></button>
            </div>
        </div>
    </div>
</div>
</form>


 <form action="qna/qnaWriteAns/" method="POST">
<div class="modalAnsForm modal fade" id="modalAnsForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">답변하기</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3" id="dddg">

                <div class="md-form" id="qnaAns">

                </div>

            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button type="submit" class="btn btn-unique">전송<i class="fa fa-paper-plane-o ml-1"></i></button>
            </div>
        </div>
    </div>
</div>
</form>


<script>
$('.qnaAns').click(function() {

	var sessionGrade = '${memberInfo.gradeNum}';
	if(sessionGrade < 3){
		$('#qnaAns').html(
				'관리자만 수정 가능합니다.');
	} else { 
		$.ajax({
		url : '<%=request.getContextPath()%>/qna/qnaWriteAns/' +  $(this).attr('name'),
		error : function(error) {
	        alert("장난치삼?");
	    },
		success : function(data) {
			$('#qnaAns').html(data);
		}
	});
 	} 
});
</script>

</body>

</html>