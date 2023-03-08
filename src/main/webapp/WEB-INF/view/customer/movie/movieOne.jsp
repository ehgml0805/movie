<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 상세정보</title>
</head>
<body>
	<c:forEach var="m" items="${movie}">
		<c:if test="${m.poster eq 'Y'}">
			<c:choose>
				<c:when test="${m.movieCode ne '0'}">
					<div><img alt="영화이미지" src="${m.originName}" width="300px" height="500px"></div>			
				</c:when>
				<c:otherwise>
					<div><img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.originName}" width="300px" height="500px"></div>			
				</c:otherwise>
			</c:choose>
			<div>${m.movieTitle}</div>
			<div>영화 정보 : ${m.movieInfo}</div>
			<div>영화 줄거리 : ${m.movieSummary}</div>
			<div>등급 : ${m.grade}</div>
			<div>예매율 : ${m.reservationRate}</div>
			<div>개봉일 : ${m.openingdate}</div>
			<div>활성화 여부 : ${m.active}</div>
			<div>포스터 : ${m.poster}</div>
			<div>스틸컷 : </div>
		</c:if>
		<c:if test="${m.poster eq 'N'}">
			<c:choose>
				<c:when test="${m.movieCode ne '0'}">
					<div><img alt="영화이미지" src="${m.originName}" width="300px" height="500px"></div>			
				</c:when>
				<c:otherwise>
					<div><img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.originName}" width="300px" height="500px"></div>			
				</c:otherwise>
			</c:choose>		
		</c:if>			
	</c:forEach>
</body>
</html>