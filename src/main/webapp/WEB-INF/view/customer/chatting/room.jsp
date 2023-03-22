<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	box-sizing:border-box;
}
body{
	background-color:#abd9e9;
	font-family:Arial;
}
#container{
	width:750px;
	height:800px;
	background:#eff3f7;
	margin:0 auto;
	font-size:0;
	border-radius:5px;
	overflow:hidden;
}
aside{
	width:260px;
	height:800px;
	background-color:#3b3e49;
	display:inline-block;
	font-size:15px;
	vertical-align:top;
}
main{
	width:490px;
	height:800px;
	display:inline-block;
	font-size:15px;
	vertical-align:top;
}

aside header{
	padding:30px 20px;
}
aside input{
	width:100%;
	height:50px;
	line-height:50px;
	padding:0 50px 0 20px;
	background-color:#5e616a;
	border:none;
	border-radius:3px;
	color:#fff;
	background-image:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat:no-repeat;
	background-position:170px;
	background-size:40px;
}
aside input::placeholder{
	color:#fff;
}
aside ul{
	padding-left:0;
	margin:0;
	list-style-type:none;
	overflow-y:scroll;
	height:690px;
}
aside li{
	padding:10px 0;
}
aside li:hover{
	background-color:#5e616a;
}
h2,h3{
	margin:0;
}
aside li img{
	border-radius:50%;
	margin-left:20px;
	margin-right:8px;
}
aside li div{
	display:inline-block;
	vertical-align:top;
	margin-top:12px;
}
aside li h2{
	font-size:14px;
	color:#fff;
	font-weight:normal;
	margin-bottom:5px;
}
aside li h3{
	font-size:12px;
	color:#7e818a;
	font-weight:normal;
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
	height:110px;
	padding:30px 20px 30px 40px;
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

#chatArea{
	padding-left:0;
	margin:0;
	list-style-type:none;
	overflow-y:scroll;
	height:535px;
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
	margin-left:333px;
	margin-top:5px;
	display:inline-block;
}
</style>
</head>
<body>
<div id="container">
	<aside>
		<ul>
			<li>
				<img src="" alt="">
				<div>
					<h2>${room.name}</h2>
				</div>
			</li>
		</ul>
	</aside>
	<main>
		<header>
			<img src="" alt="">
			<div>
				<h2>${loginName}(${loginId})님의 문의</h2>
			</div>
		</header>
		<ul id="chatArea"></ul>
		<footer>
			<textarea id='msg' placeholder="Type your message"></textarea>
			<button id="button_send">Send</button>
			<button id="chat_end">나가기</button>
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
	
	    var sockJs = new SockJS("/movie/stomp/chat");
	    //1. SockJS를 내부에 들고있는 stomp를 내어줌
	    var stomp = Stomp.over(sockJs);
	
	    //2. connection이 맺어지면 실행
	    stomp.connect({}, function (){
	       console.log("STOMP Connection")
	
	       //4. subscribe(path, callback)으로 메세지를 받을 수 있음
	       stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
	           var content = JSON.parse(chat.body);
	
	           var writer = content.writer;
	           var message = content.message;
	           var str = '';
	
	           if(writer === username) { // 로그인한 아이디와 같으면(내채팅)
	        	   console.log("내채팅")
	        	   str = "<li class='me'>";
	               str += "<div class='entete'>";
	               str += "<span class='status blue'></span>";
		           str += "<h2>" + writer + "</h2>";
		           str += "<h3>10:12AM, Today</h3>";
		           str += "</div>";
		           str += "<div class='triangle'></div>";
		           str += "<div class='msg'>" + message + "</div></li>";
	               $("#chatArea").append(str);
	           }
	           else {
	        	   console.log("상대채팅")
	        	   str = "<li class='you'>";
	               str += "<div class='entete'>";
	               str += "<span class='status green'></span>";
		           str += "<h2>" + writer + "</h2>";
		           str += "<h3>10:12AM, Today</h3>";
		           str += "</div>";
		           str += "<div class='triangle'></div>";
		           str += "<div class='msg'>" + message + "</div></li>";
	               $("#chatArea").append(str);
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
	    		stomp.send('/pub/chat/end', {}, JSON.stringify({roomId: roomId, writer: username}))
	    		$(location).attr("href", "rooms")
	    	} 
	    });
	    
	});
</script>
</body>
</html>