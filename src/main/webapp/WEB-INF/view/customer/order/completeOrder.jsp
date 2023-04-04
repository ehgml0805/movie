<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!--제이쿼리  -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

		<h3 style="text-align: center;">결제 금액 : <fmt:formatNumber value="${sum}" pattern="#,###"/></h3>
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
			<c:forEach var="c" items="${list}">
				<tr>
					<td><img src="${pageContext.request.contextPath}/snackImg/${c.fileName}.${c.fileType}" width="200px" height="200px"> ${c.snackName}</td>
					<td>${c.cartQuantity}</td>
					<td><fmt:formatNumber value="${c.snackPrice/c.cartQuantity}" pattern="#,###"/></td>
					<td><fmt:formatNumber value="${c.snackPrice}" pattern="#,###"/></td>
				</tr>
			</c:forEach>
		</table>
		
		
	</div>
	<br><br><br><br>
		<div style="text-align: center;">
			<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='${pageContext.request.contextPath}/snack/snackHome'">계속 쇼핑하기</button>
			<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='${pageContext.request.contextPath}/customer/order/orderPage'">주문 보기</button>
		</div>
		
	
</body>
</html>