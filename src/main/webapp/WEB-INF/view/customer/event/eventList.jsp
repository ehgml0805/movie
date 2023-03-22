<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .events-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .event-item {
        width: 24%;
        box-sizing: border-box;
        margin-bottom: 20px;
    }
  
   	.pagination {
	  	display: flex;
	  	justify-content: center;
	}
	
	.pagination {
		margin-top: 20px;
	}
	.pagination a {
		display: inline-block;
		margin: 0 5px;
		padding: 5px 10px;
		background-color: #f2f2f2;
		border: 1px solid #ddd;
		color: black;
		text-decoration: none;
	}
	.pagination a.active {
		background-color: dodgerblue;
		color: white;
	}
	.pagination a.disabled {
		color: #ddd;
		pointer-events: none;
	}
</style>
</head>
<body>
	<h1>진행중인 이벤트</h1>
	<a href="${pageContext.request.contextPath}/employee/event/addEvent">이벤트 등록</a>
	<div class="events-container">
		<c:forEach var="e" items="${list}">
			<div class="event-item">
				<div>
					<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="250" height="250">
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}&movieKey=${e.movieKey}">${e.eventTitle}</a>
				</div>
				<div>
					${e.eventStartDate} ~ ${e.eventEndDate}
				</div>
			</div>	
		</c:forEach>
	</div>	
	<form method="get" action="${pageContext.request.contextPath}/event/eventList">
		<input type="text" name="searchWord" value="${param.searchWord}">
		<button type="submit">이벤트 검색</button>
	</form>
	<div class="pagination">
		<a href="${pageContext.request.contextPath}/event/eventList?currentPage=1&searchWord=${searchWord}">처음으로</a>		
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/event/eventList?currentPage=${lastPage}&searchWord=${searchWord}">끝으로</a>	
	</div>	
</body>
</html>