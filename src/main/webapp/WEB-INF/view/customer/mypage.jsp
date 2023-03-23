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
<!--제이쿼리  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	<div class="container" style="margin-top: 50px; ">
		<div class="card">
  			<div class="card-body" style="width: 980px;">
				<div class="row">
					<div class="col-4">
						<img src="${pageContext.request.contextPath}/customer-upload/${co.get(0).fileName}" width="100%" height="100%">
					</div>	
					<div class="col-8">
						 <strong style="font-size: 15mm;">${co.get(0).get('customerName') }님 </strong> ${co.get(0).get('customerId') }	
				
						<hr>
						고객님은 <span style="font-weight: bold;"> ${co.get(0).get('customerGrade') } </span> 입니다.
						<br>
						생일 : ${co.get(0).get('customerBirthday') }	
						<br>
						핸드폰 : ${co.get(0).get('customerPhone') }	
						<br>
						이메일 : ${co.get(0).get('customerEmail') }	
					</div>
				</div>
			</div>
		</div>
		<br><br><br><br>

		<!-- 사이드 네비바  -->
		<div class="container">
			<div class="d-flex align-items-start">
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
					<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button"
						role="tab" aria-controls="v-pills-home" aria-selected="true" style="width: 175px; text-align: left;">나의 예매내역</button>
						
					<button class="nav-link" id="v-pills-coupon-tab" data-bs-toggle="pill" data-bs-target="#v-pills-coupon"
						type="button" role="tab" aria-controls="v-pills-coupon" style="width: 175px; text-align: left;"
						aria-selected="false">관람권/할인쿠폰 관리</button>
						
					<button class="nav-link" id="v-pills-point-tab" data-bs-toggle="pill" data-bs-target="#v-pills-point"
						type="button" role="tab" aria-controls="v-pills-point" style="width: 175px; text-align: left;"
						aria-selected="false">Point 관리</button>
						
					<button class="nav-link" id="v-pills-event-tab" data-bs-toggle="pill" data-bs-target="#v-pills-event"
						type="button" role="tab" aria-controls="v-pills-event" style="width: 175px; text-align: left;"
						aria-selected="false">이벤트 참여내역</button>
						
					<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile"
						type="button" role="tab" aria-controls="v-pills-profile" style="width: 175px; text-align: left;"
						aria-selected="false">회원정보</button>
						
					<button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help"
						type="button" role="tab" aria-controls="v-pills-help" style="width: 175px; text-align: left;"
						aria-selected="false">나의 문의내역</button>
				</div>
		
				<div class="tab-content" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
					
					</div>
					
					<div class="tab-pane fade" id="v-pills-coupon" role="tabpanel" aria-labelledby="v-pills-coupon-tab">
						<table class="table table-striped table-hover" style="width: 900px;">
							<thead>
								<tr>
									<th scope="col">쿠폰명</th>
									<th scope="col">쿠폰상태</th>
									<th scope="col">할인금액</th>
									<th scope="col">쿠폰등급</th>
									<th scope="col">사용기한</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach var="c" items="${clist }">
										<td>${c.couponName }</td>
										<td>${c.state }</td>
										<td>${c.couponSalePrice }</td>
										<td>${c.couponGrade }</td>
										<td>${c.useByDate }</td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tab-pane fade" id="v-pills-point" role="tabpanel" aria-labelledby="v-pills-point-tab">
						 나의 포인트 내역 뽑기 
						</div>
					
					<div class="tab-pane fade" id="v-pills-event" role="tabpanel" aria-labelledby="v-pills-event-tab">
						<h4>참여한 이벤트 내역 </h4>
						<table class="table " style="width: 900px;">
							<thead>
								<tr>
									<th scope="col">이벤트</td>
									<th scope="col">시작일</td>
									<th scope="col">종료일</td>
								</tr>
							</thead>
							<c:forEach var="e" items="${elist }">
								<tbody>
									<tr>
										<td>
											<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="200" height="200"> <br>
											${e.eventTitle }
										</td>
										<td>${e.eventStartDate }</td>
										<td>${e.eventEndDate }</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					
					<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						<form method ="post" action ="${pageContext.request.contextPath}/login/modifyCustomer" >
								<table class="table" style="width: 900px;">  
									<tr>
										<th>프로필 사진</th>
										<td>
											<input type="file" name="customerImgList" class="form-control">
											<c:if test="${map.fileName ne null}">
												<div><img src="${pageContext.request.contextPath}/customer-upload/${map.fileName}" name="customerImgFileName"></div>
											</c:if>
										</td>
									</tr>
									<tr>
										<th>아이디</th>
										<td>
											<input type ="text" id = "customerId" name="customerId" value="${loginCustomer.customerId}" readonly="readonly" style="border: none;">
										</td>
									</tr>
									<tr>	
										<th>이름</th>
										<td>
											<input type ="text" id="customerName" name="customerName" value="${loginCustomer.customerName}" class="form-control">
										</td>
									</tr>
									
									<!-- 카카오회원은 비밀번호를 수정할 수 없다 -->
									<c:if test="${empty loginCustomer.oauth}">
									<tr>	
										<th>비밀번호</th>
										<td>
											<input type ="password" id ="customerPw" name="customerPw" class="form-control">
										</td>
									</tr>
									
									</c:if>
									<tr>	
										<th>주소</th>
										<td>
											<input type ="text" id ="customerAddress" name="customerAddress" value="${loginCustomer.customerAddress}" class="form-control">
										</td>
									</tr>
									<tr>	
										<th>생일</th>
										<td>
											<input type ="date" id ="customerBirthday" name="customerBirthday" value="${loginCustomer.customerBirthday}" class="form-control">
										</td>
									</tr>
									<tr>	
										<th>성별</th>
										<c:if test="${loginCustomer.customerGender =='M'}">
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type ="radio" id ="customerGender" name="customerGender" value="M" checked class="form-check-input">남자
												&nbsp; <input type ="radio" id ="customerGender" name="customerGender" value="F" class="form-check-label">여자
											</td>
										</c:if>
										<c:if test="${loginCustomer.customerGender =='F'}">
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type ="radio" id ="customerGender" name="customerGender" value="M" class="form-check-label">남자
												&nbsp; <input type ="radio" id ="customerGender" name="customerGender" value="F" checked class="form-check-input">여자
											</td>
										</c:if>
									</tr>
									<tr>	
										<th>휴대폰 번호</th>
										<td>
											<input type ="tel" id ="customerPhone" name="customerPhone" placeholder="000-0000-0000" value="${loginCustomer.customerPhone}"
												pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
						     					required
						     					minlength="13"
												maxlength="13"
												class="form-control">
										</td>
									</tr>
									<!-- 카카오 회원은 email을 수정할 수 없다 -->
									<c:if test="${empty loginCustomer.oauth}">
										<tr>	
											<th>Email</th>
											<td>
												<input type ="email" id ="customerEmail" name="customerEmail"  value="${loginCustomer.customerEmail}"
													 size="30" required  class="form-control">
											</td>
										</tr>
									</c:if>
								</table>
								<div style="text-align: center;">
									<button type ="submit" id="addBtn" class="btn btn-dark">회원수정</button>
								</div>
							
							</form>
						</div>
						
						<div class="tab-pane fade" id="v-pills-help" role="tabpanel" aria-labelledby="v-pills-help-tab">
						 나의 문의 내역 뽑기 
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