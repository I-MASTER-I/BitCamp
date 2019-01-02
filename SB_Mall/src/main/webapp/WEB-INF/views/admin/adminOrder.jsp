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
<title>통합 관리자 : 주문 관리</title>
<!-- 헤더 삽입 -->
<%@ include file="/WEB-INF/views/admin/common/adminheader.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/adminContent.css">
</head>
<body>
<%@ include file="/WEB-INF/views/admin/common/adminNavi.jsp"%>
<div id="adminWrapper">
		<div id="bottomContent">
			<!--상단메뉴의 끝 하단메뉴의 시작-->
			<!--좌측 메뉴-->
			<div id="leftContent">
				<div class="leftTitle">주문 관리</div>
				<div class="leftMenu link" id="orderManager">
					주문 관리
				</div>
				<div class="leftMenu link" id="returnManager">
					반품 관리
				</div>
				<!--좌측메뉴의 끝, 우측메뉴 시작-->
			</div><div id="rightContent">
			</div>
 
			<!--하단 메뉴의 끝-->
		</div>
<!--adminWrapper의 끝-->
</div>
</body>
<script>

//왼쪽 메뉴 추가된 클래스 제거하고 새로운 메뉴에 스타일 적용하는 함수
function removeActive(id, sub){
	//클래스 제거
	$('.leftMenu').removeClass('leftActive');
	$('.leftSubmenu li').removeClass('leftSubActive');
	
	//현재 페이지 메뉴에 css를 먹인다.
	$(id).addClass('leftActive');

	//현재 서브메뉴에 css를 적용. sub가 0이면  적용하지 않는다.
	if(sub != 0){
		$(sub).addClass('leftSubActive');
	}
}

$(document).ready(function(){
	
	$('.leftSubmenu').hover(function(){
		$(this).prev('.leftMenu').css('color', '#ffc828');
	}, function(){
		$(this).prev('.leftMenu').css('color', '#505050');
	});

	//기본 화면으로 불러온다. 여기서는 주문 관리
	$('#rightContent').load('<%=request.getContextPath()%>/admin/adminOrder/orderManager');
	
	//메뉴 클릭시 우측 메뉴 출력 - 없으면 기본 화면으로 출력 여기서는 영업통계
	$('.link').click(function(){
		var page = $(this).attr('id');
		var url = '<%=request.getContextPath()%>/admin/adminOrder/' + page;
		$.ajax({
			url : url,
			error : function(error) {
		        alert("Error!");
		    },
			success : function(data) {
				$('#rightContent').html(data);
				history.pushState(url, null, '<%=request.getContextPath()%>/admin/adminOrder');
			}
		});
	});
	
	//ajax로 뒤로가기 구현
	$(window).bind("popstate", function(event) {
		//히스토리에 저장된 데이터를 불러온다. 여기서는 url 
		var data = event.originalEvent.state;
		//저장된 url이 있으면 
		if(data){
			$.ajax({
					url : data,
					error : function(error) {
				        alert("Error!");
				    },
					success : function(data) {
						$('#rightContent').html(data);
					}
				})
			 } else {
			    // 히스토리에 정보가 없을경우 메인화면으로 보내준다.
			    var url = "<%=request.getContextPath()%>/admin/adminOrder";    
			    $(location).attr('href',url);
			    }
	});

});

</script>
</html>