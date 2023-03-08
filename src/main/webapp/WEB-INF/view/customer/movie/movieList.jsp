<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 목록</title>
</head>
<body>
	<c:forEach var="m" items="${movieList}">
		<c:if test="${m.poster eq 'Y'}">
			<c:choose>
			<c:when test="${m.movieCode ne '0'}">
				<div>
					<a href="${pageContext.request.contextPath}/customer/movie/movieOne?movieKey=${m.movieKey}" >
						<img alt="영화이미지" src="${m.originName}" width="300px" height="500px">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="${pageContext.request.contextPath}/customer/movie/movieOne?movieKey=${m.movieKey}" >
						<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.originName}" width="300px" height="500px">
					</a>
				</div>
			</c:otherwise>		
			</c:choose>				
			<div>
				<a href="${pageContext.request.contextPath}/customer/movie/movieOne?movieKey=${m.movieKey}" >
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
		</c:if>		
	</c:forEach>
</body>
</html>