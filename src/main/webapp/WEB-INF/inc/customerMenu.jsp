<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script></head>
</head>
<div class="col-md-4 col-lg-3 p-b-80">
	<div class="side-menu">
		<div class="bor17 of-hidden pos-relative">
			<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

			<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
				<i class="zmdi zmdi-search"></i>
			</button>
		</div>

		<div class="p-t-13">
			<h4 class="mtext-112 cl2 p-b-13 text-center">
				<strong>고객센터</strong>
			</h4>

			<ul>
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/faq/faqList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						자주 묻는 질문
					</a>
				</li>

				<li class="bor18">
					<a href="${pageContext.request.contextPath}/notice/noticeList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						공지사항
					</a>
				</li>

				<li class="bor18">
					<a href="${pageContext.request.contextPath}/customer/question/addQuestion" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						1:1문의
					</a>
				</li>
								
				<li class="bor18">
					<a href="${pageContext.request.contextPath}/customer/question/questionList" class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
						나의 문의내역
					</a>
				</li>
				<li>
					<div class="alert alert-secondary text-center">
    					<small>
    						<strong>E1I6BOX 고객센터</strong><br>
    						Dream cente
    						
    					</small>
    					<p><i class="far fa-clock"></i><small> 09:00~18:00</small></p>
  					</div>
				</li>
				
			</ul>
		</div>
	</div>
</div>