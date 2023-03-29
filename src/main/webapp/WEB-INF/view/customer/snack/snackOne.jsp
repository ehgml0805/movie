<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/owl.carousel.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
 	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
</head>
<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<div class="container">
		<h1>${s.categoryContent}</h1>
		<hr style="height: 3px; background-color:black;">
		<div class="row">
			<div class="col-5">
				<div class="wrap">
					<img src="${pageContext.request.contextPath}/snackImg/${s.fileName}.${s.fileType}" img width="100%" height= "auto" class="target" data-zoom="3">
				</div>
			</div>
			<div class="col-7">
				<h2>${s.snackName}</h2>
				<hr>
				<br>
				<h5>${s.snackContent}</h5>
				<hr>
				<h5>₩ <fmt:formatNumber value="${s.snackPrice}" pattern="#,###"/> </h5>
				<br>
				<c:if test="${s.soldOut=='N'}">
					<form name="form" method="post">
						<input type="hidden" name="snackKey" value="${s.snackKey}">
						<select name="cartQuantity" class="form-select">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select>
						<br>
						<button class="btn btn-outline-dark" type="submit" onclick="javascript: form.action='${pageContext.request.contextPath}/customer/order/paymentDir'">바로구매</button>
						<button class="btn btn-outline-dark" type="submit" onclick="javascript: form.action='${pageContext.request.contextPath}/customer/snack/insertCart'">장바구니에 담기</button>
						<br><br>
					</form>
				</c:if>
				<c:if test="${row==1}">
							<div>장바구니에 담았습니다</div>
						</c:if>
						
						<c:if test="${row==0}">
							<div>이미 담겨있는 상품 입니다</div>
						</c:if>
						<br>
				<c:if test="${s.soldOut == 'Y'}">
						<h3>현재 상품은 준비중입니다.</h3>
				</c:if>
			</div>
			
		</div>
		<br><br><br><br>
		<div>
			<h3 style="font-weight: bold; text-align: center;"  >BestSeller</h3>
					<br>
			<br>
			<table width="100%">
				<tr>
					<c:forEach var="b" items="${best}">
						<td>
							<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
								<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="200" height="200">
							</a></div>
							<div>${b.snackName}</div>
							<div>₩ <fmt:formatNumber value="${b.snackPrice}" pattern="#,###"/> </div>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div> <script src="${pageContext.request.contextPath}/bootstrap/main3.js"></script>
</body>
</html>