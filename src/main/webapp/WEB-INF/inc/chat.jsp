<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
	#chat-circle {
	  position: fixed;
	  bottom: 50px;
	  right: 35px;
	  background: #6A5EBF;
	  width: 65px;
	  height: 65px;  
	  border-radius: 50%;
	  color: white;
	  padding: 20px;
	  cursor: pointer;
	  box-shadow: 0px 3px 16px 0px rgba(0, 0, 0, 0.6), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
	}
	#icon {
	font-size:25px;
	}
</style>
</head>
<body>
	<!-- 채팅 아이콘 버튼 -->
	<div id="chat-circle" class="btn btn-raised">
		<i id="icon" class="material-icons">message</i>
	</div>
	
<script>
	// 채팅 아이콘 클릭시 로그인 확인 후 채팅창 열기
	$("#chat-circle").click(function() {
		var loginCheck = '';
		$.ajax({
			type : "POST"
			, url : "${pageContext.request.contextPath}/loginCheck"
			, success : function(result) {
				console.log(result);
				loginCheck = result;
				// 로그인 안되어 있으면
				if (loginCheck == '') {
					swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요", "error"); 
				// customer 로그인시
				} else if(loginCheck == 'customer') {
					window.open("http://localhost/movie/chatting/rooms", "_blank", "width=510, height=750");
				// employee 로그인시
				} else if(loginCheck == 'employee') {
					window.open("http://localhost/movie/chatting/rooms", "_blank", "width=765, height=800");
				}
			}
		});
	});
</script>
</body>