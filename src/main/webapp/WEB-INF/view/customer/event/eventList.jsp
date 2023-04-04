<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../img/favicon-32x32.png"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../resources2/css/util.css">
<link rel="stylesheet" type="text/css" href="../resources2/css/main.css">
<!--===============================================================================================-->
<style>
    .events-container {
        display: flex;
        flex-wrap: wrap;
        margin-top: 50px;
    }

    .event-item {
        width: 19%;
        box-sizing: border-box;
        margin-bottom: 20px;
        margin-left: 5%;
        border-radius: 10px;
  		overflow: hidden;
	  	border: 1px solid #ccc;
	  	padding: 10px;
    }
  
	.event-item img {
	  width: 100%;
	  object-fit: cover;
	}

   	.pagination {
	  	display: flex;
	  	justify-content: center;
	}
	
	.pagination {
		margin-top: 30px;
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
	
	.search {
		margin-top: 20px;
		margin-right: 50px;
		text-align: right;
	}
	
	.search input[name="searchWord"],
	.search button[type="submit"] {
  		border: 1px solid #ccc;
	  	border-radius: 5px;
	  	padding: 5px 10px;
	  	margin: 0 5px; 
	  	display: inline-block; 
	  	vertical-align: middle; 
	}
	a.title {
  		color: black;
  		text-decoration: none;
  		font-weight: 550;
	}

	a.title:hover {
  		color: black;
  		text-decoration: underline;
	}
	.separator {
		border: 1px solid #CCC;
		width: 100%;
	}	
	
</style>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<div class="container">	
		<c:if test="${not empty loginEmployee}">	
			<a href="${pageContext.request.contextPath}/employee/event/addEvent">이벤트 등록</a>
		</c:if>
		<h3 style="margin-top: 3%;">진행중인 이벤트</h3>
		<div class="search">
			<form method="get" action="${pageContext.request.contextPath}/event/eventList">
				<input type="text" name="searchWord" value="${param.searchWord}">
				<button type="submit">이벤트 검색</button>
			</form>
		</div>	
		<hr class="separator">
		<div class="events-container">
			<c:forEach var="e" items="${list}">
				<div class="event-item">
					<div>
						<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}&movieKey=${e.movieKey}">
							<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" height="310">
						</a>
					</div>
					<div class="text-center">
						<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}&movieKey=${e.movieKey}" class="title">${e.eventTitle}</a>
					</div>
					<div class="text-center">
						<span style="font-size:12px;">${e.eventStartDate} ~ ${e.eventEndDate}</span>
					</div>
				</div>	
			</c:forEach>
		</div>
	</div>		
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
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>
</body>
</html>