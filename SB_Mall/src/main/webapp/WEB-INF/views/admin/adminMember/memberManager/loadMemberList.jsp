<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="viewData" value="${viewData}"/>

	<table id="memberTab" class="tablesorter resultTab">
		<thead>
			<tr>
				<th class="mm0 sorter-false"><input type="checkbox" class="all-check"></th>
				<th class="mm1">가입일</th>
				<th class="mm2">번호</th>
				<th class="mm3">아이디</th>
				<th class="mm4">이름</th>
				<th class="mm5">전화</th>
				<th class="mm6">주소</th>
				<th class="mm7">등급</th>
				<th class="mm9">구매액</th>
				<th class="notsorter"></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${viewData.isEmpty()}">
					<tr>
						<td colspan="10" style="text-align: center; padding: 120px 0;">조회된 회원이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="MemberVO" items="${viewData.objList}">
						<tr>
							<td class="mm0"><input type="checkbox" class="check" name="userSeq" value="${MemberVO.userSeq}" data-gradeNum="${MemberVO.gradeNum}"></td>
							<td class="mm1">${MemberVO.regDate}</td>
							<td class="mm2">${MemberVO.userSeq}</td>
							<td class="mm3">${MemberVO.userId}</td>
							<td class="mm4">${MemberVO.userName}</td>
							<td class="mm5">${MemberVO.phone}</td>
							<td class="mm6">${MemberVO.address}</td>
							<td class="mm7">
								<c:choose>
									<c:when test="${MemberVO.gradeNum == 0}">
										정회원
									</c:when>
									<c:when test="${MemberVO.gradeNum == 1}">
										우수회원
									</c:when>
									<c:when test="${MemberVO.gradeNum == 2}">
										VIP
									</c:when>
									<c:when test="${MemberVO.gradeNum == 3}">
										관리자
									</c:when>
									<c:when test="${MemberVO.gradeNum == 4}">
										대표
									</c:when>
								</c:choose>
							</td>
							<td class="mm9">
								<fmt:formatNumber value="${MemberVO.userAmount}" pattern="#,###"/>
								원
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br>
	<div class="t-left">
		<span>
			<input type="checkbox" id="all-check" class="all-check" style="margin-top: 6px; vertical-align: top; margin-left: 9px;">
		</span>
		<span class="fon12">
			<label for="all-check" class="all-label">
				선택한 회원을
			</label>
		</span>
		<span>
			<select id="changeGradeNum">
				<option value="0" selected="selected">정회원</option>
				<option value="1">우수회원</option>
				<option value="2">VIP</option>
				<option value="3">관리자</option>
				<option value="4">대표</option>
			</select>
		</span>
		<span class="fon12">
			(으)로
		</span>
		<span>
			<input type="button" id="update" class="update" value="변경">
		</span>
		<span>
			<input type="button" id="delete" class="delete" value="탈퇴">
		</span>
	</div>
<!-- 	페이징 처리 -->
<c:choose>
	<c:when test="${viewData.isEmpty()}">
	</c:when>
	<c:otherwise>
		<nav aria-label="Page navigation example">
			<ul class="pagination pg-dark">
				<c:choose>
					<c:when test="${viewData.currentPageNumber == 1}">
						<li class="page-item"><a class="page-link disabled">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber - 1}">Previous</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.pageTotalCount == 1}">
						<li class="page-item active"><a id="currentPage" class="page-link" name="1">1<span class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<c:forEach varStatus="i" begin="${viewData.startPage}"
							end="${viewData.endPage}">
							<c:choose>
							<c:when test="${i.index == viewData.currentPageNumber}">
								<li class="page-item active"><a id="currentPage" class="page page-link"
								name="${i.index}">${i.index}<span class="sr-only">(current)</span></a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page page-link"
								name="${i.index}">${i.index}</a></li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${viewData.currentPageNumber == viewData.pageTotalCount}">
						<li class="page-item"><a class="page-link disabled">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page page-link"
							name="${viewData.currentPageNumber + 1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</c:otherwise>
</c:choose>

<script type="text/javascript">



	
	$(document).ready(function(){
		
		//테이블 정렬
		addParser();
		//테이블 일부 정렬 비활성
		$(".tablesorter").tablesorter(
			{  headers : {
		 		      0 : {sorter : false},
// 		 		      3 : {sorter : false},
		 		      8 : {sorter : 'NumberSort'}
				 	}
			}
		);
		
		//loadMemberList.jsp를 불러오는 함수
		function loadMemberList(pageNumber){
			$(this).unbind();
			
		 	var startDate = $( "#startDate" ).val();
		 	var endDate = $( "#endDate" ).val();
			var gradeNum = $('#gradeNum').val();
			var search = $('#search').val();
			
			$.ajax({
				url : '<%=request.getContextPath()%>/admin/adminMember/memberManager/loadMemberList?startDate=' 
						+ startDate + '&endDate=' + endDate + '&pageNumber='+ pageNumber
						 + '&gradeNum=' + gradeNum + '&search=' + search,
				type : 'GET',
				error : function(error) {
			        alert("Error!");
			    },
				success : function(data) {
					$('#loadMemberList').html(data);
				}
			});
		}
		
		//페이지 번호를 클릭하면 다시 불러온다.
		$('.page').off('click').click(function() {
			var pageNumber = $(this).attr('name');
			loadMemberList(pageNumber);
		});
		
		//조회 버튼을 클릭하면 다시 불러온다.
		$('#select').off('click').click(function() {
			loadMemberList(1);
		});
		
		//검색창에서 엔터를 누르면 다시 불러온다.
		$('#search').off('keydown').keydown(function(key) {
			if (key.keyCode == 13) {
				loadMemberList(1);
			}
		});
		
		//all-check를 클릭하면 모든 check가 클릭된다.
		$(".all-check").change(function () {
		    $(".check").prop('checked', $(this).prop("checked"));
		});
		
		//선택한 항목을 업데이트
		$('#update').off('click').on('click', function(){
			
		    //로그인된 관리자의 등급
		    var adminGradeNum = Number(${memberInfo.gradeNum});
		    
		    //올릴 등급
		    var gradeNum = $('#changeGradeNum').val();
		    
		    console.log('내 등급 :' + adminGradeNum);
		    console.log('올릴 등급 :' + gradeNum);
		    
			//선택한 항목을 배열로 만들어준다.
		    var memberlength = $("input[name='userSeq']:checked").length;
			
			var warning = true;
			
			if (memberlength > 0) {
			    var memberArray = new Array(memberlength);
			    for(var i=0; i<memberlength; i++){                          
			    	
			    	memberArray[i] = $("input[name='userSeq']:checked")[i].value;
			    	
			    	//등급을 체크한다. - eq(i) jquery에서 n 번째 배열 요소를 찾는 것
			    	var thisGrade = Number($("input[name='userSeq']:checked").eq(i).attr('data-gradeNum'));
			    	
			    	console.log('현재회원 등급 :' + thisGrade);
			    	
			    	//다른 관리자일 경우 수정 불가 - 선택한 회원 중에 나와 같거나 높은 등급이 있거나, 올릴 등급이 3등급 이상이고 내 등급은 4등급 미만이거나, 선택한 회원이 4등급일때
			    	if ( thisGrade >= adminGradeNum || (gradeNum >= 3 && adminGradeNum < 4) || thisGrade == 4) {
						alert('다른 관리자를 수정 또는 탈퇴할 수 없습니다.');
						warning = false;
					}
			    	
			    }
				
			    //다른 관리자가 아닐 경우 수정한다.
			    if (warning) {
				    
					$.ajax({
						url : '<%=request.getContextPath()%>/admin/adminMember/memberManager/loadMemberList/changeGradeNum/' + gradeNum,
						method : 'POST',
						type: "json",
						data : JSON.stringify(memberArray),
						contentType: "application/json",
						error : function(error) {
					        alert("Error!");
					    },
						success : function(data) {
							alert(data);
							//기본 화면으로 불러온다. 여기서는 주문 관리
							$('#rightContent').load('<%=request.getContextPath()%>/admin/adminMember/memberManager');
						}
					});
				};

			} else {
				alert("선택된 회원이 없습니다.");
			}
		});
		
		//선택한 회원을 탈퇴처리
		$('#delete').off('click').on('click', function(){
			
			    //로그인된 관리자의 등급
			    var adminGradeNum = Number(${memberInfo.gradeNum});
			    
				//선택한 항목을 배열로 만들어준다.
			    var memberlength = $("input[name='userSeq']:checked").length;
				
				var warning = true;
			
				//선택한 항목을 배열로 만들어준다.
			    var memberlength = $("input[name='userSeq']:checked").length;
				if (memberlength > 0) {
					var delOK;
					delOK =	confirm('정말 회원을 탈퇴하시겠습니까?');
					if (delOK) {
					    var memberArray = new Array(memberlength);
					    for(var i=0; i<memberlength; i++){                          
					    	memberArray[i] = $("input[name='userSeq']:checked")[i].value;
					    	
					    	//등급을 체크한다.
					    	var thisGrade = Number($("input[name='userSeq']:checked")[i].gradeNum);
					    	
					    	//다른 관리자일 경우 수정 불가 - 선택한 회원 중에 나와 같거나 높은 등급이 있거나, 올릴 등급이 3등급 이상이고 내 등급은 4등급 미만이거나, 선택한 회원이 4등급일때
					    	if ( thisGrade >= adminGradeNum || thisGrade == 4) {
								alert('다른 관리자를 수정 또는 탈퇴할 수 없습니다.');
								warning = false;
							}
					    }
						
					  //다른 관리자가 아닐 경우 탈퇴한다.
					    if (warning) {
							$.ajax({
								url : '<%=request.getContextPath()%>/admin/adminMember/memberManager/loadMemberList/memberDelete',
								method : 'POST',
								type: "json",
								data : JSON.stringify(memberArray),
								contentType: "application/json",
								error : function(error) {
							        alert("Error!");
							    },
								success : function(data) {
									alert(data);
									//기본 화면으로 불러온다. 여기서는 주문 관리
									$('#rightContent').load('<%=request.getContextPath()%>/admin/adminMember/memberManager');
								}
							});
					    };
						
					};
				} else {
					alert("선택된 회원이 없습니다.");
				}
			
				
		});
		
		
		

		
	//$(document).ready의 끝
	});
	
</script>
<%@ include file="/WEB-INF/views/admin/common/adminBottom.jsp"%>	