<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
#center-text {          
  display: flex;
  flex: 1;
  flex-direction:column; 
  justify-content: center;
  align-items: center;  
  height:100%;
  
}
#chat-circle {
  position: fixed;
  bottom: 50px;
  right: 35px;
  background: #5A5EB0;
  width: 35px;
  height: 35px;  
  border-radius: 50%;
  color: white;
  padding: 20px;
  cursor: pointer;
  box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
#icon {
	font-size:35px;

}

.btn#my-btn {
     background: white;
    padding-top: 13px;
    padding-bottom: 12px;
    border-radius: 45px;
    padding-right: 40px;
    padding-left: 40px;
    color: #5865C3;
}
#chat-overlay {
    background: rgba(255,255,255,0.1);
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    display: none;
}


.chat-box {
  display:none;
  background: #efefef;
  position:fixed;
  right:30px;
  bottom:50px;  
  width:350px;
  max-width: 85vw;
  max-height:100vh;
  border-radius:5px;  
/*   box-shadow: 0px 5px 35px 9px #464a92; */
  box-shadow: 0px 5px 35px 9px #ccc;
}
.chat-box-toggle {
  float:right;
  margin-right:15px;
  cursor:pointer;
}
.chat-box-header {
  background: #5A5EB9;
  height:70px;
  border-top-left-radius:5px;
  border-top-right-radius:5px; 
  color:white;
  text-align:center;
  font-size:20px;
  padding-top:17px;
}
.chat-box-body {
  position: relative;  
  height:370px;  
  height:auto;
  border:1px solid #ccc;  
  overflow: hidden;
}
.chat-box-body:after {
  content: "";
  background: #ffffff;
  opacity: 0.1;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  height:100%;
  position: absolute;
  z-index: -1;   
}
#chat-input {
  background: #f4f7f9;
  width:100%; 
  position:relative;
  height:47px;  
  padding-top:10px;
  padding-right:50px;
  padding-bottom:10px;
  padding-left:15px;
  border:none;
  resize:none;
  outline:none;
  border:1px solid #ccc;
  color:#888;
  border-top:none;
  border-bottom-right-radius:5px;
  border-bottom-left-radius:5px;
  overflow:hidden;  
}
.chat-input > form {
    margin-bottom: 0;
}
#chat-input::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  color: #ccc;
}
#chat-input::-moz-placeholder { /* Firefox 19+ */
  color: #ccc;
}
#chat-input:-ms-input-placeholder { /* IE 10+ */
  color: #ccc;
}
#chat-input:-moz-placeholder { /* Firefox 18- */
  color: #ccc;
}
.chat-submit {  
  position:absolute;
  bottom:5px;
  right:10px;
  background: transparent;
  box-shadow:none;
  border:none;
  border-radius:50%;
  color:#5A5EB9;
  width:35px;
  height:35px;  
}
.chat-logs {
  padding:15px; 
  height:370px;
  overflow-y:scroll;
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
#chatArea .me .entete{
	text-align:right;
}

.chat-logs::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar
{
	width: 5px;  
	background-color: #F5F5F5;
}

.chat-logs::-webkit-scrollbar-thumb
{
	background-color: #5A5EB9;
}



@media only screen and (max-width: 500px) {
   .chat-logs {
        height:40vh;
    }
}

.cm-msg-text {
  background:white;
  padding:10px 15px 10px 15px;  
  color:#666;
  max-width:75%;
  float:left;
  margin-left:10px; 
  position:relative;
  margin-bottom:20px;
  border-radius:30px;
}
.chat-msg {
  clear:both;    
}
.chat-msg.me > .cm-msg-text {  
  float:right;
  margin-right:10px;
  background: #5A5EB9;
  color:white;
}
.cm-msg-button>ul>li {
  list-style:none;
  float:left;
  width:50%;
}
.cm-msg-button {
    clear: both;
    margin-bottom: 70px;
}
</style>
</head>
<body>
	<div id="center-text">
		<h2>Chat</h2>
		<p>Message send and scroll to bottom enabled </p>
	</div> 
	<div id="body"> 
		<!-- 채팅 아이콘 버튼 -->
		<div id="chat-circle" class="btn btn-raised">
			<i id="icon" class="material-icons">message</i>
		</div>
		 
		<div class="chat-box">
			<div class="chat-box-header">
				1:1 채팅문의
				<span class="chat-box-toggle" id="chat_end"><i class="material-icons">close</i></span>
			</div>
			<div class="chat-box-body">
				<div class="chat-box-overlay">   
				</div>
				<!--chat-log -->
				<div class="chat-logs" id="chatArea">
				     
				</div>
			</div>
			<div class="chat-input">      
				<form>
					<input type="text" id="chat-input" placeholder="Send a message..."/>
					<button type="submit" class="chat-submit" id="button_send"><i class="material-icons">send</i></button>
				</form>      
			</div>
		</div>
	</div>
	<!--   --------------------------------------     
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
		</div>-->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script>
		$(document).ready(function(){
		
			var roomName = "${room.name}"; // 채팅방을 만든 고객 아이디
		    var roomId = "${room.roomId}"; // UUID
		    var username = "${loginId}"; // 로그인한 아이디
			var INDEX = 0;
		    console.log(roomName + ", " + roomId + ", " + username + " : roomName, roomId, username");
		 	
		    // 오늘 날짜 시간 구하기
		    var now = new Date();
		    var hour = String(now.getHours()).padStart(2,"0");
		    var minutes = String(now.getMinutes()).padStart(2,"0");
		    var year = now.getFullYear();
		    var month = now.getMonth();
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
		
		           var writer = content.writer;
		           var message = content.message;
		           var str = '';
				   INDEX++;
		           if(writer === username) { // 로그인한 아이디와 같으면(내채팅)
		        	   console.log("내채팅")
		        	   str = "<div class='chat-msg me' id='cm-msg-"+INDEX+"'>";
		               str += "<div class='entete'>";
			           str += "<h2>" + writer + "</h2>&nbsp";
			           str += "<h3>" + hour + ":" + minutes + ", " + year + "-" + month + "-" + date + "</h3></div>";
			           str += "<div class='cm-msg-text'>" + message + "</div></div>";
		               $(".chat-logs").append(str);
		               $("#cm-msg-"+INDEX).hide().fadeIn(300);
		               $("#chat-input").val('');
		               $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
		           }
		           else {
		        	   console.log("상대채팅")
		        	   str = "<div class='chat-msg you' id='cm-msg-"+INDEX+"'>";
		               str += "<div class='entete'>";
			           str += "<h2>" + writer + "</h2>&nbsp";
			           str += "<h3>" + hour + ":" + minutes + ", " + year + "-" + month + "-" + date + "</h3></div>";
			           str += "<div class='cm-msg-text'>" + message + "</div></div>";
		               $(".chat-logs").append(str);
		               $("#cm-msg-"+INDEX).hide().fadeIn(300);
		               $("#chat-input").val('');
		               $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
		               $("#chat-input").attr("disabled", true);
		           }
		
		       });
		
		       //3. send(path, header, message)로 메세지를 보낼 수 있음
		       stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
		    });
			// 전송버튼 클릭시
		    $("#button_send").on("click", function(e){
		        var msg = $("#chat-input").val();
		        if(msg.trim() == ''){
		            return false;
		        }
		        console.log(username + ":" + msg.value);
		        stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
		        msg.value = '';
		    });
		    // 나가기버튼 클릭시
		    //$("#chat_end").on("click", function(){
		    //	var result = confirm("대화방을 나가시겠습니까?");
		    	
		    //	if(result == true) {
		    //		stomp.send('/pub/chat/end', {}, JSON.stringify({roomId: roomId, writer: username}))
		    //		$(location).attr("href", "rooms")
		    //	} 
		    //});
		    
		    //$(document).delegate(".chat-btn", "click", function() {
		    //    var value = $(this).attr("chat-value");
		     //   var name = $(this).html();
		    //    $("#chat-input").attr("disabled", false);
		    //    generate_message(name, 'self');
		    //});
		    
		    // 채팅창 열기
		    $("#chat-circle").click(function() {
		        $("#chat-circle").toggle('scale');
		        $(".chat-box").toggle('scale');
		    });
		    // 채팅창 닫기
		    $(".chat-box-toggle").click(function() {
		        $("#chat-circle").toggle('scale');
		        $(".chat-box").toggle('scale');
		    });
		    
		});
	</script>
</body>
</html>