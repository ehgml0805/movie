<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
	  	<meta charset="utf-8">
   <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	
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
					<a class="nav-link" href="#"><img src="#"></a>
					</li>
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> <img
							src="#">
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
					<li class="nav-item">
				    <div class="nav-item-container">
				        <a class="nav-link" id="event-link" href="#">이벤트</a>
				        <div id="event-tooltip" data-url="${pageContext.request.contextPath}/event/eventList">진행중인 이벤트</div>
		    	        <div id="end-event-tooltip" data-url="${pageContext.request.contextPath}/event/endEventList">종료된 이벤트</div>
				    </div>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/snack/snackHome">스토어</a></li>
					<li class="nav-item">
					<div class="nav-item-container2">
						<a href="#" class="nav-link" id="customer-center-link">고객센터</a>
				      	<div id="notice-tooltip" data-url="${pageContext.request.contextPath}/customer/notice/noticeList">공지사항</div>
		    	        <div id="faq-tooltip" data-url="${pageContext.request.contextPath}/faq/faqList">FAQ</div>
		    	        <div id="question-tooltip" data-url="${pageContext.request.contextPath}/customer/question/questionList">1:1문의</div>
					</div>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-end">
				<ul class="navbar-nav util-list">
					<li class="nav-item"><a class="nav-link" href="#"><img src="#"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><img src="#"></a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customer/order/cartList"><img src="#"></a></li>
				</ul>
			</div>
		</nav>
	</div>
</div>
<!-- 로그인 모달 -->
<c:if test="${empty lgoinCustomer }">
	<%@include file="loginFormModal.jsp"%>
</c:if>

<script>
	const eventLink = document.getElementById("event-link");
	const eventTooltip = document.getElementById("event-tooltip");
	const navItemContainer = eventLink.closest(".nav-item-container");
	const endEventTooltip = document.getElementById("end-event-tooltip");

	const customerCenterLink = document.getElementById("customer-center-link");
	const noticeTooltip = document.getElementById("notice-tooltip");
	const faqTooltip = document.getElementById("faq-tooltip");
	const questionTooltip = document.getElementById("question-tooltip");
	const navItemContainer2 = customerCenterLink.closest(".nav-item-container2");
	
	// event
	navItemContainer.addEventListener("mouseenter", () => {
  		eventTooltip.style.display = "block";
  		endEventTooltip.style.display = "block";

	});

	navItemContainer.addEventListener("mouseleave", () => {
  		eventTooltip.style.display = "none";
  		endEventTooltip.style.display = "none";
	});

	eventTooltip.addEventListener("click", () => {
  		const url = eventTooltip.getAttribute("data-url");
  		window.location.href = url;
	});
	
	endEventTooltip.addEventListener("click", () => {
  		const url = endEventTooltip.getAttribute("data-url");
  		window.location.href = url;
	});
	
	// 고객센터
	navItemContainer2.addEventListener("mouseenter", () => {
		noticeTooltip.style.display = "block";
		faqTooltip.style.display = "block";
		questionTooltip.style.display = "block";
	});
	
	navItemContainer2.addEventListener("mouseleave", () => {
		noticeTooltip.style.display = "none";
		faqTooltip.style.display = "none";
		questionTooltip.style.display = "none";
	});
	
	noticeTooltip.addEventListener("click", () => {
  		const url = noticeTooltip.getAttribute("data-url");
  		window.location.href = url;
	});
	
	faqTooltip.addEventListener("click", () => {
  		const url = faqTooltip.getAttribute("data-url");
  		window.location.href = url;
	});
	
	questionTooltip.addEventListener("click", () => {
  		const url = questionTooltip.getAttribute("data-url");
  		window.location.href = url;
	});
</script>