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

	<h2>상영 스케줄 수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/employee/screeningSchedule/modifyScreeningSchedule">
		<table>
			<tr>
				<td>영화 번호</td>
				<td>
					<input type="number" name="movieKey" value="${screeningSchedule.movieKey}" readonly="readonly">
					<input type="hidden" name="scheduleKey" value="${screeningSchedule.scheduleKey}">
				</td>
			</tr>
			<tr>
				<td>상영관 번호</td>
				<td>
					<input type="number" name="screenroomKey" value="${screeningSchedule.screenroomKey}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>시작 시간 : </td>
				<td>
					<input type="datetime-local" name="startDate" value="${screeningSchedule.startDate}">
				</td>
			</tr>
			<tr>
				<td>종료 시간 : </td>
				<td>
					<input type="datetime-local" name="endDate" value="${screeningSchedule.endDate}">
				</td>
			</tr>
			<tr>
				<td>시사회 여부 : </td>
				<td>
					<select name="preview">
						<c:choose>
							<c:when test="${screeningSchedule.preview eq 'Y'}">
								<option value="Y">시사회</option>
							</c:when>
							<c:otherwise>
								<option value="N">영화 스케줄</option>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${screeningSchedule.preview eq 'Y'}">
								<option value="N">영화 스케줄</option>
							</c:when>
							<c:otherwise>
								<option value="Y">시사회</option>
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격 : </td>
				<td>
					<input type="number" name="price" value="${screeningSchedule.price}">원
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
</body>
</html>