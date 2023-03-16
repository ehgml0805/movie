<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/style.css">
<title></title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<div class="container">
		<h1>Order</h1>
		<hr style="height: 3px; background-color:black;">
		<br>
		
		<div class="row">
			<div class="col-10">
				<c:set var="predate" value=""/>
				<c:forEach var="o" items="${list}">
					<c:set var ="num" value="${o.createdate}"/> 
					<c:set var="curdate" value="${fn:substring(num,0,10)}"/>
					
					<c:if test="${curdate != predate}">
					<c:set var="predate" target="predate" value="${fn:substring(num,0,10)}"/>
					<br>
					<h4>${predate} 주문</h4>
					</c:if>	
					
					<table width="750px;">
						<tr><td colspan="4"><hr></td></tr>
						<tr>
							<td width="15%"><img src="${pageContext.request.contextPath}/snackImg/${o.snackFileName}.${o.snackFileType}" width= "200px" height="200px"></td>
							<td>
								<table width="100%" style="text-align: center;">
									<tr><td><h4><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${o.snackKey}">${o.snackName}</a></h4></td> </tr>
									<tr><td><c:if test="${o.orderState eq 'N'}">
											사용 전
										</c:if>
										<c:if test="${o.orderState eq 'Y'}">
											사용 후
										</c:if>
										</td></tr>
									
									<tr><td> ₩ <fmt:formatNumber value="${o.orderPrice}" pattern="#,###"/>&nbsp;&nbsp;&nbsp;${o.orderQuantity}개</td></tr>
								</table>
							</td>
							<td>
						 		<button type="button" class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath}/customer/order/orderOne?orderKey=${o.orderKey}'">상세보기</button>
							</td>	
							
							
						</tr>
						
						
					</table>
					<c:if test="${curdate != predate}">
					<br>
					</c:if>
				</c:forEach>	
			</div>
		</div>
	</div>	
</body>
</html>