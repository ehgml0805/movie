<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	  	<meta charset="utf-8">
	<!--   	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  	<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
	  	<link rel="stylesheet" href="/resources/css/navbar.css" />
	  	<link rel="stylesheet" href="/resources/css/common.css" />
	  	<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<c:if test="${loginCustomer != null }">

		<h1>${loginCustomer.customerName}님 반갑습니다</h1>
	</c:if>
	
	<c:if test="${loginEmployee != null }">

		<h1>${loginEmployee.employeeName}님 반갑습니다</h1>
		
	</c:if>
	<div>현재 방문자 수: ${currentVisitors}</div>
	<div>오늘 총 방문자 수: ${todayCount}</div>
	안녕하세요. 홈 입니다.
</body>
</html>