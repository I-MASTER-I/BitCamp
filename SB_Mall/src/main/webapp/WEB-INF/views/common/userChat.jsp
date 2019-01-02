<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head><link rel="shortcut icon" href="<%=request.getContextPath()%>/img/favicon.ico">
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

html {
	width: 100%;
	height: 100%;
}

body {
	position: relative;
	z-index: 2147483647;
	width: 100%;
	height: 100%;
	color: #000;
	background-color: #fff;
}

#cardbox {
	background-color: #ffc828;
	width: 384px;
	height: 583px;
	padding-left: 0.4em;
	padding-right: 0.4em;
}

#iconImage {
	display: inline;
}

#titleText {
	display: inline-block;
	position: relative;
	font-size: 1.4em;
	font-weight: bold;
	color: #777;
}

#contentsText {
	color: #999;
}

#chat_box {
	height: 14em;
	overflow: auto;
}

.discussion {
	list-style: none;
	background: #9bbbd4;
	margin: 0;
	padding: 0 0 50px 0;
}

.discussion li {
	padding: 0.5em;
	overflow: hidden;
	display: flex;
}

.discussion .avatar {
	width: 40px;
	position: relative;
}

.discussion .avatar img {
	display: block;
	width: 100%;
}

.other .avatar:after {
	content: "";
	position: absolute;
	top: 0;
	right: 0;
	width: 0;
	height: 0;
	border: 5px solid white;
	border-left-color: transparent;
	border-bottom-color: transparent;
}

.self {
	justify-content: flex-end;
	align-items: flex-end;
}

.self .messages {
	order: 1;
	border-bottom-right-radius: 0;
}

.self .avatar {
	order: 2;
}

.self .avatar:after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 0;
	height: 0;
	border: 5px solid #fef01b;
	border-right-color: transparent;
	border-top-color: transparent;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
}

.messages {
	padding: 10px;
	border-radius: 2px 0px 0px 0px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
	font-family: 'Youth', sans-serif;
}
.messages p {
	font-size: 0.8em;
	margin: 0 0 0.2em 0;
}
.messages time {
	font-size: 0.7em;
	color: #ccc;
}
.chat_title{
   margin-top : 30px;
}
.times {
	font-size: 0.7em;
	color: #ccc;
}
.view {
	width: 371px;
	overflow: hidden;
}

.scrollBlind {
	width: 388px;
	height: 422px;
	overflow-y: scroll;
	border-radius: 5px;
	background-color: #9bbbd4;
}
#dataInput {
	float:left;
	width: 328px;
	height: ;
	margin: 0px;
	padding: 5px;
	border: none;
	font-size: 22px;
	font-family: 'Youth', sans-serif;
}
#sendButton {
	float:left;
	background-color: #fef01b;
	background-size: 43px 43px;
    height: 35px;  
    width: 35px;
}
.input {
	display: inline-block;
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
#chatOpenBtn {
	width: 40px;
	height: 40px;
	position: fixed;
	right: 10px; 
	bottom: 10px;
	cursor: pointer;
}
#closeButton {
	position: relative;
	cursor: pointer;
	margin-top: 8px;
	margin-bottom: 10px;
	margin-right: 5px;
}
.chatting {
	right: 30px;
	width: 414px;
	bottom: 30px;
	position: fixed;
	right: 10px;
	bottom: 10px;
	background-color: #787878;
	padding: 15px;
}

@font-face {
	font-family: 'Youth';
	font-style: normal;
	font-weight: 400;
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kywa/Youth/Youth.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/orgs/othrs/kywa/Youth/Youth.woff') format('woff');
}

</style>
</head>
<body>

	<!-- <div class="container">
		<h1 class = "chat_title">채팅</h1>
		<div class="ui segment" id="chat_box">

			<ol class="discussion">
				<li class="other">
					<div class="avatar">
						<img src="/public/images/user2.png" />
					</div>
					<div class="messages">
						<p>어디쯤이야? 다들 기다리고 있어.</p>
						<time datetime="2016-02-10 18:10">18시 10분</time>
					</div>
				</li>
				<li class="self">
					<div class="avatar">
						<img src="/public/images/user1.png" />
					</div>
					<div class="messages">
						<p>차가 막히네. 조금 늦을 듯.</p>
						<time datetime="2016-02-10 18:00">18시 00분</time>
					</div>
				</li>
				<li class="other">
					<div class="avatar">
						<img src="/public/images/user2.png" />
					</div>
					<div class="messages">
						<p>강남역에 있는 카페에 자리 잡았어.</p>
						<time datetime="2016-02-10 17:40">17시 40분</time>
					</div>
				</li>
			</ol>

		</div>
		<input type="text" id="msg">
		<button id="msg_process">전송</button>
	</div> -->
	
	
	
	<div id="chatBtn2">
		<a onclick="openChat()" id="chatOpenBtn"> <img
			src="<%=request.getContextPath()%>/img/chatButton.png"
			style="width: 40px; height: 40px;">
		</a>
	</div>
	
	<div id="chatBox" class="chatting wow zoomIn" style="display: none">
		
		<div id="cardbox" class="ui fluid card">
			 <div class="content" style="display: inline; width: 360px;">
			 	<!-- <div class="left floated author">
			 		<img id="iconImage" class="ui avatar image" src="./images/author.png">
				</div> -->
				<div style="display: inline;">
					<div id="titleText" class="header"><span>채팅 창</span></div>
   					<!-- <div id="contentsText" class="description">
				       	연결 및 로그인 후 메시지를 보내세요.
				    </div> -->
				    <button type="button" class="close" id="closeButton" onclick="closeChat()" aria-label="Close">
						<span aria-hidden="true"><img src="<%=request.getContextPath()%>/img/closeButton.png" style="width: 20px; height: 20px;"></span>
					</button>
				</div>
			 </div>
			
			<!-- 방만들기 -->
			<!-- <div>
				<input type="text" id="roomIdInput" value="meeting01" />
				<input type="text" id="roomNameInput" value="청춘들의대화" />

				<input type="button" id="createRoomButton" value="방만들기" />
				<input type="button" id="updateRoomButton" value="방이름바꾸기" />
				<input type="button" id="deleteRoomButton" value="방없애기" />
			</div>
			<br>
			<div id="roomList">
		
			</div>
    		<br>
    		<div>
				<input type="button" id="joinRoomButton" value="방입장하기" />
				<input type="button" id="leaveRoomButton" value="방나가기" />
			</div>
		    <br> -->
		    
		    <div class="description">
			    <span>받는사람 아이디 :</span> 
			    <div class="ui input">
			    	<input type="text" id="recepientInput" value="ALL" />
			    </div>
			 </div>
			 
		    <!-- 결과 표시 --> 
		    <h4 class="ui horizontal divider header">메시지</h4>
			<div class="ui segment" id="result">
			<div id="scrollView" class="view">
			<div id="scrollBlind" class="scrollBlind">
			  <ol id="scrolldown" class="discussion" style="max-height: 300px;">
			    <li class="other" style='background-color: #9bbbd4;'>
			      <div class="avatar">
			        <img src="<%=request.getContextPath()%>/img/apeach.png" />
			      </div>
			      <div class="messages" style="background-color: #ffffff;">
			        <p>어서오세요. 짠짠영의 채팅방입니다.</p>
			        <time datetime="2016-02-10 18:10">오후 15시 40분</time>
			      </div>
			    </li>
			    <li class="self" style='background-color: #9bbbd4;'>
			      <div class="avatar">
			        <img src="<%=request.getContextPath()%>/img/tube.png" />
			      </div>
			      <div class="messages" style="background-color: #fef01b;">
			        <p>상단의 받는사람 아이디를 입력해주세요.</p>
			        <time datetime="2016-02-10 18:00">오후 18시 00분</time>
			      </div>
			    </li>
			    <li class="other" style='background-color: #9bbbd4;'>
			      <div class="avatar">
			        <img src="<%=request.getContextPath()%>/img/apeach.png" />
			      </div>
			      <div class="messages" style="background-color: #ffffff;">
			        <p>'ALL' 입력 시 전체 사용자에게 메시지를 보냅니다.</p>
			        <time datetime="2016-02-10 17:40">오후 18시 30분</time>
			      </div>
			    </li>
			  </ol>
			</div>
			</div>
			</div>
			
			<!-- 전송하기 -->
		    <div>
			    
			    <div class="description">
			    	<div class="ui input">
			    		<input type="text" id="dataInput" value="안녕!" style="font-family: 'Youth', sans-serif;"/> 
			    		<input class="ui primary button" type="image" id="sendButton" src="<%=request.getContextPath()%>/img/sendbutton.png">
			    	</div>
			    </div>
			</div>    
			
		</div>
		
	</div>
	 
	
	
	<script src="http://13.125.232.201:3000/socket.io/socket.io.js"></script>
	
	<!-- <script>
		$(document).ready(function() {
			var socket = io("http://localhost:3000");

			//msg에서 키를 누를떄
			$("#msg").keydown(function(key) {
				//해당하는 키가 엔터키(13) 일떄
				if (key.keyCode == 13) {
					//msg_process를 클릭해준다.
					msg_process.click();
				}
			});

			//msg_process를 클릭할 때
			$("#msg_process").click(function() {
				//소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
				socket.emit("send_msg", $("#msg").val());
				//#msg에 벨류값을 비워준다.
				$("#msg").val("");
			});

			//소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			socket.on('send_msg', function(msg) {
				var writer = "${userSession.user_name}"
				console.log(writer);
				var img = '/public/images/user1.png';
				if (writer == 'other') {
					img = '/public/images/user2.png';
				}

				var contents = "<li class='" + writer + "'>"
							 + "  <div class='avatar'>"
							 + "    <img src='" + img + "' />"
							 + "  </div>"
							 + "  <div class='messages'>"
							 + "    <p>" + msg + "</p>"
							 + "    <time datetime='2016-02-10 18:30'>18시 30분</time>"
							 + "  </div>" + "</li>";
				$(".discussion").prepend(contents);
			});
		});
	</script> -->
	
	<script>
	
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
	
	<script>
		var host;
		var port;
		var socket;
		/* var url; */
		
		// 문서 로딩 후 실행됨
		$(function() {

			// 페이지 로드시 서버 접속
			$(document).ready(function(event) {
				
				host = '13.125.232.201';
				port = '3000';
				/* url = 'http://zzanchat-env.a3ppkmg2qr.ap-northeast-2.elasticbeanstalk.com'; */
				
				connectToServer();
            });

			// 전송 버튼 클릭 시 처리
            $("#sendButton").bind('click', function(event) {
            	var sender = "${memberInfo.userName}";
            	console.log(sender);
            	
            	var recepient = $('#recepientInput').val();
            	var data = $('#dataInput').val();

          		var output = {sender:sender, recepient:recepient, command:'chat', type:'text', data:data};
            	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
             		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
           			return;
             	}
           		
           		// 자동 스크롤
           		$("#scrollBlind").animate({scrollTop:10000}, 500);

           		// 텍스트창 지우기
           		$('#dataInput').val('');
           		
           		socket.emit('message', output);
           		
           		addToDiscussion(sender, data);
          	});
			
         	// 텍스트창에서 엔터 시 처리
            $("#dataInput").bind('keydown', function(key) {
					if (key.keyCode == 13) {
            	var sender = "${memberInfo.userName}";
            	
            	var recepient = $('#recepientInput').val();
            	var data = $('#dataInput').val();

          		var output = {sender:sender, recepient:recepient, command:'chat', type:'text', data:data};
            	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
             		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
           			return;
             	}
           		
           		// 자동 스크롤
           		$("#scrollBlind").animate({scrollTop:10000}, 500);

           		// 텍스트창 지우기
           		$('#dataInput').val('');
           		
           		socket.emit('message', output);
           		
           		addToDiscussion(sender, data);
					
            	}
          	});

			// 페이지 로드시 로그인정보 입력
            $(document).ready(function(event) {
            	var id = "${memberInfo.userId}";
            	var password = "${memberInfo.userPw}";
            	var alias = "${memberInfo.userName}";
            	var today = "";
            	
            	

            	var output = {id:id, password:password, alias:alias, today:today};
           		console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
            		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
            		return;
           		}
           		
           	// 방만들기 버튼 클릭 시 처리
                $("#createRoomButton").bind('click', function(event) {
                    var roomId = $('#roomIdInput').val();
                    var roomName = $('#roomNameInput').val();
                    var id = $('#idInput').val();
                    
                    var output = {command:'create', roomId:roomId, roomName:roomName, roomOwner:id};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }

                    socket.emit('room', output);
                });
             	
             	// 방이름바꾸기 버튼 클릭 시 처리
                $("#updateRoomButton").bind('click', function(event) {
                    var roomId = $('#roomIdInput').val();
                    var roomName = $('#roomNameInput').val();
                    var id = $('#idInput').val();
                    
                    var output = {command:'update', roomId:roomId, roomName:roomName, roomOwner:id};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }

                    socket.emit('room', output);
                });

             	// 방없애기 버튼 클릭 시 처리
                $("#deleteRoomButton").bind('click', function(event) {
                    var roomId = $('#roomIdInput').val();
                    
                    var output = {command:'delete', roomId:roomId};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }

                    socket.emit('room', output);
                });

             	// 방입장하기 버튼 클릭 시 처리
                $("#joinRoomButton").bind('click', function(event) {
                    var roomId = $('#roomIdInput').val();

                    var output = {command:'join', roomId:roomId};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }

                    socket.emit('room', output);
                });
             	
             	// 방나가기 버튼 클릭 시 처리
                $("#leaveRoomButton").bind('click', function(event) {
                    var roomId = $('#roomIdInput').val();

                    var output = {command:'leave', roomId:roomId};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }

                    socket.emit('room', output);
                });

            	socket.emit('login', output);
            });
		
        });
           
		// 서버에 연결하는 함수 정의
        function connectToServer() {

        	var options = {'forceNew':true};
        	var url = host + ':' + port;
        	socket = io.connect(url, options);

        	socket.on('connect', function() {
        		console.log('웹소켓 서버에 연결되었습니다. : ' + url);

                socket.on('message', function(message) {
                	console.log(JSON.stringify(message));
                	console.log('센더확인 ' + message.sender);
										
                	println('<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>');
	            	
                	var sessionCheck = "${memberInfo.userName}";
         			
                	
                	console.log('세션체크확인 ' + sessionCheck);
                	
                	if (message.sender != sessionCheck ) {
                		addToDiscussion(message.sender, message.data);
                	}
                	
                });
	
	            socket.on('response', function(response) {
	            	console.log(JSON.stringify(response));
	            	println('응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' + response.message);
	            });
	            
	         	// 그룹 채팅에서 방과 관련된 이벤트 처리
                socket.on('room', function(data) {
                    console.log(JSON.stringify(data));

                    println('<p>방 이벤트 : ' + data.command + '</p>');
                    println('<p>방 리스트를 받았습니다.</p>');
                    if (data.command == 'list') { // 방 리스트
                    	var roomCount = data.rooms.length;
                    	$("#roomList").html('<p>방 리스트 ' + roomCount + '개</p>');
                    	for (var i = 0; i < roomCount; i++) {
                    		$("#roomList").append('<p>방 #' + i + ' : ' + data.rooms[i].id + ', ' + data.rooms[i].name + ', ' + data.rooms[i].owner + '</p>');
                    	}
                    }
                });
	            
	        });

	        socket.on('disconnect', function() {
	        	println('웹소켓 연결이 종료되었습니다.');
	        });

   		}
           
		function println(data) {
			console.log(data);
			//$('#result').append('<p>' + data + '</p>');
		}
		
		function addToDiscussion(writer, msg) {
			console.log("addToDiscussion 호출됨 : " + writer + ", " + msg);
			
			var now = new Date();
			var nowHour = now.getHours();
	        var nowMin = now.getMinutes();
	        var nowTime = '';
	        
	        var me = "${memberInfo.userName}";
	        
	        
	        console.log(me);
	        var senders = 'self';
	        
	        if ( nowHour < 13  &&  nowHour  >= 0 ) {
	        	nowTime = '오전';
	        } else {
	        	nowHour = nowHour - 12;
	        	nowTime = '오후';
	        }
	        
			var img = '${pageContext.request.contextPath}/img/tube.png';
			var backcolor = "style='background-color: #fef01b;'";
			if (writer != me) {
				img = '${pageContext.request.contextPath}/img/apeach.png';
				senders = 'other';
				backcolor = "style='background-color: #ffffff;'";
			}
			
			var contents = "<li class='" + senders + "'style='background-color: '>"
						 + "  <div class='avatar'>"
						 + "    <img src='" + img + "' />"
		      			 + "  </div>"
		      			 + "  <div class='messages'" + backcolor + " >"
		        		 + "    <p>" + writer + " : " + msg + "</p>"
		        		 + "    <p class='times'>" + nowTime + " " + nowHour + '시' + " " + nowMin + '분' + "</p>"
		      			 + "  </div>"
		    			 + "</li>";
			
		    println("추가할 HTML : " + contents);
		    $(".discussion").append(contents);
		    
		 	// 자동 스크롤
       		$("#scrollBlind").animate({scrollTop:10000}, 500);
		    
		}
		
	</script>
	
	<!-- 
	<script type="text/javascript">
		// 버튼 눌렀을때 애니메이션 효과 적용
		new WOW().init();
	</script>
	 -->
</body>
</html>