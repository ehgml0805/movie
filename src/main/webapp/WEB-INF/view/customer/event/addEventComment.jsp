<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 댓글 등록</title>
	<style>
		body {
			background-color: #F5F5F5;
			font-family: Arial, sans-serif;
			font-size: 16px;
			line-height: 1.5;
			margin: 0;
			padding: 0;
		}
		h1 {
			background-color: #444;
			color: #F5F5F5;
			padding: 20px;
			margin: 0;
		}
		form {
			background-color: #FFF;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0,0,0,0.3);
			margin: 20px auto;
			padding: 20px;
			max-width: 75%;
		}
		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}
		input[type="hidden"] {
			display: none;
		}
		select, textarea {
			border: 2px solid #CCC;
			border-radius: 5px;
			display: block;
			font-size: 16px;
			margin-bottom: 20px;
			padding: 1px;
			width: 100%;
			box-sizing: border-box;
		}
		button[type="submit"] {
			background-color: #444;
			border: none;
			border-radius: 5px;
			color: #FFF;
			cursor: pointer;
			display: block;
			font-size: 16px;
			margin: 20px auto 0;
			padding: 5px 15px;
		}
		button[type="submit"]:hover {
			background-color: #666;
		}
	</style>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/event/addEventComment">
		<input type="hidden" name="eventKey" value="${eventKey}">
		<input type="hidden" name="customerId" value="${customerId}">
		<input type="hidden" name="movieKey" value="${movieKey}">
		<div>
			<select name="scheduleKey">
				<option value="">시간 선택</option>
					<c:forEach var="es" items="${eventScheduleList}">
						<c:if test="${es.preview == 'Y'}">
							<option value="${es.scheduleKey}">상영시간:
								<fmt:formatDate value="${es.startDate}" pattern="yyyy-MM-dd HH:mm"/> ~
								<fmt:formatDate value="${es.endDate}" pattern="yyyy-MM-dd HH:mm"/>
							</option>
						</c:if>		
					</c:forEach>			
			</select>
		</div>
		<div>
			<textarea rows="5" cols="50" name="eventCommentContent"></textarea>
		</div>
		<button type="submit" name="eventCommentContent">등록</button>
	</form>
</body>
</html>