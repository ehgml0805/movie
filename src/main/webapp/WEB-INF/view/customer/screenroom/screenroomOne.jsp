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
		<h1>상영관상세</h1>
		<table border="1">
			<thead>
				<tr>
					<th>상영관코드</th>
					<th>상영관명</th>
					<th>좌석수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${screenroomOne.screenroomKey}</td>
					<td>${screenroomOne.screenroomName}</td>
					<td>${screenroomOne.seatCount}</td>
				</tr>
			</tbody>		
		</table>
		<div>좌석 배치도</div>
		좌석배치표
	</body>
</html>