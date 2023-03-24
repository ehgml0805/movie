<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	  	<meta charset="utf-8">
   <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
	  	<link rel="stylesheet" href="/resources/css/navbar.css" />
	  	<link rel="stylesheet" href="/resources/css/common.css" />
	  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
	  	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.png"/>
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/iconic/css/material-design-iconic-font.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/linearicons-v1.0.0/icon-font.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animate/animate.css">
		<!--===============================================================================================-->   
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
		<!--===============================================================================================-->   
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/MagnificPopup/magnific-popup.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/perfect-scrollbar/perfect-scrollbar.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/css/main.css">
		<!--===============================================================================================-->
<title>Insert title here</title>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<div>오늘 총 방문자 수: ${todayCount}</div>
	<!-- 영화 목록 -->
	
	<!-- 이벤트 -->
	<div class="container mt-4">
	    <h3>혜택/이벤트</h3>
	    <div class="row">
	        <!-- Medium card -->
	        <div class="col-md-6">
	            <div class="row">
	                <div class="card" style="width: 600px; height: 250px;">
	                    <a href="${pageContext.request.contextPath}/snack/snackHome">
	                 	   <img src="${pageContext.request.contextPath}/event-upload/스즈메패키지.jpg" style="width: 580px; height: 240px;">
	                    </a>
	                </div>
	            </div>
	            <div class="row mt-4">
	                <!-- Small card 1 -->
	                <div class="col-md-6">
	                    <div class="card" style="width: 19rem;">
	                    	<a href="${pageContext.request.contextPath}/snack/snackHome">
	                        	<img src="${pageContext.request.contextPath}/event-upload/슬램덩크FULL콤보.png" style="width: 19rem; height: 120px;">
	                        </a>
	                        <div class="card-body">
	                            <h5 class="card-title">슬램덩크 한정판 굿즈 + 팝콘 패키지 출시!</h5>
	                        </div>
	                    </div>
	                </div>
	                <!-- Small card 2 -->
	                <div class="col-md-6">
	                    <div class="card" style="width: 19rem;">
                   	 		<a href="${pageContext.request.contextPath}/customer/notice/noticeList">
	                        	<img src="${pageContext.request.contextPath}/event-upload/메박오리지널티켓.jpg" style="width: 18rem; height: 190px;">
	                    	</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Large card -->
	        <div class="col-md-6">
	            <div class="card" style="width: 395px; height: 500px;">
           	 		<a href="${pageContext.request.contextPath}/event/eventList">
	                	<img src="${pageContext.request.contextPath}/event-upload/스즈메 시사회.jpg" style="width: 392px; height: 480px;">
	            	</a>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 고객 센터 -->
	<div class="container mt-5">
	    <div class="row mt-3">
	        <div class="col-md-2">
	        	<a href="${pageContext.request.contextPath}/faq/faqList" style="text-decoration: none; color: inherit;">
           			<i class="bi bi-question-circle" style="font-size: 4rem;"></i>
	            	<div>자주 묻는 질문</div>
           		</a>	
	        </div>
	        <div class="col-md-2">
       	 		<a href="${pageContext.request.contextPath}/customer/question/questionList" style="text-decoration: none; color: inherit;">
		            <i class="bi bi-people-fill" style="font-size: 4rem;"></i>
		            <div>1:1 문의</div>
		        </a>    
	        </div>
	    </div>
	</div>
</body>
</html>