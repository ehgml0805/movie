<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/bootstrap.min.css">
    
    <!-- Style -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/style.css">
<title>결제</title>
</head>

<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	</div>
		<br><br><br>
	<div class="container">
		<h1>MyCart</h1>
		<hr style="height: 3px; background-color:black;">
		
		<br><br>
		
		<c:if test="${empty list}">
				<h2 style="text-align: center;">장바구니가 비었습니다</h2>
		</c:if>
		
		<c:forEach var="c" items="${list}">
			<table width="100%">
				<tr>
					<td colspan="3"><hr></td>
				</tr>
				<tr>
					<c:if test="${c.soldOut=='N'}">
						<form action="${pageContext.request.contextPath}/customer/order/selectCart" method="post" id="checkForm${c.snackKey}">
							<input type="hidden" name="snackKey" value="${c.snackKey}">
					 		<td width='5%' style="text-align: center;">
					 			<input type="checkBox" name="selected" id="selected${c.snackKey}" value= 1 <c:if test="${c.selected==1}">checked</c:if>>
					 		</td>
				 		</form>
					</c:if>	
					
					<c:if test="${c.soldOut=='Y'}">
						<td width="5%" style="text-align: center;">품절</td>
					</c:if>
					
					<td width="15%">
						<img src="${pageContext.request.contextPath}/snackImg/${c.fileName}.${c.fileType}" width= "200px" height="200px">
					</td>
					
					<td>
						<table width="100%" style="text-align: center;">
				 			<tr>
				 				<td>
				 					<h4><a style="color:black" href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${c.snackKey}">${c.snackName}</a></h4>
				 				</td>
				 			</tr>
				 			<tr>
			 					<form action="${pageContext.request.contextPath}/customer/order/updateCartQuantity" method="post" id="updateQunatity${c.snackKey}">
			 						<td>
			 						₩ <fmt:formatNumber value="${c.cartPrice}" pattern="#,###"/>  &nbsp;&nbsp;&nbsp;
					 					<c:if test="${c.soldOut=='N'}">	
					 						<input type="hidden" name="snackKey" value="${c.snackKey}">
									 		
									 		<c:if test="${c.cartQuantity==1}">
										 		<select name="cartQuantity" id="quantity${c.snackKey}">
													<option value="1" selected="selected">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												
												</select>	
											</c:if>	
											
											<c:if test="${c.cartQuantity==2}">
										 		<select name="cartQuantity" id="quantity${c.snackKey}">
													<option value="1">1</option>
													<option value="2" selected="selected">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												
												</select>	
											</c:if>	
											
											<c:if test="${c.cartQuantity==3}" >
										 		<select name="cartQuantity" id="quantity${c.snackKey}">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3" selected="selected">3</option>
													<option value="4">4</option>											
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
												</select>	
											</c:if>	
											
											<c:if test="${c.cartQuantity==4}">
										 		<select name="cartQuantity" id="quantity${c.snackKey}">
													<option value="1" >1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4" selected="selected">4</option>
													<option value="5">5</option>
												</select>
											</c:if>	
											
											<c:if test="${c.cartQuantity==5}">
										 		<select name="cartQuantity" id="quantity${c.snackKey}">
													<option value="1" >1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5" selected="selected">5</option>
												</select>	
											</c:if>
											
										 </c:if>
									 <c:if test="${c.soldOut=='Y'}">
					 					품절
					 				</c:if>
					 			</td>
					 		</form>
					 	</tr>
				 		<tr>
				 			<td>&nbsp;</td>
				 		</tr>
				 		<tr>
				 			<td>
						 		<button type="button" class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/customer/order/deleteCart?snackKey=${c.snackKey}'">삭제</button>
						 	</td>
						 </tr>	
			 			</table>
			 		</td>		
				</tr>
				<tr>
					<td colspan="3"><hr></td>
				</tr>
			</table>	
		</c:forEach>
		<br>
		
		<c:if test="${!empty list}">
			<fieldset style="text-align: center;">
				<h4>
					총 가격 : ₩  <fmt:formatNumber value="${sum}" pattern="#,###"/>
				</h4>
				
			</fieldset>
		
		<div style="text-align: center;">
			<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='${pageContext.request.contextPath}/customer/order/paymentCart'">결제하기</button></div>
		</c:if>
		
		<br><br><br><br>
		
		<!-- 하단에 베스트 상품 띄우기  -->
		<div>
			<h3 style="font-weight: bold; text-align: center;">Best</h3>
				<br>
			<table width="100%">
				<tr>
					<c:forEach var="b" items="${hit}">
						<td>
							<div>
								<a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
									<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="200" height="200">
								</a>
							</div>
							<div>${b.snackName}</div>
							<div>₩ <fmt:formatNumber value="${b.snackPrice}" pattern="#,###"/> </div>
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
	
	<br><br><br>
	
	<c:forEach var="c" items='${list}'>
		<script>
			$(document).ready(function(){	
				$('#selected${c.snackKey}').change(function(){
					$('#checkForm${c.snackKey}').submit();
				})
				
				$("#quantity${c.snackKey}").change(function(){
					$('#updateQunatity${c.snackKey}').submit();
				})
			})
		</script>
	</c:forEach>

</body>
</html>