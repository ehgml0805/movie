<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<div class="container mt-3 text-center" style="width: 70%;">
		<h1 class="text-center">공지사항</h1><br><br>
		<h3>${map.noticeTitle}</h3>
		<div style="text-align:right;">
			<small>등록일 ${map.createdate}</small>
		</div>
		<hr>
		<c:if test="${map.fileName ne null}">
			<div><img src="${pageContext.request.contextPath}/notice-upload/${map.fileName}"></div>
		</c:if>
		<div>${map.noticeContent}</div>
	</div>
</body>
</html>