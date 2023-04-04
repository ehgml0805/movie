<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="col-md-4 col-lg-3 p-b-80">
	<div class="side-menu">
		

		<div class="p-t-13">
			<h4 class="mtext-112 cl2 p-b-13">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Menu
			</h4>

			<ul>
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/employee/movie/movieList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						영화관리
					</a>
				</li>
			
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/employee/screeningSchedule/screeningScheduleList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						상영스케줄관리
					</a>
				</li>
				
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/employee/theater/theaterList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						극장관리
					</a>
				</li>
				
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/employee/coupon/couponList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						쿠폰관리
					</a>
				</li>

				<li class="bor18">
					<a href="${pageContext.request.contextPath}/event/eventList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						이벤트관리
					</a>
				</li>

				<li class="bor18">
					<a href="${pageContext.request.contextPath}/employee/notice/noticeList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						공지사항관리
					</a>
				</li>
				
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/employee/question/questionList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						문의사항관리
					</a>
				</li>
				
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/faq/faqList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						FAQ관리
					</a>
				</li>
				
			</ul>
		</div>
	</div>
</div>
</body>