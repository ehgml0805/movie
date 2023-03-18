<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>theaterList</title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	</head>
	<body>
		<h1>극장 리스트</h1>
		<table border="1">
			<thead>
				<tr>
					<th>극장코드</th>
					<th>극장지역</th>
					<th>극장명</th>
					<th>극장주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="t" items="${theaterList}">
					<tr>
						<td>${t.theaterKey}</td>
						<td>${t.theaterRegion}</td>
						<td><a href="${pageContext.request.contextPath}/theater/theaterOne?theaterKey=${t.theaterKey}">${t.theaterName}</a></td>
						<td>${t.theaterAddress}</td>
					</tr>
				</c:forEach>
			</tbody>		
			</table>
	</body>
</html>