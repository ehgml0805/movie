<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>empRooms</title>
</head>
<body>
	<div class="container">
	<c:if test="${empty list}">채팅요청 없음.</c:if>
	    <div>
	        <ul>
	         <c:forEach var="l" items="${list}">
	            <li><a href="${pageContext.request.contextPath}/chatting/room?roomId=${l.roomId}">${l.name}</a></li>
	         </c:forEach>
	        </ul>
	    </div>
	</div>
</body>
</html>