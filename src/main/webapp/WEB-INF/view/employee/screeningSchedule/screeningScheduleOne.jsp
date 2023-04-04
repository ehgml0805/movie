<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MEET PLAY SHARE, E1I6</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import>

	<div>${screeningSchedule.grade} ${screeningSchedule.movieTitle}</div>
	<div>${screeningSchedule.movieInfo}</div>
	<div>개봉일자 : ${screeningSchedule.openingdate} </div>
	<div>장소 : ${screeningSchedule.theaterName} ${screeningSchedule.screenroomName}</div>
	<div>가격 : ${screeningSchedule.price}원</div>
	<div>총 좌석 수 : ${screeningSchedule.seatCount}석</div>
	<div>시작 시간 : ${screeningSchedule.startDate}</div>
	<div>종료 시간 : ${screeningSchedule.endDate}</div>
	<div>
		시사회 여부 : 
		<c:choose>
			<c:when test="${screeningSchedule.preview eq 'Y'}">
				시사회
			</c:when>
			<c:otherwise>
				일반 상영
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		개봉 상태 : 
		<c:choose>
			<c:when test="${screeningSchedule.active eq 'Y'}">
				상영 중
			</c:when>
			<c:otherwise>
				예매 중
			</c:otherwise>
		</c:choose>
	</div>
	<div>
		&nbsp;
		<a href="${pageContext.request.contextPath}/employee/screeningSchedule/modifyScreeningSchedule?scheduleKey=${screeningSchedule.scheduleKey}">
			수정
		</a>
		&nbsp;
		<a href="${pageContext.request.contextPath}/employee/screeningSchedule/removeScreeningSchedule?scheduleKey=${screeningSchedule.scheduleKey}">
			삭제
		</a>
	</div>
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
</body>
</html>