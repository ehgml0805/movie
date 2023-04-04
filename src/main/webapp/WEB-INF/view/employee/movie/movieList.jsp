<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MEET PLAY SHARE, E1I6</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import>

	<a href="${pageContext.request.contextPath}/employee/movie/addMovie">영화 등록</a>
	<c:forEach var="m" items="${movieList}">
		<c:if test="${m.poster eq 'Y'}">
			<c:choose>
			<c:when test="${m.movieCode ne '0'}">
				<div>
					<a href="${pageContext.request.contextPath}/employee/movie/movieOne?movieKey=${m.movieKey}" >
						<img alt="영화이미지" src="${m.fileName}" width="300px" height="500px">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="${pageContext.request.contextPath}/employee/movie/movieOne?movieKey=${m.movieKey}" >
						<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" width="300px" height="500px">
					</a>
				</div>
			</c:otherwise>		
			</c:choose>				
			<div>
				<a href="${pageContext.request.contextPath}/employee/movie/movieOne?movieKey=${m.movieKey}" >
					${m.movieTitle}
				</a>
			</div>
			<div>영화 정보 : ${m.movieInfo}</div>
			<div>영화 줄거리 : ${m.movieSummary}</div>
			<div>등급 : ${m.grade}</div>
			<div>예매율 : ${m.reservationRate}</div>
			<div>개봉일 : ${m.openingdate}</div>
			<div>활성화 여부 : ${m.active}</div>
			<div>포스터 : ${m.poster}</div>
			<a href="${pageContext.request.contextPath}/employee/movie/modifyMovie?movieKey=${m.movieKey}">수정</a>
		</c:if>	
	</c:forEach>
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
</body>
</html>