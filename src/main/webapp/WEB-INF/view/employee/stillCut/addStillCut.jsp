<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스틸컷 추가등록</title>
</head>
<body>
	<h2>스틸컷 추가등록</h2>
	
	<form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/employee/stillCut/addStillCut">
		<table border="1">
			<tr>
				<td>영화 번호 : </td>
				<td>
					<input type="number" name="movieKey" value="${movieKey}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>스틸컷 이미지 : </td>
				<td>
					<input type="file" name="files" multiple>
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>