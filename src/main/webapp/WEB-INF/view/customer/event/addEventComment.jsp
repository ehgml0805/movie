<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/event/addEventComment">
		<input type="hidden" name="eventKey" value="${eventKey}">
		<input type="hidden" name="customerId" value="${customerId}">
		<input type="hidden" name="movieKey" value="${movieKey}">
		<div>
			시간 선택:
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