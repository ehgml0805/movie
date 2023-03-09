<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영스케줄 수정</title>
</head>
<body>
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
</body>
</html>