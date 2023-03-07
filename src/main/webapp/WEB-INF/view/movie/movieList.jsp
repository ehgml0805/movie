<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<c:forEach var="m" items="${movieList}">
			<div>${m.movieKey}</div>
			<div>${m.movieTitle}</div>
			<div>${m.movieInfo}</div>
			<div>${m.movieSummary}</div>
			<div>${m.grade}</div>
			<div>${m.reservationRate}</div>
			<div>${m.openingdate}</div>
			<div>${m.active}</div>
			<div>${m.poster}</div>
			<div><img alt="영화이미지" src="${m.fileName}" width="300px" height="500px"></div>
		</c:forEach>
	</body>
</html>