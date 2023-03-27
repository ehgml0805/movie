<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영스케줄</title>
<!-- employeeHead -->
<c:import url="/WEB-INF/inc/employeeHead.jsp"></c:import>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/home" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="${pageContext.request.contextPath}/employeeHome" class="stext-109 cl8 hov-cl1 trans-04">
				Admin Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				screeningScheduleList
			</span>
		</div>
	</div>
	
		<!-- Content page -->
	<section class="bg0 p-t-70 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg text-center">
						<!-- Main start -->
						<h2>상영스케줄 관리</h2><br>
							<c:forEach var="ss" items="${screeningScheduleList}">
								<div>
									${ss.grade} ${ss.movieTitle}
									<c:choose>
										<c:when test="${ss.active eq 'Y'}">
											상영중
										</c:when>
										<c:otherwise>
											예매중
										</c:otherwise>
									</c:choose>
									${ss.openingdate}
								</div>
								<div>
									2D | ${ss.screenroomName} | 총 ${ss.seatCount}석
								</div>
								<div>
									<a href="${pageContext.request.contextPath}/employee/screeningSchedule/screeningScheduleOne?scheduleKey=${ss.scheduleKey}">
										${ss.startDate}
									</a>
								</div>
								<div>
									&nbsp;
									<a href="${pageContext.request.contextPath}/employee/screeningSchedule/modifyScreeningSchedule?scheduleKey=${ss.scheduleKey}">
										수정
									</a>
									&nbsp;
									<a href="${pageContext.request.contextPath}/employee/screeningSchedule/removeScreeningSchedule?scheduleKey=${ss.scheduleKey}">
										삭제
									</a>
								</div>	
							</c:forEach>
							<div>
								<a href="${pageContext.request.contextPath}/employee/screeningSchedule/addScreeningSchedule">
									상영스케줄 등록
								</a>
							</div>
					<!-- Main End -->
					</div>
				</div>
				
				<!-- 관리자 메뉴 -->
				<c:import url="/WEB-INF/inc/employeeMenu.jsp"></c:import>
				
			</div>
		</div>
	</section>	
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/employeeFooter.jsp"></c:import>
	
	

</body>
</html>