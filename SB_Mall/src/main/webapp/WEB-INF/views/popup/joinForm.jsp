<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico"> 
<meta charset="UTF-8">
<title>join</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>

<style>
body {
	background-color: #f5f5f5;
}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<br>
	<br>
	<div id="contents">
		<div style="margin: 30px auto 20px auto; width: 600px;">
			<!-- Default form register -->
			<form class="text-center  p-5" method="post">

				<p class="h4 mb-4"><b>회원가입</b></p>

				<input type="email" id="defaultRegisterFormFirstName"
					class="form-control" placeholder="E-mail (Id)" name="userId"
					required> <small id="defaultRegisterFormPasswordHelpBlock"
					class="form-text text-muted mb-4">메일주소를 정확히 입력해주세요.</small>

				<div class="form-row mb-4">
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword"
							class="form-control" name="userPw" required placeholder="비밀번호"
							aria-describedby="defaultRegisterFormPasswordHelpBlock">
					</div>
					<div class="col">

						<input type="password" id="defaultRegisterFormPassword"
							class="form-control" name="userPwChck" required
							placeholder="비밀번호 확인"
							aria-describedby="defaultRegisterFormPasswordHelpBlock">
					</div>
				</div>

				<input type="text" id="defaultRegisterFormLastName"
					class="form-control" name="userName" required placeholder="이름">

				<small id="defaultRegisterFormPasswordHelpBlock"
					class="form-text text-muted mb-4"></small> <input type="text"
					id="defaultRegisterPhonePassword" class="form-control"
					placeholder="휴대폰 번호"
					aria-describedby="defaultRegisterFormPhoneHelpBlock" name="phone" required> <small
					id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4" > -
					를 빼고 입력하세요 </small> <input type="text" id="defaultRegisterPhonePassword"
					class="form-control" placeholder="우편번호" name="zipCode" required
					aria-describedby="defaultRegisterFormPhoneHelpBlock"> <small
					id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4"> </small>

				<div class="form-row mb-4">
					<div class="col">
						<input type="text" id="defaultRegisterPhonePassword"
							class="form-control" placeholder="주소"
							aria-describedby="defaultRegisterFormPhoneHelpBlock"
							name="address1">
					</div>
					<div class="col">
						<input type="text" id="defaultRegisterPhonePassword"
							class="form-control" placeholder="상세주소"
							aria-describedby="defaultRegisterFormPhoneHelpBlock"
							name="address2">
					</div>
				</div>
				<small id="defaultRegisterFormPhoneHelpBlock"
					class="form-text text-muted mb-4"> 주소를 정확히 입력하세요. 상품 주문시
					사용됩니다. </small>


				<!-- Sign up button -->
				<div id="member_button">
					<button class="btn my-4 btn-block" style="background-color: #ffc828; font-size: 18px;" type="submit">회원 가입</button>
				</div>

				<!-- Social register -->
				<p>or sign up with:</p>

				<a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-facebook"></i>
				</a> <a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-twitter"></i>
				</a> <a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-linkedin"></i>
				</a> <a type="button" class="light-blue-text mx-2"> <i
					class="fa fa-github"></i>
				</a>

				<hr>

				<p>
					By clicking <em>Sign up</em> you agree to our <a href=""
						target="_blank">terms of service</a> and <a href=""
						target="_blank">terms of service</a>.
				</p>
			</form>
		</div>
	</div>





</body>
</html>