<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<h2>문의 리스트</h2>
	<a href="${pageContext.request.contextPath}/customer/question/addQuestion">문의하기</a>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>문의제목</td>
			<td>답변여부</td>
			<td>문의날짜</td>
			<td>삭제</td>
		</tr>
		<c:forEach var="l" items="${list}">
			<tr>
				<td>${l.num}</td>
				<td>
					<a href="${pageContext.request.contextPath}/customer/question/questionOne?questionKey=${l.questionKey}">${l.questionTitle}</a>
				</td>
				<!-- 답변없으면 -->
				<c:if test="${l.questionAnswer eq null}">
					<td>확인중..</td>
				</c:if>
				<!-- 답변있으면 -->
				<c:if test="${l.questionAnswer ne null}">
					<td>답변완료</td>
				</c:if>
				<td>${l.createdate}</td>
				<!-- 답변없으면 -->
				<c:if test="${l.questionAnswer eq null}">
					<td><a href="${pageContext.request.contextPath}/customer/question/removeQuestion?questionKey=${l.questionKey}">삭제</a></td>
				</c:if>
				<!-- 답변있으면 -->
				<c:if test="${l.questionAnswer ne null}">
					<td>불가</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
		<!-- 페이징 -->
	<div>
		<!-- 처음으로 -->
		<a href="${pageContext.request.contextPath}/customer/question/questionList?currentPage=1">처음</a>
		<!-- 1페이지에서 이전버튼 -->
		<c:if test="${currentPage <= 1}">
			<span>이전</span>
		</c:if>
		<!-- 이전페이지 -->
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/customer/question/questionList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<span>${currentPage} / ${lastPage}</span>
		<!-- 다음페이지 -->
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/customer/question/questionList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<!-- 마지막페이지에서 다음버튼 -->
		<c:if test="${currentPage >= lastPage}">
			<span>다음</span>
		</c:if>
		<!-- 마지막으로 -->
		<a href="${pageContext.request.contextPath}/customer/question/questionList?currentPage=${lastPage}">마지막</a>
	</div>
</body>
</html>