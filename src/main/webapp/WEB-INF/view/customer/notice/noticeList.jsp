<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<div class="text-center mt-5"><h1>공지사항</h1></div>
	<div class="container mt-5 border">
		<div class="row">
			<div class="col-md-12 text-center">
			<table class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록일</th>
				</tr>
				<c:forEach var="l" items="${list}">
					<tr>
						<td>${l.num}</td>
						<td>
							<a href="${pageContext.request.contextPath}/customer/notice/noticeOne?noticeKey=${l.noticeKey}">${l.noticeTitle}</a>
						</td>
						<td>${l.createdate}</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 페이징 -->
			<div>
				<!-- 처음으로 -->
				<a href="${pageContext.request.contextPath}/customer/notice/noticeList?currentPage=1">처음</a>
				<!-- 1페이지에서 이전버튼 -->
				<c:if test="${currentPage <= 1}">
					<span>이전</span>
				</c:if>
				<!-- 이전페이지 -->
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/customer/notice/noticeList?currentPage=${currentPage-1}">이전</a>
				</c:if>
				<span>${currentPage} / ${lastPage}</span>
				<!-- 다음페이지 -->
				<c:if test="${currentPage < lastPage}">
					<a href="${pageContext.request.contextPath}/customer/notice/noticeList?currentPage=${currentPage+1}">다음</a>
				</c:if>
				<!-- 마지막페이지에서 다음버튼 -->
				<c:if test="${currentPage >= lastPage}">
					<span>다음</span>
				</c:if>
				<!-- 마지막으로 -->
				<a href="${pageContext.request.contextPath}/customer/notice/noticeList?currentPage=${lastPage}">마지막</a>
			</div>
		</div>
	</div>
	</div>
</body>
</html>