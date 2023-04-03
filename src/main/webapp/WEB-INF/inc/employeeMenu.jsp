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
		<div class="bor17 of-hidden pos-relative">
			<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

			<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
				<i class="zmdi zmdi-search"></i>
			</button>
		</div>

		<div class="p-t-13">
			<h4 class="mtext-112 cl2 p-b-13">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Menu
			</h4>

			<ul>
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