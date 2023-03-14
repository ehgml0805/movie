<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이벤트 리스트</h1>
	<a href="${pageContext.request.contextPath}/employee/event/addEvent">이벤트 등록</a>
	<table border="1">
		<tr>
			<th>이벤트 제목</th>
			<th>이벤트 시작날짜</th>
			<th>이벤트 종료날짜</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>
					<div>
						<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="200" height="200">
					</div>
					<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}">${e.eventTitle}</a>
				</td>
				<td>${e.eventStartDate}</td>
				<td>${e.eventEndDate}</td>
			</tr>
		</c:forEach>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/event/eventList">
		<input type="text" name="searchWord" value="${param.searchWord}">
		<button type="submit">이벤트 검색</button>
	</form>
	<div>
		<a href="${pageContext.request.contextPath}/event/eventList?currentPage=1&searchWord=${searchWord}">처음으로</a>		
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${lastPage}&searchWord=${searchWord}">끝으로</a>	
	</div>	
</body>
</html>