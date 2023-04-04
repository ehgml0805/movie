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
							<c:if test="${ nowTime1 <=c.useByDate && c.state == N}">
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

	<script>
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
			$(document).ready(function() {ß
		        $('#sum').val(bcsum);
		    });
		  }
		}
		
		
	</script>
	<div>
		<!-- footer -->
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>
</body>
</html>
