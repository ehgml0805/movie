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
			line-height: 1;
			margin: 0;
			padding: 0;
		}
		h1 {
			background-color: #444;
			color: #F5F5F5;
			padding: 20px;
			margin: 0;
		}
		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
		}
		input[type="hidden"] {
			display: none;
		}
		select {
			border: 1px solid #CCC;
			display: block;
			font-size: 16px;
			margin-bottom: 20px;
			padding: 1px;
			width: fit-content;
			height: 30px;
			box-sizing: border-box;
			
		} 
		textarea {
			border: 1px solid #CCC;
			display: block;
			font-size: 16px;
			margin-bottom: 20px;
			padding: 1px;
			width: 88%;
			box-sizing: border-box;
		}
		button[type="submit"] {
			background-color: #FFF;
			border: 1px solid #CCC;
			color: #1B0000;
			cursor: pointer;
			display: block;
			font-size: 16px;
		  	float: right;
		  	margin-right: -1px;
			margin-bottom: 60px;
			padding: 5px 15px;
		}
		button[type="submit"]:hover {
			background-color: #FFF;
		}
		.addEvent {
       		margin-left: 150px;
		}
		.selcet {
			margin-bottom: 10px;
		}
		.button-wrap {
			border: 1px solid #CCC;
			width: calc(88% - 2px);
			height: 39px;
			padding: 1px;
		}
	</style>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/event/addEventComment">
		<input type="hidden" name="eventKey" value="${eventKey}">
		<input type="hidden" name="customerId" value="${customerId}">
		<input type="hidden" name="movieKey" value="${movieKey}">
		<div class="addEvent">
			<div class="selcet">
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
				<textarea rows="4" cols="50" name="eventCommentContent"></textarea>
			</div>
		 	<div class="button-wrap">
				<button type="submit" name="eventCommentContent">등록</button>
			</div>
		</div>
	</form>
</body>
</html>