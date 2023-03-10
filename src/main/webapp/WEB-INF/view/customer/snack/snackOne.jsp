<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
		<h1>${s.categoryContent}</h1>
		<hr style="height: 3px; background-color:black;">
		<div class="row">
			<div class="col-5">
				<div class="wrap">
					<img src="${pageContext.request.contextPath}/snackImg/${s.fileName}.${s.fileType}">
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
						<button class="btn btn-outline-dark" type="submit" onclick="javascript: form.action='${pageContext.request.contextPath}/insertOrder'">바로구매</button>
						<button class="btn btn-outline-dark" type="submit" onclick="javascript: form.action='${pageContext.request.contextPath}/insertCart'">장바구니에 담기</button>
						<br><br>
					</form>
				</c:if>
				<c:if test="${result==1}">
							<div>장바구니에 담았습니다</div>
						</c:if>
						
						<c:if test="${result==0}">
							<div>이미 담겨있는 상품 입니다</div>
						</c:if>
						<br>
				<c:if test="${s.soldOut == 'Y'}">
						<h3>현재 상품은 준비중입니다.</h3>
				</c:if>
			</div>
			
		</div>
		<div>
			<h3>BEST</h3>
			<br>
			<table width="100%">
				<tr>
					<c:forEach var="b" items="${best}">
						<td>
							<div><a href="${pageContext.request.contextPath}/customer/snack/snackOne?snackKey=${b.snackKey}">
								<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}">
							</a></div>
							<div>${b.snackName}</div>
							<div>₩ <fmt:formatNumber value="${g.goodsPrice}" pattern="#,###"/> </div>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>