<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/nav/css/style.css">
<!--제이쿼리 및 ajax -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 회원정보 수정하기 jsp -->
<script>

$(document).ready(function(){	
	function modifyCustomer(){
		
		$.ajax({
			method: 'GET'
	        , url: '${pageContext.request.contextPath}/login/modifyCustomer'
	        , dataType : 'html'
	        , success: function(data) {
	        	console.log('실행')
	        	$("#modifyCustomer").html(data);
	          }
		  });	
		}
	});
</script>
</head>

<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<div class="container">
		<fieldset class="row">
			<legend>고객정보</legend>
			
			<div class="col-4">
				<img src="${pageContext.request.contextPath}/customer-upload/${co.get(0).fileName}" width="200" height="200">
			</div>	
			<div class="col-8">
				고객아이디 : ${co.get(0).get('customerId') }	
				<br>
				성함 : ${co.get(0).get('customerName') }	
				<br>
				생일 : ${co.get(0).get('customerBirthday') }	
				<br>
				등급 : ${co.get(0).get('customerGrade') }	
				<br>
				핸드폰 : ${co.get(0).get('customerPhone') }	
				<br>
				이메일 : ${co.get(0).get('customerEmail') }	
			</div>
		</fieldset>
		<br><br><br><br>

		<!-- 사이드 네비바  -->
		<div class="container">
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button"
						role="tab" aria-controls="v-pills-home" aria-selected="true">나의 예매내역</button>
						
					<button class="nav-link" id="v-pills-coupon-tab" data-bs-toggle="pill" data-bs-target="#v-pills-coupon"
						type="button" role="tab" aria-controls="v-pills-coupon"
						aria-selected="false">관람권/할인쿠폰 관리</button>
						
					<button class="nav-link" id="v-pills-event-tab" data-bs-toggle="pill" data-bs-target="#v-pills-event"
						type="button" role="tab" aria-controls="v-pills-event"
						aria-selected="false">이벤트 참여내역</button>
						
					<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile"
						type="button" role="tab" aria-controls="v-pills-profile"
						aria-selected="false">회원정보</button>
				</div>
		
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
					
					</div>
					
					<div class="tab-pane fade" id="v-pills-coupon" role="tabpanel" aria-labelledby="v-pills-coupon-tab">
						<table>
							<tr>
								<td>쿠폰명</td>
								<td>쿠폰상태</td>
								<td>할인금액</td>
								<td>쿠폰등급</td>
								<td>사용기한</td>
							</tr>
							<tr>
								<c:forEach var="c" items="${clist }">
									<td>${c.couponName }</td>
									<td>${c.state }</td>
									<td>${c.couponSalePrice }</td>
									<td>${c.couponGrade }</td>
									<td>${c.useByDate }</td>
								</c:forEach>
							</tr>
						</table>
					</div>
					
					<div class="tab-pane fade" id="v-pills-event" role="tabpanel" aria-labelledby="v-pills-event-tab">
						<h4>참여한 이벤트 내역 </h4>
						<table>
							<tr>
								<td>이벤트</td>
								<td>시작일</td>
								<td>종료일</td>
							</tr>
							<c:forEach var="e" items="${elist }">
								<tr>
									<td>
										<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="200" height="200"> <br>
										${e.eventTitle }
									</td>
									<td>${e.eventStartDate }</td>
									<td>${e.eventEndDate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<div id="modifyCustomer">
						
						
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script src="${pageContext.request.contextPath}/bootstrap/nav/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/nav/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/nav/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/nav/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/nav/js/main.js"></script>
</body>
</html>