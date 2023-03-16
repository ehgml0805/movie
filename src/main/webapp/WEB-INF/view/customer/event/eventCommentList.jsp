<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<c:forEach var="e" items="${eventOneList}" begin="0" end="0">
		<h1>${e.eventTitle}</h1>
		<div>
			이벤트 기간 ${e.eventStartDate} ~ ${e.eventEndDate}
		</div>
	</c:forEach>
	<table border="1">
		<c:if test="${currentPage == 1}">
			<tr>
				<th>&nbsp;</th>
				<th>아이디</th>
				<th>내용</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
				<th>신고</th>
			</tr>
		</c:if>	
		<c:forEach var="ec" items="${EventCommentList}">
			<c:if test="${ec.eventKey == eventKey}">
				<tr>
					<td><img src="${pageContext.request.contextPath}/customer-upload/${ec.fileName}" width="50" height="50"></td>
					<td class="comment">${ec.customerId}</td>
					<c:if test="${ec.insultReport>=5 }">
						<td>${ec.eventCommentContent}</td>
					</c:if>
					<td>${ec.createdate}</td>
					<td><a href="${pageContext.request.contextPath}/customer/event/modifyEventComment?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/customer/event/removeEventComment?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">삭제</a></td>
					<td>
						<a href="${pageContext.request.contextPath}/customer/event/spoilerReport?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">욕설/비방 신고</a>
						<a href="${pageContext.request.contextPath}/customer/event/spoilerReport?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">스포일러 신고</a>
					</td>
				</tr>
			</c:if>	
		</c:forEach>
	</table>
</body>
</html>