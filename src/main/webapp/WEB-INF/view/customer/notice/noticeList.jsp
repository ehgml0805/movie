<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
</head>
<body>
	<h1>공지사항</h1>
	<table border="1">
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
</body>
</html>