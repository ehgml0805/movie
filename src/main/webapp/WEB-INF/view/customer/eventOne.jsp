<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${eventOne.eventTitle}</h1>
	<div>
		이벤트 기간 ${eventOne.eventStartDate} ~ ${eventOne.eventEndDate}
	</div>
	<div>
		<img src="${pageContext.request.contextPath}/event-upload/${eventOne.fileName}" width="500" height="500">
	</div>
	<!-- 이벤트 댓글 창 -->
	
</body>
</html>