<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Room</title>
	<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2>Vincent</h2>
					<h3>10:12AM, Today</h3>
				</div>
				<div class="triangle"></div>
				<div class="message">
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.
				</div>
			</li>
</head>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script>
		$(document).ready(function(){
		
			var roomName = "${room.name}"; // 채팅방을 만든 고객 아이디
		    var roomId = "${room.roomId}"; // UUID
		    var username = "${loginId}"; // 로그인한 아이디
		
		    console.log(roomName + ", " + roomId + ", " + username " : roomName, roomId, username);
		
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
		
		           if(writer === username) {
		        	   console.log("내채팅")
		        	   str = "<div class='col-6'>";
		               str += "<div class='alert alert-secondary'>";
		               str += "<p>" + writer + " : " + message + "</p>";
		               str += "</div></div>";
		               $("#msgArea").append(str);
		           }
		           else {
		        	   console.log("상대채팅")
		        	   str = "<div class='col-6'>";
		               str += "<div class='alert alert-warning'>";
		               str += "<p>" + writer + " : " + message + "</p>";
		               str += "</div></div>";
		               $("#msgArea").append(str);
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
<body>
	<div class="container">
	    <div class="col-6">
	        <h2>${room.name}</h2>
	        <button id="chat_end">나가기</button>
	    </div>
	    <div>
	        <div id="msgArea" class="col"></div>
	        <div class="col-6">
	            <div class="input-group mb-3">
	                <input type="text" id="msg" class="form-control">
	                <div class="input-group-append">
	                    <button class="btn btn-outline-secondary" type="button" id="button_send">전송</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="col-6"></div>
	</div>
</body>
</html>