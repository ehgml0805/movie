<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/employee/seat/addSeat" method="post">
			<input type="hidden" value="${param.screenroomKey}" name="screenroomKey">
			좌석 행 : <input type="number" name="x">
			좌석 열 : <input type="number"name="y">
			<button type="submit">만들기</button>		
		</form>
	</body>
</html>