<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2>Event Winners</h2>
				<span class="modal-close">&times;</span>
			</div>
			<div class="modal-body">
				<table class="modal-table">
					<tr>
						<th>당첨된이벤트</th>
						<th>아이디</th>
						<th>이름</th>
						<th>댓글내용</th>
						<th>이메일</th>
					</tr>
					<c:forEach var="ew" items="${list}">
						<tr>
							<td>${ew.eventTitle}</td>
							<td>${ew.customerId}</td>
							<td>${ew.customerName}</td>
							<td>${ew.eventCommentContent}</td>
							<td>${ew.customerEmail}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>			
</body>
</html>