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

	<h1>영화 추가</h1>
	<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/employee/movie/addMovie" method="post">
		<table border="1">
			<tr>
				<td>영화 이름 : </td>
				<td>
					<input type="text" name="movieTitle">
				</td>
			</tr>
			<tr>
				<td>영화 정보 : </td>
				<td>
					<textarea name="movieInfo" rows="10" cols="150"></textarea>
				</td>
			</tr>
			<tr>
				<td>영화 줄거리 : </td>
				<td>
					<textarea name="movieSummary" rows="20" cols="150"></textarea>
				</td>
			</tr>
			<tr>
				<td>영화 등급 : </td>
				<td>
					<select name="grade">
						<option value="ALL">전체관람가</option>
						<option value="12">12세이상관람가</option>
						<option value="15">15세이상관람가</option>
						<option value="18">청소년관람불가</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>개봉 일자 : </td>
				<td>
					<input type="date" name="openingdate">
				</td>
			</tr>
			<tr>
				<td>포스터 이미지 : </td>
				<td>
					<input type="file" name="poster">
				</td>
			</tr>
			<tr>
				<td>스틸컷 이미지 : </td>
				<td>
					<input type="file" name="stillCut" multiple>
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
</body>
</html>