<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<div class="container">
		<h1>주문상세</h1>
		<hr style="height: 3px; background-color:black;" width="100%">
		<br><br>
		<h2>상품바코드</h2>
		<div style="text-align: center;">
			<img src="${pageContext.request.contextPath}/snack-upload/${o.dataKey}.png"><br>
			<div style="text-align: center;">${o.dataKey}</div>
		</div>	
		<br><br>
		<h2>상품정보</h2>
		<hr style="height: 3px; background-color:black;" width="100%">
		<table width="100%">
			<tr>
				<td colspan="2">상품명</td>
				<td>수량</td>
				<td>상품가격</td>
	
			</tr>
			<tr><td colspan="3"><hr></tr>
			<tr>
				<td><img src="${pageContext.request.contextPath}/snackImg/${s.fileName}.${s.fileType}"></td>
				<td>${s.snackName}</td>
				<td>${o.orderQuantity}</td>
				<td>${o.orderPrice}</td>
			</tr>
		</table>
	</div>

</body>
</html>