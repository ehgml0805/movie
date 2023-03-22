<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#more-btn {
  		display: block;
  		margin: 0 auto;
  		width: 75%;
  		height: 35px;
  		background-color: #fff;
  		color: #999;
  		font-size: 20px;
  		text-align: center;
  		border: 1px solid #d3d3d3;
  		border-radius: 10px;
 		box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
  		cursor: pointer;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	const eventKey = ${eventKey};
	const movieKey = ${movieKey};
	let customerId = '${customerId}';
	let currentPage = 1;
	let isLoading = false;
	let rowPerPage = 5;
	let noMoreComments = false;
	
	$(document).ready(function(){	
		function loadAddEventComment(){
			$.ajax({
				url: "${pageContext.request.contextPath}/event/addEventComment",
				method: "GET",
				data: {
					"eventKey": eventKey,
					"customerId": customerId,
					"movieKey": movieKey
				},	
				success: function(data){
					$("#addComment").html(data);
				},
				error: function(){
					alert(" 이벤트 댓글 작성 폼 불러오기 실패");
				}
			});
		}
		
		function loadEventCommentList(){
			if(isLoading || noMoreComments) return;
			console.log('noMoreComments:', noMoreComments);
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
				    isLoading = false;
				    if ($(data).find(".comment").length < rowPerPage && currentPage > Math.ceil(${eventCommentCount}/rowPerPage) || data.trim() === "") {
				        noMoreComments = true;
				        $('#more-btn').hide(); 
				    } else {
				        currentPage++; 
				    }
				},
				error: function(){
					isLoading = false;
				}
			});
		}
		
		loadEventCommentList();
		
		$('#more-btn').click(function() {
			rowPerPage = 5; 
			loadEventCommentList();
		});
		
		loadAddEventComment();
	});
</script>
</head>
<body>
	<div class="text-center">
		<c:forEach var="e" items="${eventOneList}" begin="0" end="0">
			<h1>${e.eventTitle}</h1>
			<div>
				이벤트 기간 ${e.eventStartDate} ~ ${e.eventEndDate}
			</div>
		</c:forEach>
		<c:forEach var="e" items="${eventOneList}">
			<div>
				<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="1000" height="500">
			</div>
		</c:forEach>
		<c:forEach var="e" items="${eventOneList}" begin="0" end="0">
			<div>
				${e.eventContent}
			</div>
		</c:forEach>
		<br>
		<!-- 이벤트 댓글 등록 폼 -->
		<div id="addComment"></div>
		<h4>댓글 (${eventCommentCount})</h4>
	</div>
	<!-- 이벤트 댓글 리스트 -->
	<div id="eventCommentList"></div>
	<button id="more-btn">더보기</button>
</body>
</html>