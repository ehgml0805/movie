<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
	    function loadAddEventComment() {
	        $.ajax({
	            url: "${pageContext.request.contextPath}/event/addEventComment",
	            method: "GET",
	            data: {
	                "eventKey": eventKey,
	                "customerId": customerId,
	                "movieKey": movieKey
	            },
	            success: function(data) {
	                $("#addComment").html(data);
	            },
	            error: function() {
	                alert("Error loading Add Event Comment form");
	            }
	        });
	    }
	
	    function loadEventCommentList() {
	        if (isLoading || noMoreComments) return;
	        isLoading = true;
	        $.ajax({
	            url: "${pageContext.request.contextPath}/event/eventCommentList",
	            method: "GET",
	            data: {
	                "currentPage": currentPage,
	                "rowPerPage": rowPerPage,
	                "eventKey": eventKey,
	                "movieKey": movieKey
	            },
	            success: function(data) {
	                $("#eventCommentList").append(data);
	                currentPage++;
	                isLoading = false;
	                if ($(data).find(".comment").length < rowPerPage || data.trim() === "") {
	                    noMoreComments = true;
	                }
	            },
	            error: function() {
	                alert("Failed to load comments");
	                isLoading = false;
	            }
	        });
	    }
	
	    $(window).scroll(function() {
	        if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
	            loadEventCommentList();
	        }
	    });
	
	    // Load the Add Event Comment form and the initial Event Comment List
	    loadAddEventComment();
	    loadEventCommentList();
	});
</script>
</head>
<body>
	<c:forEach var="e" items="${eventOneList}" begin="0" end="0">
		<h1>${e.eventTitle}</h1>
		<div>
			이벤트 기간 ${e.eventStartDate} ~ ${e.eventEndDate}
		</div>
	</c:forEach>
	<h3>댓글 (${eventCommentCount})</h3>
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
					<td>${ec.eventCommentContent}</td>
					<td>${ec.createdate}</td>
					<td><a href="${pageContext.request.contextPath}/customer/event/modifyEventComment?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/customer/event/removeEventComment?customerId=${ec.customerId}&eventKey=${ec.eventKey}&eventCommentKey=${ec.eventCommentKey}&movieKey=${movieKey}">삭제</a></td>
					<td>신고하기</td>
				</tr>
			</c:if>	
		</c:forEach>
	</table>
</body>
</html>