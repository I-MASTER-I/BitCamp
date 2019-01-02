<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>join</title>
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- joinForm.css -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/css/joinForm.css">

<!-- 주소 API -->
<script>
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.

		/**상대경로**/
		//var pop = window.open("popup/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		/**절대경로**/
		var pop = window.open("join/popup/jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
	}
	
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="commonBannerBox">
	<h3 class="rowdCommonBannerH3">회원가입</h3>
</div>

<form class="text-center  p-5" method="post" name="form" id="form">
<div id="freeboard_wrap_1">
<div id="freeboard_wrap_2">
	
	<!-- Start of Content -->
	<div id="freeboard_Content">
	
	<div id="email_ID_wrap">
	<!-- Email 입력 테그 -->
	<div>
		<input type="email" id="email_ID"
		class="all_Input"  placeholder="E-mail (Id)" name="userId"
		required onkeyup="emailDuplicateCheck_Function()" auth="false">
	</div>
	<!-- Email 유효성 Message 출력 -->
	<div>
		<small id="email_Output_ID" class="form-text  mb-4">메일주소를 정확히 입력해주세요.</small>
	</div>
	</div><!-- End of email_ID_wrap -->
	
	<div id="password_ID_wrap">
	<div>
	<!-- Password 입력 테그 -->
	<input 
		id="password_ID"
		type="password" 
		class="all_Input" 
		name="userPw"
		onkeyup="passwordCheck_Function()" 
		required placeholder="비밀번호"
		auth="false">

	<!-- Password 재확인 입력 테그 -->
	<input 
		id="reconfirmPassword_ID"
		type="password" 
		class="all_Input" 
		name="userPwChck"
		onkeyup="passwordCheck_Function()" 
		required placeholder="비밀번호 확인">
				
	</div>
	<div>
		<!-- 비밀번호 유효성 Message 출력 -->
		<small id="password_Output_ID" class="form-text  mb-4">비밀번호를 정확히 입력해 주세요.</small>
	</div>
	</div><!-- End of password_ID_wrap -->
	
	<div id="userName_IDuserBirthday_ID_wrap">
	<div style="justify-content: space-between; flex-wrap: wrap; display: flex;">
	<!-- 이름 입력 테그 -->
	<input type="text" id="userName_ID" class="all_Input"
			name="userName" required placeholder="성명"
			onkeyup="nameCheck_Function()"
			auth="false">
						
	<!-- 생년월일 입력 테그 -->
	<input type="text" id="userBirthday_ID" class="all_Input"
		name="regID" required placeholder="(*) ex) 19001010" auth="false">
	</div>
	
	<div>
		<!-- 이름 유효성 Message,생년월일 유효성 Message 출력 -->
		<small id="nameAndBirthDay_Output_ID" class="form-text  mb-4">성명과 생명월일을 정확히 입력해 주세요</small>
	</div>
	</div><!-- userName_ID&userBirthday_ID_wrap -->
	
	<div id="phoneNumber_IDuserGender_ID_wrap">
	<div style="justify-content: space-between; flex-wrap: wrap;">
		<!-- 폰번호 입력 테그 -->
		<input type="text"
			id="phoneNumber_ID" class="all_Input"
			placeholder="휴대폰 번호"
			name="phone"
			required
			onkeyup="phoneNumber_CheckFunction()"
			auth="false"> 
		<!-- 성별 입력 테그 -->
		<select id="userGender_ID" form="form" class="form-control form_gender"	name="gender"> 
  			<option value="남성">남성</option>
  			<option value="여성">여성</option>
		</select>
	</div>
	<div>
		<!-- 폰번호 유효성 출력 테그 -->
		<small id="phoneNumber_Output_ID" class="form-text  mb-4"> - 를 빼고 입력하세요 </small>
	</div>
	</div><!-- End of phoneNumber_IDuserGender_ID_wrap -->
	
	<div id="content_addressAPI_wrap">
	<div style="justify-content: space-between; flex-wrap: wrap;">
		<!-- 우편번호 -->
		<input type="text" id="zipNo" class="all_Input"
			placeholder="우편번호" name="zipCode" required
			readonly="readonly"
			onkeyup="addressAPI()">
		<!-- 주소검색버튼 -->
		<input type="button" id="searchZip" onClick="goPopup();" value="주소검색"
			class="all_Button"/>
	</div>
	<div>
		<!-- 주소 -->
		<input type="text" id="roadAddrPart1" class="all_Input"
			placeholder="주소"
			name="address1" readonly="readonly">
	</div>
	<div>
		<!-- 상세주소 -->
		<input type="text" id="addrDetail" class="all_Input"
			placeholder="상세주소"
			name="address2"
			auth="false"
			>
	</div>
	<!-- 주소API 끝-->
	<div>
	<small id="addressAPI_Output_ID"
		class="form-text  mb-4"> 주소를 정확히 입력하세요. 상품 주문시
		사용됩니다. </small>
	</div>
	</div><!-- End of "content_addressAPI_wrap" -->

	
	

	</div><!-- End of div freeboard_Content-->
	
	<!-- Start of footer -->
	
	
	<div id="freeboard_Footer">
	<!-- Sign up button -->
	<div style="margin: 23px 0;">
    <input id="footer_button_Send" class="all_Button" type="button" onclick="checkFunction()" value="회원 가입"></input>
	<a href="<%=request.getContextPath()%>/">
		<button id="footer_button_Cancel" type="button" class="all_Button">취소</button>
	</a>
	</div>
	<!-- Social register -->
				<p>or sign up with:</p>

				<a type="button" class="socialRegister_Icon"> <i
					class="fa fa-facebook"></i>
				</a> <a type="button" class="socialRegister_Icon"> <i
					class="fa fa-twitter"></i>
				</a> <a type="button" class="socialRegister_Icon"> <i
					class="fa fa-linkedin"></i>
				</a> <a type="button" class="socialRegister_Icon"> <i
					class="fa fa-github"></i>
				</a>

				<hr>
		<p>
			By clicking <em>Sign up</em> you agree to our <a href=""
				target="_blank">terms of service</a> and <a href=""
				target="_blank">terms of service</a>.
		</p>
	
	</div><!-- End of div freeboard_footer-->
	
</div>
</div>
</form>


	<script>
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
	/*1.Email 정규식 + 실시간 중복검사*/
	//정규식 조건-(조건에 해당되지 않을때 false를 반환)
	function emailDuplicateCheck_Function() {

		var userId = $('#email_ID').val();

		/* [1]. 1)정규식  2)중복검사  */
		//1). 정규식에 맞지 않을때 맞을때
		if (!( mailJ.test($('#email_ID').val()) )) {
			$('#email_ID').attr('auth', 'false')
			//출력될 Label
			$('#email_Output_ID').css('color','red').text("Email형식에 맞지 않습니다.");

		} else {
		//2).정규식에 맞을때
		//	1 중복검사
			$.ajax({
				type : 'POST',
				url : 'join/id_DuplicateCheck',
				data : {userId : userId},
				/* error : alert('Error'), */
				success : function(data) {
					//Console 창으로 data확인

					if (data == 0) {
						$('#email_Output_ID').css('color','green').html('사용할 수 있는 아이디 입니다.');
						$('#email_ID').attr('auth', 'true')
						console.log('email_ID auth : true');
							
					} else {

						$('#email_Output_ID').css('color','red').html('중복된 아이디 입니다.');
						$('#email_ID').attr('auth', 'false')
// 						console.log('email_ID auth : false');
					}//end of if (data == 0)
				
				}//end of success : function(data)
				
			})//end of $.ajax
				
		}//end of if
		
	}//End of method /*1.Email 정규식 + 실시간 중복검사*/
	

	// 비밀번호 정규식
// 	var newPassword_RE = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	var newPassword_RE = /^[A-Za-z0-9]{6,12}$/;
	
	/*[2]. 비밀번호 정규식 (원본)*/
	function passwordCheck_Function() {
			
    	var pw1 = $('#password_ID').val();
    	var pw2 = $('#reconfirmPassword_ID').val();
    		
		//1.정규식에 부합할때
		if ( newPassword_RE.test(pw1)) {
                
   			if (pw1 != pw2) {
   				//1.1 비밀번호가 서로 일치하지 않을때 auth : false
    			$('#password_Output_ID').css('color','red').html('비밀번호가 서로 일치하지 않습니다.');
    			 
    			$('#password_ID').attr('auth', 'false');
    		} else {
   				//1.2 비밀번호가 서로 일치하면 auth : true >가입 가능
   				
    			$('#password_Output_ID').css('color','green').html('비밀번호가 서로 일치합니다.');
   				
    			$('#password_ID').attr('auth', 'true');

    		}
            
		} else {
            //2.정규식에 부합하지않을때
            
            if(pw1.length>=6 && pw1.length<=12){
            	
    			$('#password_Output_ID').css('color','red').html('숫자,영문 포함'); 
            	
	    		$('#password_ID').attr('auth', 'false')
            	
            }else{
    			$('#password_Output_ID').css('color','red').html('6자 이상 12자 이하');                
            	
	    		$('#password_ID').attr('auth', 'false')
            	
            }
		}
		
	}//End of method /*비밀번호 재확인*/
	
	/*[3]. 이름 정규식*/
	var nameCheck1 = /^[가-힣]{1,}$/;
	var nameCheck2 = /^[a-zA-Z]{1,}$/;
	var koreaName = /^[가-힣]{2,6}$/;
	var englishName = /^[a-zA-Z]{2,}$/;
	function nameCheck_Function() {
		
		var name = $('#userName_ID').val();
		console.log(name);
		
		if (nameCheck1.test(name)) {
			console.log('한글 이름');
			if (koreaName.test(name)) {
				$('#nameAndBirthDay_Output_ID').css('color','green').html('적합');                
	    		$('#userName_ID').attr('auth', 'true')
			}else{
				$('#nameAndBirthDay_Output_ID').css('color','red').html('정확한 한글 이름을 입력 해 주세요');                
	    		$('#userName_ID').attr('auth', 'false')
					
			}
		}else if(nameCheck2.test(name)){
				console.log('영문 이름');
			if (englishName.test(name)) {
				$('#nameAndBirthDay_Output_ID').css('color','green').html('correct');                
	    		$('#userName_ID').attr('auth', 'true')
			}else{
				$('#nameAndBirthDay_Output_ID').css('color','red').html('Please enter the correct name');                
	    		$('#userName_ID').attr('auth', 'false')
					
			}
		}else{
				$('#nameAndBirthDay_Output_ID').css('color','red').html('한글, 영어 외 사용불가');                
	    		$('#userName_ID').attr('auth', 'false')
			
		}
		
	}//End of method /*[3]이름 정규식*/
		
		
	/*[4]. 생년월일 유효성 체크*/

	/* 
	function birthdayCheckFunction() {
		if (birthJ.test($('#userBirthday_ID').val())) {
			
			$('#nameAndBirthDay_Output_ID').html('<h6 style="color: green;"> 적합</h6>');                
		}else{
			$('#nameAndBirthDay_Output_ID').html('<h6 style="color: red;">부적합</h6>');                
			
		}
	} 
	*/
	
	// 생일 정규식
	var birthJ = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
		 
	$('#userBirthday_ID').focusout(function birthdayCheckFunction() {
	
		var dateStr = $(this).val();		
		
	    var year = Number(dateStr.substr(0,4)); 
	    var month = Number(dateStr.substr(4,2));
	    var day = Number(dateStr.substr(6,2));
	    var today = new Date(); // 날자 변수 선언
	    var yearNow = today.getFullYear();
		 
	    //by솔또리
	    //1.입력된 생년월일이 8자 이하일때 : 정상으로 간주  > 로직 수행
		if (dateStr.length <=8) {
			
	    if ((yearNow<year)||(year<1900)){
	    	
	    	$('#nameAndBirthDay_Output_ID').css('color','red').html('년도를 확인하세요'); 
	    	$('#userBirthday_ID').attr('auth', 'false');
	    	
	    }else if ((month<1)||(12<month)) {
	    		
	    	$('#nameAndBirthDay_Output_ID').css('color','red').html('달은 1월부터 12월까지 입력 가능합니다.'); 
	    	$('#userBirthday_ID').attr('auth', 'false');
	    
	    }else if (day < 1 || day > 31) {
	    	
	    	$('#nameAndBirthDay_Output_ID').css('color','red').html('일은 1일부터 31일까지 입력가능합니다.'); 
	    	$('#userBirthday_ID').attr('auth', 'false');
	    	
	    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	 
	    	$('#nameAndBirthDay_Output_ID').css('color','red').html(' <'+month+'>월은 31일이 존재하지 않습니다.'); 
	    	$('#userBirthday_ID').attr('auth', 'false');
	    	 
	    }else if (month == 2) {
	    	 
	       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	       	
	     	if (day>29 || (day==29 && !isleap)) {
	     		
	     		$('#nameAndBirthDay_Output_ID').css('color','red').html(''+ year + " 년 2월은  " + day + ' 일이 없습니다.'); 
	    		$('#userBirthday_ID').attr('auth', 'false');
	    	
			}else{
				
				$('#nameAndBirthDay_Output_ID').css('color','green').html('적합'); 
			    $('#userBirthday_ID').attr('auth', 'true');
			}//end of if (day>29 || (day==29 && !isleap))
	     	
	    }else{
	    	
			$('#nameAndBirthDay_Output_ID').css('color','green').html('적합'); 
			$('#userBirthday_ID').attr('auth', 'true');
			
		}//end of if
		
		}else{
			//1.입력된 생년월일이 8자 초과할때 :  auth:false
	     	$('#nameAndBirthDay_Output_ID').css('color','red').html('8자리 이상 벗어날 수 없습니다.'); 
	    	$('#userBirthday_ID').attr('auth', 'false');
		}
	})//End of method /*[4]. 생년월일 유효성 체크*/
	
	
	
	/*[5].휴대폰번호 정규식*/
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	var numberCheck1 = /^01[0|1|6|7|8|9]{1,}$/;
	
	function phoneNumber_CheckFunction() {
		
		var phoneNumber = $('#phoneNumber_ID').val();
		
			
			if (phoneJ.test(phoneNumber)) {
				console.log('숫자입력 확인' + phoneNumber);
					
				//2018.11.23 입력된 폰번호 10자 이상 입력시 유효성 로직 수행
				if (phoneNumber.length >= 10) {
					$('#phoneNumber_Output_ID').css('color','green').html('적합');                
			    	$('#phoneNumber_ID').attr('auth', 'true')
		    		console.log('phoneNumber_ID auth : true');
				
				
				}else{
				//2018.11.23 입력된 폰번호 10자 미만 입력시 아래 문장 출력
					$('#phoneNumber_Output_ID').css('color','red').html('핸드폰 번호 뒷자리를 정확히 입력 해 주세요');                
			    	$('#phoneNumber_ID').attr('auth', 'false')
			    	console.log('phoneNumber_ID : false');
				}//End of if (phoneNumber.length >= 10)
		    	
			}else{
					
				$('#phoneNumber_Output_ID').css('color','red').html('번호를 정확히 입력 해 주세요');                
		    	$('#phoneNumber_ID').attr('auth', 'false')
		    	console.log('phoneNumber_ID : false');
					
			}//End of if (phoneJ.test(phoneNumber))
	}//End of method /*[5].휴대폰번호 정규식*/
	
	/*[6].상세주소 입력 확인*/
	//출력 테그 id: addressAPI_Output_ID
	$('#addrDetail').focusout(
			function addressAPI() {
				var check = $(this).val();
				if (check < 1) {
					$('#addressAPI_Output_ID').css('color','red').html('부적합');                
				    $('#addrDetail').attr('auth', 'false');
    				console.log('addrDetail Auth : false');
				}else{
					$('#addressAPI_Output_ID').css('color','green').html('적합');                
				    $('#addrDetail').attr('auth', 'true');
    				console.log('addrDetail Auth : true');
		
				}
			}
		);
	
	
		 
	/*[0]. Final 유효성 최종 확인 후 submit*/
	function checkFunction() {
	            
	   	//Auth속성이 설정된 그룹
		var auth_group = ["#email_ID","#password_ID","#userName_ID","#userBirthday_ID","#phoneNumber_ID","#addrDetail"];
	    //입력 그룹의 각 유효성 통과 여부(auth 속성이 true) - true가 아니면 return한다.
	    	
	    for (var i = 0; i < auth_group.length; i++) {
	    	//1. auth_group 속성이 true가  아닐때 return 
	        //auth(auth_group[i]) : 테그에 설정된 auth값
	        if (auth(auth_group[i])){
	        	console.log(auth_group[i]+' Auth : '+auth(auth_group[i]));
	        		
	        	//1.1 모든 auth 설정이 true일때
	        	if (auth_group.length = 5) {
					$('#addressAPI_Output_ID').css('color','green').html('회원가입 가능');                
				}else{
	        	//1.2 auth 설정이 false일때
					$('#addressAPI_Output_ID').css('color','red').html('회원가입 불가');                
				}
	  		}else{
	        //2. auth_group 속성이 false일때 아래 문장 출력
	        	console.log(auth_group[i]+' Auth : '+auth(auth_group[i]));
	        	alert(auth_group[i]+' Auth : '+auth(auth_group[i]));
	            return;
	        }
	  	}// end of for
	                        
	   	//auth 속성이 true인지 확인 - auth는 사용자 정의 속성으로 만든것이며 true이면 입력 유효성 통과한것
		function auth(e) {
					
	    	//입력테그에 부여한 auth속성이 true일때
 	        if ($(e).attr('auth') == 'true') {
 	            	
	        	console.log('성공');
	            return true;
	       	} else {
	        	console.log('실패');
	            $(e).focus();
	            return false;
	        }
	 	}// end of function auth(e)
	            
		//모든 유효성 통과하여 반복문을 빠져나오면 submit한다.
	    alert("가입을 축하합니다!");
	   	$("#form").submit();

	}//End of method /*[6]. Final 유효성 최종 확인 후 submit*/ 
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>