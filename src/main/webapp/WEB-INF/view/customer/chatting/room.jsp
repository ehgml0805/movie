<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title></title>
<style>
*{
	box-sizing:border-box;
}
body{
	background-color:#777777;
	font-family:Arial;
}
#container{
	width:480px;
	height:750px;
	background:#eff3f7;
	margin:0 auto;
	font-size:0;
	border-radius:5px;
	overflow:hidden;
}

main{
	width:490px;
	height:800px;
	display:inline-block;
	font-size:15px;
	vertical-align:top;
}

h2,h3{
	margin:0;
}
.status{
	width:8px;
	height:8px;
	border-radius:50%;
	display:inline-block;
	margin-right:7px;
}
.green{
	background-color:#58b666;
}
.orange{
	background-color:#ff725d;
}
.blue{
	background-color:#6fbced;
	margin-right:0;
	margin-left:7px;
}

main header{
	height:100px;
	padding:30px 20px 30px 40px;
	background:#eff3f7;
}
main header > *{
	display:inline-block;
	vertical-align:top;
}
main header img:first-child{
	border-radius:50%;
}
main header img:last-child{
	width:24px;
	margin-top:8px;
}
main header div{
	margin-left:10px;
	margin-right:145px;
}
main header h2{
	font-size:16px;
	margin-bottom:5px;
}
main header h3{
	font-size:14px;
	font-weight:normal;
	color:#7e818a;
}
main header button{
	text-decoration:none;
	text-transform:uppercase;
	font-weight:bold;
	border:none;
	color:#6fbced;
	vertical-align:top;
	margin-left:333px;
	margin-top:5px;
	display:inline-block;
	font-size:16px;
}

#chatArea{
	padding-left:0;
	margin:0;
	list-style-type:none;
	overflow-y:scroll;
	height:500px;
	border-top:2px solid #fff;
	border-bottom:2px solid #fff;
}
#chatArea li{
	padding:10px 30px;
}
#chatArea h2,#chatArea h3{
	display:inline-block;
	font-size:13px;
	font-weight:normal;
}
#chatArea h3{
	color:#bbb;
}
#chatArea .entete{
	margin-bottom:5px;
}
#chatArea .msg{
	padding:20px;
	color:#fff;
	line-height:25px;
	max-width:90%;
	display:inline-block;
	text-align:left;
	border-radius:5px;
}
#chatArea .me{
	text-align:right;
}
#chatArea .you .msg{
	background-color:#58b666;
}
#chatArea .me .msg{
	background-color:#6fbced;
}
#chatArea .triangle{
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}
#chatArea .you .triangle{
		border-color: transparent transparent #58b666 transparent;
		margin-left:15px;
}
#chatArea .me .triangle{
		border-color: transparent transparent #6fbced transparent;
		margin-left:375px;
}

main footer{
	height:155px;
	padding:20px 30px 10px 20px;
}
main footer textarea{
	resize:none;
	border:none;
	display:block;
	width:100%;
	height:80px;
	border-radius:3px;
	padding:20px;
	font-size:13px;
	margin-bottom:13px;
}
main footer textarea::placeholder{
	color:#ddd;
}
main footer img{
	height:30px;
	cursor:pointer;
}
main footer button{
	text-decoration:none;
	text-transform:uppercase;
	font-weight:bold;
	border:none;
	color:#6fbced;
	vertical-align:top;
	margin-left:380px;
	margin-top:2px;
	display:inline-block;
	font-size:16px;
}
</style>
</head>
<body>
<div id="container">

	<main>
		<header>
			<img src="" alt="">
			<div>
				<h2>${room.name}님의 문의</h2>
			</div>
			<span>
				<button id="chat_end" style="text-align:right;">나가기</button>
			</span>
		</header>
		<ul id="chatArea"></ul>
		<footer>
			<textarea id='msg' placeholder="Type your message"></textarea>
			<button id="button_send">Send</button>
		</footer>
	</main>
</div>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
	$(document).ready(function(){
	
		var roomName = "${room.name}"; // 채팅방을 만든 고객 아이디
	    var roomId = "${room.roomId}"; // UUID
	    var username = "${loginId}"; // 로그인한 아이디
	
	    console.log(roomName + ", " + roomId + ", " + username + " : roomName, roomId, username");
		
	    // 오늘 날짜 시간 구하기
	    var now = new Date();
	    var hour = String(now.getHours()).padStart(2,"0");
	    var minutes = String(now.getMinutes()).padStart(2,"0");
	    var year = now.getFullYear();
	    var month = now.getMonth();
	    month = month + 1;
	    var date = now.getDate();
	    
	    var sockJs = new SockJS("/movie/stomp/chat");
	    //1. SockJS를 내부에 들고있는 stomp를 내어줌
	    var stomp = Stomp.over(sockJs);
	
	    //2. connection이 맺어지면 실행
	    stomp.connect({}, function (){
	       console.log("STOMP Connection")
	
	       //4. subscribe(path, callback)으로 메세지를 받을 수 있음
	       stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
	           var content = JSON.parse(chat.body);
	           var writer = content.writer; // 글작성자
	           var message = content.message;
	           var str = '';
	
	           if(writer === username) { // 로그인한 아이디와 같으면(내채팅)
	        	   console.log("내채팅")
	        	   str = "<li class='me'>";
	               str += "<div class='entete'>";
	               str += "<span class='status blue'></span>";
		           str += "<h2>" + writer + "</h2>&nbsp";
		           str += "<h3>" + hour + ":" + minutes + ", " + year + "-" + month + "-" + date + "</h3></div>";
		           str += "<div class='triangle'></div>";
		           str += "<div class='msg'>" + message + "</div></li>";
	               $("#chatArea").append(str);
	               $("#chatArea").stop().animate({ scrollTop: $("#chatArea")[0].scrollHeight}, 1000);   
	           }
	           else {
	        	   console.log("상대채팅")
	        	   str = "<li class='you'>";
	               str += "<div class='entete'>";
	               str += "<span class='status green'></span>";
		           str += "<h2>" + writer + "</h2>&nbsp";
		           str += "<h3>" + hour + ":" + minutes + ", " + year + "-" + month + "-" + date + "</h3></div>";
		           str += "<div class='triangle'></div>";
		           str += "<div class='msg'>" + message + "</div></li>";
	               $("#chatArea").append(str);
	               $("#chatArea").stop().animate({ scrollTop: $("#chatArea")[0].scrollHeight}, 1000);   
	           }
	
	       });
	
	       //3. send(path, header, message)로 메세지를 보낼 수 있음
	       stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
	    });
	
	    $("#button_send").on("click", function(e){
	        var msg = document.getElementById("msg");
	
	        console.log(username + ":" + msg.value);
	        stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
	        msg.value = '';
	    });
	    // 나가기버튼 클릭시
	    $("#chat_end").on("click", function(){
	    	var result = confirm("대화방을 나가시겠습니까?");
	    	if(result == true) {
	    		window.close();
	    	}
	    });
	    // 창을닫으면(X를 눌러서,나가기클릭) 상대방에게 퇴장메세지 출력
	    $(window).bind("beforeunload", function (e){
	    	stomp.send('/pub/chat/end', {}, JSON.stringify({roomId: roomId, writer: username}))
	    });
		// 새로고침 막기(F5, ctrl+F5, ctrl+r)
	    $(document).keydown(function (e) {
            if (e.which === 116) {
                if (typeof event == "object") {
                    event.keyCode = 0;
                }
                return false;
            } 
            else if (e.which === 82 && e.ctrlKey) {
                return false;
            }
	    });
	});
</script>
</body>
</html>