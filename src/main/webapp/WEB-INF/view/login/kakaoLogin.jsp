<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 아작스 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

<!-- STYLE CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>

</head>
<body>

	<div class="wrapper bg" >

		<div class="inner">
			<div class="image-holder">
				<img id="poster"
					src="https://upload.wikimedia.org/wikipedia/ko/f/f2/%EC%96%B4%EB%B2%A4%EC%A0%B8%EC%8A%A4-_%EC%97%94%EB%93%9C%EA%B2%8C%EC%9E%84_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"
					alt="">
			</div>
			<form action="login.do" id="loginForm" method="post">
				<p class="register-title">
					<img src="${pageContext.request.contextPath}/img/megabox_log.jpg" style="width: 100%;">
					
				</p>
				<div class="form-wrapper form-wrapper-id">
					<div class="id-wrapper">
						<input id="id" name="id" type="text" placeholder="아이디"
							class="form-control"> <i class="zmdi zmdi-accounts"></i>
					</div>
				</div>

				<div class="form-wrapper">
					<input type="password" name="password" placeholder="비밀번호"
						id="password" class="form-control"> <i
						class="zmdi zmdi-lock"></i>
				</div>

				


				<button type="button" class="loginButton">
					<span>로그인 하기</span> <i class="zmdi zmdi-arrow-right"></i>
				</button>
			
				<div>
					<a id="kakao-login-btn" style="height:70px"></a>
				</div>
				

			</form>

		</div>
	</div>
	
	
	
	<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?
		client_id=48bab5ec387afd726d2df3b3793b0851
		&redirect_uri=https://localhost/movie/login/callback
		&response_type=code">
		<img src="${pageContext.request.contextPath}/img/kakao_login.png" style="height:60px">
	</a>
	
	<!-- 회원정보 -->
	<div class="inner">
		<div id="result"></div>
	</div>
	
	
	
	


</body>



</html>