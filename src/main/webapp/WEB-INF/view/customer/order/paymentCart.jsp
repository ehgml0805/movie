<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
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
		<form action="${pageContext.request.contextPath}/customer/order/paymentCart" method="post" id="payment">
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
						<c:forEach var="c" items="${list}">
							<td>${c.snackName}</td>
							<td><img width='200px' height="200px" src="${pageContext.request.contextPath}/snackImg/${c.fileName}.${c.fileType}"></td>
							<td>₩ <fmt:formatNumber value="${c.snackPrice*c.cartQuantity}" pattern="#,###"/></td>
							<td>${c.cartQuantity}</td>
						</c:forEach>
					</tr>
				<tr><td colspan=4><hr></td></tr>
				</table>
				<hr style="height: 3px; background-color:black;">
				<table width="100%">
					<tr>
						<td> 사용가능 쿠폰 </td>
						<td> 할인금액 </td>
						<td> 사용기한 </td>
					</tr>
					<tr><td colspan=3><hr></td></tr>
					<tr>
						<c:forEach var="c" items="${clist}">
							<c:if test="${ nowTime1 <=c.useByDate}">
								<td>
									<input type="checkbox" id="mycouponKey" name="mycouponKey" onclick='getCheckboxValue(event)' readonly="readonly"
											value="${c.mycouponKey}" data-price="${c.couponSalePrice}"/> ${c.couponName}
								</td>
								<td>${c.couponSalePrice}</td>
								<td>${c.useByDate}</td>
							</c:if>
						</c:forEach>
					</tr>
				</table>
				
				
			<br>	
			<fieldset>
				<legend>결제 정보</legend>
				<hr style="height: 3px; background-color:black;">
				<input type="hidden" id="besum" value="${sum}">
					<table width="100%">
						<tr>
							<td>총 상품가격</td>
							<td>
								₩ <input type="tel" name="sum" id="sum" style="border: none;"
										value="<fmt:formatNumber value="${contentNotice}" pattern="###,###"/>">
							</td>
						</tr>
					
						<tr><td colspan=2><hr></td></tr>
						<tr>
							<td>결제방법</td>
							<td>신용카드</td>
						</tr>
						<tr><td colspan=2><hr></td></tr>
					</table>
			</fieldset>
			<button type="submit" id="btn" class="btn btn-outline-dark btn-lg">결제하기</button>
		</form>
	</div>

	<script type="text/javascript">
		$(document).on('click', "input[type='checkbox']", function(){
		    if(this.checked) {
		        const checkboxes = $("input[type='checkbox']");
		        for(let ind = 0; ind < checkboxes.length; ind++){
		            checkboxes[ind].checked = false;
		        }
		        this.checked = true;
		    } else {
		        this.checked = false;
		    }
		});
	
		var result = parseInt($('#besum').val(),10);
		$(document).ready(function() {
	        $('#sum').val(result);
	    });
		function getCheckboxValue(event)  {

		  if(event.target.checked)  {
		    	
				var bcsum= parseInt($('#besum').val(),10);
				console.log(bcsum+"<==쿠폰 적용 전")
				
				result=Number(bcsum - $('#mycouponKey').attr('data-price'));
				console.log(result+"<==쿠폰 적용 후")
				
				$(document).ready(function() {
			        $('#sum').val(result);
			    });
		    
		    result = event.target.value;
		    
		  }else {
				var bcsum= parseInt($('#besum').val(),10);
				$(document).ready(function() {
			        $('#sum').val(bcsum);
			    });
		  }
		}
		
		
	</script>
	
</body>
</html>
