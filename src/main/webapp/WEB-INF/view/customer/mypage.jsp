<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!--제이쿼리  -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<style type="text/css">
	
	button {
	  width: 200px;
	  text-align: left;
	  font-weight: bold;
	  margin-right: 60px;
	}
	.nav{
	background-color: #f2f4f5;
	border-radius: value
	}
	</style>
</head>

<body>
	<div>
		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import> 
	</div>
	<div class="container" style="margin-top: 80px;">
		
		<!-- 사이드 네비바  -->
		<div class="container">
			<div class="d-flex align-items-start" >
				<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" >
					<button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button"
						role="tab" aria-controls="v-pills-home" aria-selected="true" style="background-color: #666666">MY E1I6 BOX</button>
					
					<button class="nav-link" id="v-pills-ticketing-tab" data-bs-toggle="pill" data-bs-target="#v-pills-ticketing" type="button"
						role="tab" aria-controls="v-pills-ticketing" aria-selected="true" style="background-color: #f2f4f5;">예매내역</button>
						
					<button class="nav-link" id="v-pills-coupon-tab" data-bs-toggle="pill" data-bs-target="#v-pills-coupon"
						type="button" role="tab" aria-controls="v-pills-coupon" aria-selected="false">관람권/할인쿠폰 관리</button>
						
					<button class="nav-link" id="v-pills-point-tab" data-bs-toggle="pill" data-bs-target="#v-pills-point"
						type="button" role="tab" aria-controls="v-pills-point" aria-selected="false">멤버십 포인트</button>
						
					<button class="nav-link" id="v-pills-event-tab" data-bs-toggle="pill" data-bs-target="#v-pills-event"
						type="button" role="tab" aria-controls="v-pills-event" aria-selected="false">이벤트 참여내역</button>
						
					<button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile"
						type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">회원정보</button>
						
					<button class="nav-link" id="v-pills-help-tab" data-bs-toggle="pill" data-bs-target="#v-pills-help"
						type="button" role="tab" aria-controls="v-pills-help" aria-selected="false">나의 문의내역</button>
				</div>
		
				<!-- 탭 내용 -->
				<div class="tab-content" id="v-pills-tabContent" style="width: 840px;">
					<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
					
						<div class="row justify-content-md-center">
							<div class="card" style="border:  none;">
							
					  			<div class="card-body" style="background-image: url(../img/my_info_topbg.png); height: 220px;" >
									<div class="row" style=" margin-top: 40px;">
										<div class="col-2">
											<img src="${pageContext.request.contextPath}/customer-upload/${co.get(0).fileName}" width="100px;" height="100px;">
										</div>	
										<div class="col-4">
											<span style="font-size: 38px; color: white;"> 안녕하세요!</span>
											<br>
											<strong style="font-size: 38px; color: white; font-weight: bold;">${co.get(0).get('customerName') }님 </strong> ${co.get(0).get('customerId') }	
										</div>	
										<div class="col-6">
											
											<span style="font-size: 38px; color: white;">${co.get(0).get('customerPoint') } P</span> 
											<span style="font-size: 13px; color: white;">현재등급 </span>
											<span style="font-weight: bold; font-size: 16px; color: #1f92ff;"> ${co.get(0).get('customerGrade') } </span> 
											<br>
											생일 : ${co.get(0).get('customerBirthday') }	
											<br>
											핸드폰 : ${co.get(0).get('customerPhone') }	
											<br>
											이메일 : ${co.get(0).get('customerEmail') }	
										</div>
									</div>
									
								</div>
								<div class="card-body" style="background-color: #f2f4f5;">
								    <a href="#" class="card-link">Card link</a>
								    <a href="#" class="card-link">Another link</a>
								 </div>
							</div>
						</div>
					
					
					</div>
					
					<div class="tab-pane fade" id="v-pills-ticketing" role="tabpanel" aria-labelledby="v-pills-ticketing-tab">
						<h2>예매내역</h2>
					</div>
					
					<div class="tab-pane fade" id="v-pills-coupon" role="tabpanel" aria-labelledby="v-pills-coupon-tab">
						<h2>쿠폰내역</h2>
						<table class="table table-striped table-hover">
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
										<c:if test="${status.index%5==0}"> <!-- td가 계속 반복해서 떠서 5개의 인덱스가 생기면 줄바꿈 -->
											</tr><tr>
										</c:if>
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
						 <table class="table ">
							<thead>
								<tr>
									<th scope="col">카테고리</th>
									<th scope="col" style="color: blue;">포인트</th>
									<th scope="col">적립일</th>
									<th scope="col">카테고리</th>
									<th scope="col" style="color: red;">포인트</th>
									<th scope="col">사용일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach var="pa" items="${PA }">
										<td>${pa.pointCategory }</td>
										<td style="color: blue;">${pa.point }</td>
										<td>${pa.createdate }</td>
									</c:forEach>
									<c:forEach var="pr" items="${PR }">
										<td>${pr.pointCategory }</td>
										<td style="color: red;">${pr.point }</td>
										<td>${pr.createdate }</td>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="tab-pane fade" id="v-pills-event" role="tabpanel" aria-labelledby="v-pills-event-tab">
						<h4>참여한 이벤트 내역 </h4>
						<table class="table " >
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
								<table class="table" >  
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
												<input type ="radio" id ="customerGender" name="customerGender" value="M" checked >남자
												<input type ="radio" id ="customerGender" name="customerGender" value="F" >여자
											</td>
										</c:if>
										<c:if test="${loginCustomer.customerGender =='F'}">
											<td>
												<input type ="radio" id ="customerGender" name="customerGender" value="M" >남자
												<input type ="radio" id ="customerGender" name="customerGender" value="F" checked >여자
											</td>
										</c:if>
									</tr>
									<tr>	
										<th>휴대폰 번호</th>
										<td>
											<input type ="tel" id ="customerPhone" name="customerPhone" placeholder="000-0000-0000" value="${loginCustomer.customerPhone}"
												pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required minlength="13" maxlength="13" class="form-control">
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
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>