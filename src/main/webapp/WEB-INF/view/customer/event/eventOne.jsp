<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="e" items="${eventOnelist}" begin="0" end="0">
		<h1>${e.eventTitle}</h1>
		<div>
			이벤트 기간 ${e.eventStartDate} ~ ${e.eventEndDate}
		</div>
	</c:forEach>
	<c:forEach var="e" items="${eventOnelist}">
		<div>
			<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="500" height="500">
		</div>
	</c:forEach>
	<!-- 이벤트 댓글 창 -->
	<h3>댓글 (${count})</h3>
</body>
</html>