<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/crowd.css">
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://code.jquery.com/jquery-1.10.0.js"></script>
<title>EarlyBird</title>

<script>
	var pageShowCnt = 15;
	var viewCnt=0;
	 $(document).ready(function(){
		
	 	function getCrowdBoard(nowPage , fgjlkfsdg, fgjlkdj){
			$.ajax({
				url:'<%=request.getContextPath()%>/crowd/crowdBoardList',
				type: "get",
				data: {nowPage : nowPage, pageShowCnt:pageShowCnt},
				error:function(){
					alert('오류입니다.');
				},
				success:function(data){
					var crList = $(data).filter('.crBoardList').html();
					var crPaging = $(data).filter('.pagingBox').html();
				
					$('.crBoardList').html(crList);
					$('.pagingBox').html(crPaging);
					
					callBoard();
				}
				
				
				
			})
		}/* 게시물 불러오기 끝 */
		getCrowdBoard(1);
		
		/* 게시판 ajax호출 이벤트 연결*/
		function callBoard(){
			$('.pagingBtn').on('click',function(){
				var nowPage = $(this).html();
				getCrowdBoard(nowPage);
			})
		}
		
		$('.select').change(function(){
			var Num = $(this).val();
			var SubNum = Num.substr(0,2);
			
			pageShowCnt = SubNum;
			getCrowdBoard(1);
		})
		
		$('.chooseViewCntBox').on('click',function(){
			if(viewCnt==0){
				$('.selectViewCntBox').show();
				viewCnt++;
			}else{
				$('.selectViewCntBox').hide();
				viewCnt--;
			}
		})
		
		$('.selectViewCnt').on('click',function(){
			$('.selectViewCntBox').hide();
			viewCnt--;
			
			var Num = $(this).data('viewcnt');
			$('.chooseViewCnt').html(Num+'개');
			pageShowCnt = Num;
			getCrowdBoard(1);
			
			
		})
		
		getCrowdBoard(nowPage , fgjlkfsdg, fgjlkdj)
		
		
		
	})/* document 끝*/
	


</script>
</head>
<body>
<div class="commonBannerBox">
<h3 class="rowdCommonBannerH3">얼리버드</h3>
</div>

<!-- 총 게시판 공간 -->
<div class="crBoardBigBox">
	
	<!-- 검색조건, 검색 등 -->
	<div class="userOptBox ib">
		<div class="selectBox ib">
			<div class="chooseViewCntBox">
				<h3 class="chooseViewCnt">15개</h3>
				<img class="optBtnViewCnt" src="<%=request.getContextPath()%>/img/optBtn2.png">
			</div>
			
			<div class="selectViewCntBox">
				<div class="selectViewCnt" data-viewcnt="15"><h3 class="viewCnt">15개</h3></div>
				<div class="selectViewCnt" data-viewcnt="30"><h3 class="viewCnt">30개</h3></div>
				<div class="selectViewCnt" data-viewcnt="45"><h3 class="viewCnt">45개</h3></div>
			</div>
		
		</div>
		
		<c:if test="${memberInfo.gradeNum>2}">
			<div class="addFundingBox ib">
			<a class="addFundingProduct"
					href="<%=request.getContextPath()%>/crowd/crowdWritePage">상품등록</a>
			</div>
		</c:if>
		
		<div class="searchBigBox">
			<div class="searchBox ib">
				<input class="search" type="text">
			
			</div><div class="searchBtnBox ib">
				<img class="searchBtn" src="<%=request.getContextPath()%>/img/searchicon-01.png">
			</div>
		</div>
	</div>
	
	<!-- 게시물 공간 -->
	<div class="crBoardList">
	</div>
	
	<div class="pagingBox">
	</div>
	
	
	

</div><!-- 총 게시판 끝 -->



<%@ include file="/WEB-INF/views/common/header.jsp"%>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>