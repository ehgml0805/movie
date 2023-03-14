<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h1>상영관등록 -> 극장 상세 모달창</h1>
		<form action="${pageContext.request.contextPath}/employee/screenroom/addScreenroom" method="post">
			<input type="hidden" name="theaterKey" value="${theaterKey}">
			<table border="1">
				<tr>
					<th>상영관명</th>
					<td><input type="text" name="screenroomName"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>