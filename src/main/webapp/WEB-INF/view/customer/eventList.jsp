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
			<th>No</th>
			<th>이벤트 제목</th>
			<th>이벤트 시작날짜</th>
			<th>이벤트 종료날짜</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.eventKey}</td>
				<td>
					<div>
						<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="200" height="200">
					</div>
					<a href="${pageContext.request.contextPath}">${e.eventTitle}</a>
				</td>
				<td>${e.eventStartDate}</td>
				<td>${e.eventEndDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>