<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 스케줄 등록</title>
</head>
<body>
	<h2>상영 스케줄 등록</h2>
	<form method="post" action="${pageContext.request.contextPath}/employee/screeningSchedule/addScreeningSchedule">
		<table>
			<tr>
				<td>영화 선택</td>
				<td>
					<select name="movieKey">
						<c:forEach var="m" items="${movieList}">
							<option value="${m.movieKey}">${m.movieTitle}</option>
						</c:forEach>						
					</select>
				</td>
			</tr>
			<tr>
				<td>상영관 선택</td>
				<td>
					<select name="screenroomKey">
						<c:forEach var="s" items="${screenroomList}">
							<option value="${s.screenroomKey}">${s.screenroomName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>시작 시간 : </td>
				<td>
					<input type="datetime-local" name="startDate">
				</td>
			</tr>
			<tr>
				<td>종료 시간 : </td>
				<td>
					<input type="datetime-local" name="endDate">
				</td>
			</tr>
			<tr>
				<td>가격 : </td>
				<td>
					<input type="number" name="price">원
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>