<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이벤트 당첨자 리스트</h2>
	<table border="1">
		<tr>
			<th>당첨된이벤트</th>
			<th>아이디</th>
			<th>이름</th>
			<th>댓글내용</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="ew" items="${list}">
			<tr>
				<td>${ew.eventTitle}</td>
				<td>${ew.customerId}</td>
				<td>${ew.customerName}</td>
				<td>${ew.eventCommentContent}</td>
				<td>${ew.customerPhone}</td>
				<td>${ew.customerEmail}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>