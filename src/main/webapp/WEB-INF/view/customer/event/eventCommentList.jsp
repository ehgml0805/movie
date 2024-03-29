<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.eventComment {
		width: 79%;
		margin-left: 150px;
	}
</style>
</head>
<body>
	<c:forEach var="e" items="${eventOneList}" begin="0" end="0">
		<h1>${e.eventTitle}</h1>
		<div>
			이벤트 기간 ${e.eventStartDate} ~ ${e.eventEndDate}
		</div>
	</c:forEach>
	<div class="eventComment">
		<table class="table">
			<c:forEach var="ec" items="${EventCommentList}">
				<c:if test="${ec.eventKey == eventKey}">
					<tr>
						<td><img src="${pageContext.request.contextPath}/customer-upload/${ec.fileName}" width="50" height="50"></td>
						<td class="comment">${ec.customerName}</td>
						<c:if test="${ec.insultReport<5 }">
							<td>${ec.eventCommentContent}</td>
						</c:if>
						<td><fmt:formatDate value="${ec.createdate}" pattern="yyyy-MM-dd HH:mm"/></td>
						<c:if test="${loginCustomerId == ec.customerId}">
							<td><a href="${pageContext.request.contextPath}/customer/event/modifyEventComment?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}&eventCommentContent=${ec.eventCommentContent}">수정</a></td>
							<td><a href="${pageContext.request.contextPath}/customer/event/removeEventComment?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">삭제</a></td>
						</c:if>
						<c:if test="${empty loginCustomerId || loginCustomerId != ec.customerId}">
							<td>
								<a href="${pageContext.request.contextPath}/customer/event/insultReport?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">욕설/비방 신고</a>
								<a href="${pageContext.request.contextPath}/customer/event/spoilerReport?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">스포일러 신고</a>
							</td>
						</c:if>
					</tr>
				</c:if>	
			</c:forEach>
		</table>
	</div>	
</body>
</html>