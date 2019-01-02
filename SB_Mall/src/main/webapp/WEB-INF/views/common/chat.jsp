<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Chatting Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/css/mdb.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.13/js/mdb.min.js"></script>
<script type="text/javascript" src="resources/js/sockjs-1.0.3.min.js"></script>

<style>
.bubble {
	position: relative;
	padding: 5px;
	margin: 5px 0px;
	background: #FFc828;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 5px;
	left: 5px;
	right: 5px;
	margin-right: 20px;
	display: inline-block;
}

/* .bubble:after 
{
content: '';
position: absolute;
border-style: solid;
border-width: 15px 20px 15px 0;
border-color: transparent #FFFF77;
display: block;
width: 0;
z-index: 1;
left: 0px;
top: 37px;
} */

/* .bubble:before 
{
content: '';
position: absolute;
border-style: solid;
border-width: 16px 21px 16px 0;
border-color: transparent #000000;
display: block;
width: 0;
z-index: 0;
left: -3px;
top: 10px;
} */
.chatting {
	right: 30px;
	width: 500px;
	bottom: 30px;
	position: fixed;
	right: 10px;
	bottom: 10px;
	background-color: #787878;
	padding: 15px;
}

#closeButton {
	float: right;
	display: inline-block;
	cursor: pointer;
	margin-bottom: 10px;
}

#chatOpenBtn {
	width: 40px;
	height: 40px;
	position: fixed;
	right: 10px;
	bottom: 10px;
	cursor: pointer;
}

#chatMessage {
	padding: 10px;
	overflow: auto;
	overflow-y: scroll;
	overflow-x: hidden;
	word-break: break-all;
}

.view {
	width: 450px;
	overflow: hidden;
}

.scrollBlind {
	width: 490px;
	height: 100%;
	overflow-y: scroll;
	border-radius: 5px;
	background-color: #f0f0f0;
}

#message {
	width: 300px;
}

#sendMessage {
	width: 30px;
	height: 30px;
	position: relative;
	left: 5px;
	top: 9px;
}

#chatBox {
	border-radius: 10px;
	box-shadow: 10px 10px 30px #000808;
	-webkit-transition: width 2s, height 2s, background-color 2s,
		-webkit-transform 2s;
	transition: width 2s, height 2s, background-color 2s, transform 2s;
}

#chatBox: {
	width: 200px;
	height: 200px;
	-webkit-transform: rotate(180deg);
	transform: rotate(180deg);
}
</style>

<script type="text/javascript">
	var sock = null;

	// 메시지 입력 후 출력하는 구문
	$(document).ready(
			function() {
				
				sock = new SockJS("/echo-ws");
				
				sock.onopen = function() {
					sock.send("님이 입장하셨습니다.");
				}

				sock.onmessage = function(evt) {
					// alert(evt.data);
					$("#chatMessage").append(evt.data + "<br/>");
				}

				sock.onclose = function() {
					sock.send("퇴장");
				}

				$("#sendMessage").click(
						function() {
							if ($("#message").val() != "") {
								sock.send('<div class="bubble">'
										+ $("#message").val() + '</div>');
								// $("#chatMessage").append("나 -> " + $("#message").val() + "<br/>");
								$("#message").val("");
							}
							$("#chatMessage").scrollTop(
									$("#chatMessage")[0].scrollHeight);
						})

				$("#message").keydown(
						function(key) {
							if (key.keyCode == 13) {
								$("#sendMessage").trigger("click");
							}
							$("#chatMessage").scrollTop(
									$("#chatMessage")[0].scrollHeight);
						});

			});

	/* // 스크롤바 항시 밑으로 위치시키는 구문 <- 항상 밑으로 내려가버려 위로 올릴수없음
	$(document).ready(function(){ 
		setInterval(function(){scroll()}, 200); 
		function scroll(){ 
			$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
		} 
	}); */

	// 채팅버튼 눌렀을때
	function openChat() {
		/* $("#chatBox").removeClass("zoomIn");
		$("#chatBox").addClass("zoomOut"); */
		var chat = document.getElementById("chatBox");
		var chatBtn = document.getElementById("chatBtn2");
		chat.style.display = "block";
		chatBtn.style.display = "none";
		
	}

	// 닫기버튼 눌렀을때
	function closeChat() {
		/* $("#chatBox").removeClass("zoomOut");
		$("#chatBox").addClass("zoomIn"); */
		var chat = document.getElementById("chatBox");
		var chatBtn = document.getElementById("chatBtn2");
		chat.style.display = "none";
		chatBtn.style.display = "block";
		
	}
	
</script>



</head>
<body>

	<div id="chatBox" class="chatting wow zoomIn" style="display: none">

		<h4 style="display: inline-block; color: #FFC828;">Chatting Page</h4>
		<button type="button" class="close" id="closeButton" onclick="closeChat()" aria-label="Close">
			<span aria-hidden="true"><img
			src="<%=request.getContextPath()%>/img/closeButton.png"
			style="width: 20px; height: 20px;"></span>
		</button>
		<div>
			<input type="text" id="message" /> <input type="image"
				id="sendMessage"
				src="<%=request.getContextPath()%>/img/sendButton2.png" />

		</div>
		<br>
		<div id="scrollView" class="view">
			<div id="scrollBlind" class="scrollBlind">
				<div id="chatMessage" style="max-height: 500px;"></div>
			</div>
		</div>

	</div>

	<div id="chatBtn2">
		<a onclick="openChat()" id="chatOpenBtn"> <img
			src="<%=request.getContextPath()%>/img/chatButton.png"
			style="width: 40px; height: 40px;">
		</a>
	</div>

</body>


<script type="text/javascript">
	// 버튼 눌렀을때 애니메이션 효과 적용
	new WOW().init();
</script>

</html>