<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<h3>댓글 (${lastPage})</h3>
	<table border="1">
		<tr>
			<th>&nbsp;</th>
			<th>아이디</th>
			<th>내용</th>
			<th>등록일</th>
			<th>수정</th>
			<th>삭제</th>
			<th>신고</th>
		</tr>
		<c:forEach var="ec" items="${EventCommentList}">
				<c:if test="${ec.eventKey == eventKey}">
				<tr>
					<td><img src="${pageContext.request.contextPath}/customer-upload/${ec.fileName}" width="50" height="50"></td>
					<td>${ec.customerId}</td>
					<td>${ec.eventCommentContent }</td>
					<td>${ec.createdate}</td>
					<td><a href="">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/customer/event/removeEventComment?eventCommentKey=${ec.eventCommentKey}&eventKey${ec.eventKey}">삭제</a></td>
					<td>신고하기</td>
				</tr>
			</c:if>	
		</c:forEach>
	</table>
</body>
</html>