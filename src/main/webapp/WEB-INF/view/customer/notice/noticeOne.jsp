<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
</head>
<body>
	<h1>공지사항</h1>
	<h3>${map.noticeTitle}</h3>
	<div>
		<small>등록일 ${map.createdate}</small>
	</div>
	<hr>
	<c:if test="${map.fileName ne null}">
		<div><img src="${pageContext.request.contextPath}/notice-upload/${map.fileName}"></div>
	</c:if>
	<div>${map.noticeContent}</div>
</body>
</html>