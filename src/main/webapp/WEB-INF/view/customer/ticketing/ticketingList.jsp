<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>MEET PLAY SHARE, E1I6</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- Header-->
	<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import> 
	<br><br>
	<div class="container">
		<h2>나의 예매 내역</h2>
		<br>
		<div style="color:red;" id="msg">
			${msg}
		</div>
		
		<c:forEach var="t" items="${ticketingList}" varStatus="s">
		<c:set var="in" value="${s.index}"/>
			<c:choose>
				<c:when test="${ticketingList[in-1].ticketingTime eq t.ticketingTime}">
					<tr>
						<td>${t.grade} ${t.movieTitle}</td>
						<c:choose>
							<c:when test="${t.fileSize eq '0'}">
								<td>
									<img alt="영화이미지" src="${t.fileName}" width="120px" height="171px">
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${t.fileName}" width="120px" height="171px">
								</td>
							</c:otherwise>
						</c:choose>
						<td>${t.customerName}</td>
						<td>${t.customerPhone}</td>
						<td>${t.seatNumber}</td>
						<td>${t.totalPrice}원</td>
						<td>${t.discountPrice}원</td>
						<td>${t.couponName}</td>
						<td>${t.couponGrade}</td>
						<td>${t.couponSalePrice}원</td>
						<td>${t.ticketingTime}</td>
						<td>${t.startTime}</td>
						<td>${t.endTime}</td>				
					</tr>
				</c:when>
				<c:otherwise>
					</table>
					<br>
					<h3>예매 날짜 : ${t.ticketingDate}</h3>
					<br>
					<table class="table table-bordered" style="text-align:center;">
						<tr>
							<th>영화 제목</th>
							<th>영화 포스터</th>
							<th>예매자</th>
							<th>예매자 전화번호</th>
							<th>좌석명</th>
							<th>총 금액</th>
							<th>할인 금액</th>
							<th>쿠폰 이름</th>
							<th>쿠폰 등급</th>
							<th>쿠폰 할인금액</th>
							<th>결제 일시</th>
							<th>시작 시간</th>
							<th>종료 시간</th>				
						</tr>
						<tr>
							<td>${t.grade} ${t.movieTitle}</td>
							<c:choose>
								<c:when test="${t.fileSize eq '0'}">
									<td>
										<img alt="영화이미지" src="${t.fileName}" width="120px" height="171px">
									</td>
								</c:when>
								<c:otherwise>
									<td>
										<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${t.fileName}" width="120px" height="171px">
									</td>
								</c:otherwise>
							</c:choose>
							<td>${t.customerName}</td>
							<td>${t.customerPhone}</td>
							<td>${t.seatNumber}</td>
							<td>${t.totalPrice}원</td>
							<td>${t.discountPrice}원</td>
							<td>${t.couponName}</td>
							<td>${t.couponGrade}</td>
							<td>${t.couponSalePrice}원</td>
							<td>${t.ticketingTime}</td>
							<td>${t.startTime}</td>
							<td>${t.endTime}</td>						
						</tr>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</table>
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
</body>
</html>