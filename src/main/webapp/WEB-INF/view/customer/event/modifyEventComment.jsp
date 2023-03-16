<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>댓글 수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/customer/event/modifyEventComment">
		<input type="hidden" name="movieKey" value="${movieKey}">
		<input type="hidden" name="eventCommentKey" value="${eventCommentKey}">
		<input type="hidden" name="eventKey" value="${eventKey}">
		<div>
			아이디: <input type="text" name="customerId" value="${customerId}" readonly="readonly">
		</div>
		<div>
			<textarea rows="5" cols="50" name="eventCommentContent"></textarea>
		</div>
		<button type="submit">수정</button>
	</form>
</body>
</html>