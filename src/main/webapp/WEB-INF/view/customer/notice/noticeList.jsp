<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="animsition">
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/home" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				noticeList
			</span>
		</div>
	</div>
	
	<!-- Content page -->
	<section class="bg0 p-t-30 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 고객 고객센터 메뉴 -->
				<c:import url="/WEB-INF/inc/customerMenu.jsp"></c:import>
				
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg text-center">
						<!-- Main start -->
						<h2>공지사항</h2><br><br>

						<table class="table">
							<tr style="border-bottom-width:2px; border-top-width:2px;">
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
							</tr>
							<c:forEach var="l" items="${list}">
								<tr>
									<td>${l.num}</td>
									<td>
										<a href="${pageContext.request.contextPath}/notice/noticeOne?noticeKey=${l.noticeKey}">${l.noticeTitle}</a>
									</td>
									<td>${l.createdate}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 페이징 -->
						<div>
							<!-- 처음으로 -->
							<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=1">처음</a>
							<!-- 1페이지에서 이전버튼 -->
							<c:if test="${currentPage <= 1}">
								<span>이전</span>
							</c:if>
							<!-- 이전페이지 -->
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage-1}">이전</a>
							</c:if>
							<span>${currentPage} / ${lastPage}</span>
							<!-- 다음페이지 -->
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage+1}">다음</a>
							</c:if>
							<!-- 마지막페이지에서 다음버튼 -->
							<c:if test="${currentPage >= lastPage}">
								<span>다음</span>
							</c:if>
							<!-- 마지막으로 -->
							<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${lastPage}">마지막</a>
						</div>
						<!-- Main End -->
					</div>
				</div>
			</div>
		</div>
	</section>	

</body>
</html>