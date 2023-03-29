<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<<<<<<< HEAD

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
=======
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticketingList.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
>>>>>>> branch 'main' of https://github.com/ehgml0805/movie.git
<div id="header">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-top p-0" id="navbar-top">
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a href="#" class="nav-link">VIP LOUNGE</a></li>
					<li class="nav-item"><a href="#" class="nav-link">멤버십</a></li>
				</ul>
				<ul class="navbar-nav">
					<c:if test="${empty loginCustomer}">
						<li class="nav-item"><a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form">로그인</a></li>
						<li class="nav-item"><a href="modal-addCustomer-Form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-addCustomer-form">회원가입</a></li>
					</c:if>
					<c:if test="${not empty loginCustomer}">
						<li class="nav-item"><a href="${pageContext.request.contextPath}/login/logout" class="nav-link">로그아웃</a></li>
					</c:if>
					<c:if test="${not empty loginEmployee}">
						<li class="nav-item"><a href="${pageContext.request.contextPath}/login/logout" class="nav-link">관리자로그아웃</a></li>
					</c:if>
					<li class="nav-item"><a href="" class="nav-link">빠른예매</a></li>
				</ul>
			</div>
		</nav>
	
		<nav class="navbar navbar-expand-lg navbar-light" id="navbar-2">
			<div class="collapse navbar-collapse justify-content-start">
				<ul class="navbar-nav util-list">
					<li class="nav-item">
					<a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/img/icons8-menu-32.png"></a>
					</li>
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <img src="${pageContext.request.contextPath}/img/icons8-search-32.png">
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="">
							<div class="search-box p-3">
								<form action="">
		     		 				<input class="form-control" type="search" name="keyword" value="" placeholder="영화를 검색하세요!" aria-label="Search">
		      						<button class="btn btn-sm" type="button"><img src="#"></button>
		    					</form>
							</div>
						</ul>
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-center" id="navbarNav" style="margin-bottom: 50px;">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/movie/movieList">영화</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/ticket/ticketing">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/theater/theaterList">극장</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/home" style="font-family: 'Alfa Slab One'; font-weight: 400;">CINEMA</a></li>
					<li class="nav-item"><a class="nav-link" id="event-link" href="${pageContext.request.contextPath}/event/eventList">이벤트</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/snack/snackHome">스토어</a></li>
					<li class="nav-item">
				</ul>
			</div>
			<c:if test="${not empty loginCustomer}">
				<div class="collapse navbar-collapse justify-content-end">
					<ul class="navbar-nav util-list">
						<li class="nav-item"><a class="nav-link" href="#"><img src="${pageContext.request.contextPath}/img/icons8-two-tickets-32.png"></a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customer/mypage"><img src="${pageContext.request.contextPath}/img/icons8-customer-32.png"></a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customer/order/cartList"><img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png"></a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${empty loginCustomer}">
				<div class="collapse navbar-collapse justify-content-end">
					<ul class="navbar-nav util-list">
						<li class="nav-item"><a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form"><img src="${pageContext.request.contextPath}/img/icons8-two-tickets-32.png"></a></li>
						<li class="nav-item"><a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form"><img src="${pageContext.request.contextPath}/img/icons8-customer-32.png"></a></li>
						<li class="nav-item"><a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form"><img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png"></a></li>
					</ul>
				</div>
			</c:if>
		</nav>
	</div>
</div>
<!-- 로그인 모달 -->
<c:if test="${empty loginCustomer }">
	<%@include file="loginFormModal.jsp"%>
	<%@include file="addCustomerModal.jsp"%>
</c:if>