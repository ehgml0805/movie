<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
	<title>MEET PLAY SHARE, E1I6</title>
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<div>
		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import> 
	</div>
	<div class="container">
		<h1 style="font-weight: bold; font-size: 30px; margin-top: 40px;">${s.categoryContent}</h1>
		<hr style="height: 3px; background-color:black;">
		<div class="row">
			<div class="col-5">
				<div class="wrap">
					<img src="${pageContext.request.contextPath}/snackImg/${s.fileName}.${s.fileType}" img width="100%" height= "auto" class="target" data-zoom="3">
				</div>
			</div>
			<div class="col-7">
				<h2 style="margin-bottom: 40px;">${s.snackName}</h2>
				<hr>
				<h5>${s.snackContent}</h5>
				<hr>
				<input type="hidden" id="snackPrice" value="${s.snackPrice}"> 
				<h5> 
					<input type="text" id="inputValue" style="color:#351f66; font-size: 30px;"
							value="<fmt:formatNumber value="${s.snackPrice}" pattern="###,###"/> 원" readonly="readonly" > 
				</h5>
				<br>
				<span>판매수량  1회 5개 구매가능</span>
				<br>
				<c:if test="${s.soldOut=='N'}">
					<form name="form" method="post">
						<input type="hidden" name="snackKey" value="${s.snackKey}">
						<select name="cartQuantity" id="cartQuantity" class="form-select" style="width: 160px;">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
						</select>
						<br>
						<button class="btn btn-outline-* btn-lg" style="border-color: #503396; border-width: 1px; color: #503396;" type="submit" onclick="javascript: form.action='${pageContext.request.contextPath}/customer/snack/insertCart'">장바구니에 담기</button>
						<button class="btn btn-outline-secondary btn-lg" style="background-color: #503396;; color: white;" type="submit" onclick="javascript: form.action='${pageContext.request.contextPath}/customer/order/paymentDir'">바로구매</button>
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
		<hr>
		<div>
			<h3 style="font-weight: bold; text-align: center;" font-size: 30px; style="margin-bottom: 30px;" >BestSeller</h3>
			<br>
			<br>
			<div class="container">
				<table width="100%">
					<tr>
						<c:forEach var="b" items="${best}">
							<td>
								<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
									<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="240" height="240">
								</a></div>
								<div>${b.snackName}</div>
								 <fmt:formatNumber value="${b.snackPrice}" pattern="#,###"/>원
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</div>
	</div> 
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	<script>
	$(document).ready(function(){
		  $("#cartQuantity").change(function(){
		    // Value값 가져오기
		   	var val= $("#cartQuantity").val()
		    val = $("#cartQuantity :selected").val();
		    console.log(val+'<==val')
		    
		    /* Text값 가져오기
		    var text = $("#cartQuantity :selected").text();
		    console.log(text+'<==text')
		    // Index가져오기
		    var index = $("#cartQuantity :selected").index();
		    console.log(index+'<==index')
		    
		    $("#value").val(val);
		    $("#text").val(text);
		    */
		    
		    
		    var snackPrice= $("#snackPrice").val();
		  	
		    $(document).ready(function() {
		        $('#inputValue').val((val * snackPrice).toLocaleString("ko-KR")+' 원').css("color","#351f66");
		    });
		  
		    
		  });
		  
		});
  	
  	
		
	</script>	
</body>
</html>