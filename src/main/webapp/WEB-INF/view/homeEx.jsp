<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<c:if test="${loginCustomer != null }">

		<h1>${loginCustomer.customerName}님 반갑습니다</h1>
	
	</c:if>
	
	안녕하세요. 홈 입니다.
</body>
</html>