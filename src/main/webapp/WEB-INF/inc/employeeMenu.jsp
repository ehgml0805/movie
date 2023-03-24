<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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