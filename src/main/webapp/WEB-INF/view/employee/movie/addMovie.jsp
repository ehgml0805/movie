<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMovie</title>
</head>
<body>
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
</body>
</html>