<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영스케줄</title>
</head>
<body>
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
</body>
</html>