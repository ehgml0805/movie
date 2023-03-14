<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/bootstrap.min.css">
    
    <!-- Style -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/style.css">
   <style type="text/css">
html, body {
    height: 100%
}

#wrap {
    min-height: 100%;
    position: relative;
    padding-bottom: 60px;
}

footer {
    bottom: 0;
}	

</style>
   
</head>
<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<br><br>
	<div class="container">
		<h2>주문 완료</h2>
		<hr style="height: 3px; background-color:black;">
		
		<h2 style="text-align: center;">주문해주셔서 감사합니다</h2>
		<br>	

		<h3 style="text-align: center;">결제 금액 : <fmt:formatNumber value="${o.orderPrice}" pattern="#,###"/></h3>
		<hr>
		<br><br>
		<h4>Order Info</h4>
		<hr style="height: 3px; background-color:black;">
		<table width="100%">
			<tr>
				<td>상품명</td>
				<td>수량</td>
				<td>상품가격</td>
				<td>합계</td>

			</tr>
			<tr><td colspan="4"><hr></td></tr>	
			
				<tr>
					<td><img src="${pageContext.request.contextPath}/image/${s.fileName}.${s.fileType}" width="200px" height="200px"> ${s.snackName}</td>
					<td>${o.orderQuantity}</td>
					<td><fmt:formatNumber value="${o.orderPrice/o.orderQuantity}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${o.orderPrice}" pattern="#,###"/></td>
				</tr>
		</table>
		
		
	</div>
	<br><br><br><br>
		<div style="text-align: center;">
			<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='${pageContext.request.contextPath}/snack/snackHome'">계속 쇼핑하기</button>
			<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='${pageContext.request.contextPath}/customer/order/orderPage'">주문 보기</button>
		</div>
		
	
</body>
</html>