<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>문의 리스트</h2>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>문의제목</td>
			<td>답변여부</td>
			<td>문의날짜</td>
		</tr>
		<c:forEach var="l" items="${list}">
			<tr>
				<td>${l.num}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/question/questionOne?questionKey=${l.questionKey}">${l.questionTitle}</a>
				</td>
				<!-- 답변없으면 -->
				<c:if test="${l.questionAnswer eq null}">
					<td>미완료</td>
				</c:if>
				<!-- 답변있으면 -->
				<c:if test="${l.questionAnswer ne null}">
					<td>답변완료</td>
				</c:if>
				<td>${l.createdate}</td>
			</tr>
		</c:forEach>
	</table>
		<!-- 페이징 -->
	<div>
		<!-- 처음으로 -->
		<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=1">처음</a>
		<!-- 1페이지에서 이전버튼 -->
		<c:if test="${currentPage <= 1}">
			<span>이전</span>
		</c:if>
		<!-- 이전페이지 -->
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<span>${currentPage} / ${lastPage}</span>
		<!-- 다음페이지 -->
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<!-- 마지막페이지에서 다음버튼 -->
		<c:if test="${currentPage >= lastPage}">
			<span>다음</span>
		</c:if>
		<!-- 마지막으로 -->
		<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=${lastPage}">마지막</a>
	</div>
</body>
</html>