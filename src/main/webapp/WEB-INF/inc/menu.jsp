<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources2/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources2/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources2/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources2/css/main.css">
<!--===============================================================================================-->
</head>

<style>
	#event-link:hover {
		cursor: default;
	}
	
	#event-tooltip {
  		position: absolute;
	  	left: 42%;
	  	cursor: pointer;
	  	display: none;
	  	padding-right: 15px;
	}
	#end-event-tooltip {
 		position: absolute;
  		left: 52%;
  		cursor: pointer;
  		display: none;
	}
	
	#customer-center-link:hover {
		cursor: default;
	}
	
	#notice-tooltip {
  		position: absolute;
	  	left: 55%;
	  	cursor: pointer;
	  	display: none;
  	  	z-index: 1;
  	  	padding-right: 15px;
	}
	#faq-tooltip {
 		position: absolute;
  		left: 61%;
  		cursor: pointer;
  		display: none;
	  	z-index: 1;
	  	padding-right: 30px;
	}
	#question-tooltip {
 		position: absolute;
  		left: 64%;
  		cursor: pointer;
  		display: none;
	  	z-index: 1;
	  	padding-right: 10px;
	}
	
</style>
<header class="header-v2">
	<div class="wrap-menu-desktop how-shadow1" style="background-color: white">
		<nav class="limiter-menu-desktop container">
			
			
	
			<!-- Menu desktop -->
			<div class="menu-desktop">
				<ul class="main-menu">
					<li>
						<!-- <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a> -->
						
					</li>
	
					<li class="label1" data-label1="예매1위">
						<a href="${pageContext.request.contextPath}/movie/movieList" style="font-size:17px">영화</a>
					</li>
	
					
	
					<li>
						<a href="${pageContext.request.contextPath}/ticket/ticketing" style="font-size:17px">예매</a>
					</li>
	
					<li>
						<a href="${pageContext.request.contextPath}/theater/theaterList" style="font-size:17px">극장</a>
					</li>
	
					<li>
						<a href="${pageContext.request.contextPath}/home" style="font-size:22px">
							<!-- Logo desktop -->
							<img src="${pageContext.request.contextPath}/img/E1I6box.png" alt="IMG-LOGO" width="100" >
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/event/eventList" style="font-size:17px">이벤트</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath}/event/eventList">진행중인 이벤트</a></li>
							<li><a href="${pageContext.request.contextPath}/event/endEventList">종료된 이벤트</a></li>
							
						</ul>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/snack/snackHome" style="font-size:17px">스토어</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/faq/faqList" style="font-size:17px"	>고객센터</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath}/faq/faqList">자주묻는 질문</a></li>
							<li><a href="${pageContext.request.contextPath}/customer/question/questionList">Q&A</a></li>
							
						</ul>
					</li>
				</ul>
			</div>	
	
			<!-- icon header -->
			<!-- 로그인 상태 -->
			<c:if test="${not empty loginCustomer}">
				<div class="wrap-icon-header flex-w flex-r-m">
					<a href ="${pageContext.request.contextPath}/customer/mypage" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 ">
						<img src="${pageContext.request.contextPath}/img/icons8-customer-32.png">
					</a>
					<a href="${pageContext.request.contextPath}/customer/order/cartList" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22  ">
						<img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png">
					</a>
					<a href="${pageContext.request.contextPath}/customer/mypage" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 " >
						<img src="${pageContext.request.contextPath}/img/icons8-two-tickets-32.png">
					</a>	
					<a href="${pageContext.request.contextPath}/login/logout" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 " >
						<img src="${pageContext.request.contextPath}/img/icons8-logout-rounded-30.png">
					</a>
				</div>
			</c:if>
			
			<!-- 비 로그인 상태 -->
			<c:if test="${empty loginCustomer}">
				<div class="wrap-icon-header flex-w flex-r-m">
					<a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form">
						<img src="${pageContext.request.contextPath}/img/icons8-customer-32.png">
					</a>
					<a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form">
						<img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png">
					</a>
					<a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form">
						<img src="${pageContext.request.contextPath}/img/icons8-two-tickets-32.png">
					</a>
					
				</div>
			</c:if>
		</nav>
	</div>	
</header>

	



<!-- 로그인 모달 -->
<c:if test="${empty loginCustomer }">
	<%@include file="loginFormModal.jsp"%>
	<%@include file="addCustomerModal.jsp"%>
</c:if>