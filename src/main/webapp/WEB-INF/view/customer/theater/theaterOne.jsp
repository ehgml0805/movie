<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	</head>
	<body>
		<h1>극장상세</h1>
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
				<tr>
					<td>${theaterOne.theaterKey}</td>
					<td>${theaterOne.theaterRegion}</td>
					<td>${theaterOne.theaterName}</td>
					<td>${theaterOne.theaterAddress}</td>
				</tr>
			</tbody>		
		</table>
		<div>${theaterOne.theaterInfo}</div>
		<div>${theaterOne.theaterTicketingInfo}</div>
		<br/>
		<h1>상영관 목록</h1>
		<table border="1">
			<thead>
				<tr>
					<th>상영관코드</th>
					<th>상영관명</th>
					<th>좌석수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${screenroomList}">
					<tr>
						<td>${s.screenroomKey}</td>
						<td><a href="${pageContext.request.contextPath}/customer/screenroom/screenroomOne?screenroomKey=${s.screenroomKey}">${s.screenroomName}</a></td>
						<td>${s.seatCount}</td>
					</tr>
				</c:forEach>
			</tbody>		
		</table>
	</body>
</html>