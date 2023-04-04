<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<!--하단 footer 고정-->
	</style>
 
</head>
<body>
<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<br><br><br><br>
	<div class="container">
		<h1>주문결제</h1>
		<hr style="height: 5px; background-color:black;">
		<br><br>
		<form action="${pageContext.request.contextPath}/customer/order/paymentDirect" method="post" id="payment">
				<hr style="height: 3px; background-color:black;">
					<table width="100%">
					<tr>
						<td>상품이름</td>
						<td>상품사진</td>
						<td>가격</td>
						<td>수량</td>
					</tr>
					<tr><td colspan=4><hr></td></tr>
						<tr>
							<td>${s.snackName}</td>
							<td><img width='200px' height="200px" src="${pageContext.request.contextPath}/snackImg/${s.fileName}.${s.fileType}"></td>
							<td>₩ <fmt:formatNumber value="${s.snackPrice*quantity}" pattern="#,###"/></td>
							<td>${quantity}</td>
						</tr>
					<tr><td colspan=4><hr></td></tr>
					</table>
				
			<br><br>
			<br><br>
			<fieldset>
				<legend>결제 정보</legend>
				<hr style="height: 3px; background-color:black;">
					<table width="100%">
						<tr>
							<td>총 상품가격</td>
							<td>₩ <fmt:formatNumber value="${s.snackPrice*quantity}" pattern="#,###"/></td>
						</tr>
					
						<tr><td colspan=2><hr></td></tr>
						<tr>
							<td>결제방법</td>
							<td>신용카드</td>
						</tr>
						<tr><td colspan=2><hr></td></tr>
					</table>
			</fieldset>
			<input type="hidden" name="snackKey" value="${s.snackKey}">
			<input type="hidden" name="orderQuantity" value="${quantity}">
			<input type="hidden" name="orderPrice" value="${s.snackPrice*quantity}">
			<button type="submit" id="btn" class="btn btn-outline-dark btn-lg">결제하기</button>
		</form>
	</div>


	
	<div>
		<!-- footer -->
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>
</body>
</html>
