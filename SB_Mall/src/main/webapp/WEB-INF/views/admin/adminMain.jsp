<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>통합 관리자 : 메인</title>
<!-- 헤더 삽입 -->
<%@ include file="/WEB-INF/views/admin/common/adminheader.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/adminMain.css">
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/adminNavi.jsp"%>
<!-- 페이지 래퍼 -->
<div id="adminWrapper">
	
<!-- 우측 메뉴 -->
	<div id="content" class="in-bl">
		<!-- 헤더  -->
		<div id="header-content">
			<!-- 상단 리포트 -->
			<div class="top-report">	
				<!-- 오늘의 방문자 -->
				<div class="report-box">
					
					<div class="result-box">
						<div class="this-result">
							<h5>오늘 방문수</h5>
							<h5><fmt:formatNumber value="${admin.visitToday}" pattern="#,###"/>명</h5>
						</div>
						
						<div class="pre-result">
							<h5>어제 방문수</h5>
							<h5><fmt:formatNumber value="${admin.visitPreday}" pattern="#,###"/>명</h5>
						</div>
					</div>
				</div>
			
				<!-- 오늘의 주문 -->
				<div class="report-box">
					
					<div class="result-box">
						<div class="this-result">
							<h5>오늘의 주문</h5>
							<h5><fmt:formatNumber value="${admin.orderToday}" pattern="#,###"/>건</h5>
						</div>
						
						<div class="pre-result">
							<h5>어제의 주문</h5>
							<h5><fmt:formatNumber value="${admin.orderPreday}" pattern="#,###"/>건</h5>
						</div>
					</div>
				</div>
				
				<!-- 오늘의 매출 -->
				<div class="report-box">
					
					<div class="result-box">
						<div class="this-result">
							<h5>오늘의 매출</h5>
							<h5><fmt:formatNumber value="${admin.salesToday}" pattern="#,###"/>원</h5>
						</div>
							
						<div class="pre-result">
							<h5>어제의 매출</h5>
							<h5><fmt:formatNumber value="${admin.salesPreday}" pattern="#,###"/>원</h5>
						</div>
					</div>
				</div>
				<!-- 이번달 매출 -->
				<div class="report-box">

					<div class="result-box">
						<div class="this-result">
							<h5>${month0}월 매출</h5>
							<h5><fmt:formatNumber value="${admin.salesThisMonth}" pattern="#,###"/>원</h5>
						</div>
						
						<div class="pre-result">
							<h5>${month1}월 매출</h5>
							<h5><fmt:formatNumber value="${admin.salesPreMonth}" pattern="#,###"/>원</h5>
						</div>
					</div>
				</div>
				
			</div>
			<!-- 하단 리포트 - 차트 -->
			<div class="bottom-report">
				<%@ include file="/WEB-INF/views/admin/adminMain/addBottomReport.jsp"%>
			</div>
			
		</div>
		<!-- 메인 -->
<!-- 		<div id="main-content"> -->
			<!-- 회원목록 -->
<!-- 			<div id="left-innercont"> -->
<!-- 			</div> -->
			
			<!-- 주문목록 -->
<!-- 			<div id="right-innercont"> -->
<!-- 			</div> -->
			
		<!-- main-content 의 끝 -->
<!-- 		</div> -->
		
	<!-- content의 끝 -->
	</div>
	
<!-- adminWrapper의 끝 -->
</div>

<!-- Modal: 회원수정 -->
<div class="modal fade" id="modalCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header" style="border: none">
        <h4 class="modal-title" id="myModalLabel">회원 수정</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
	<form id="memberModify">
    <div class="modal-body">
            <table id="popup" class="table table-hover">
            </table>
       </div>
      <!--Footer-->
      <div class="modal-footer">
        <input type="button" class="btn btn-outline-primary" data-dismiss="modal" value="닫기">
        <input type="button" id="modifyButton" class="btn btn-primary" data-dismiss="modal" value="수정">
      </div>
	</form>
    </div>
  </div>
</div>

<!-- Modal: 주문상세 -->
<div class="modal fade" id="modalOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content"">
      <!--Header-->
      <div class="modal-header" style="border: none">
        <h4 class="modal-title" id="myModalLabel">주문 내역</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <!--Body-->
    <div class="modal-body">
            <table id="popupOrder" class="table table-hover">
            
            </table>
       </div>
      <!--Footer-->
      <div class="modal-footer">
        <input type="button" class="btn btn-outline-primary" data-dismiss="modal" value="닫기">
      </div>
		
    </div>
  </div>
</div>

</body>
<script type="text/javascript">
$(document).ready(function() {
	/* load 함수로 ajax 없이도 페이지에 불러온다. */
<%-- 	$('#left-innercont').load('<%=request.getContextPath()%>' + '/admin/adminMemberList');   --%>
<%-- 	$('#right-innercont').load('<%=request.getContextPath()%>' + '/admin/adminOrderList');   --%>
});
</script>
</html>
