<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스틸컷 수정</title>
</head>
<body>
	<h2>스틸컷 수정</h2>
	<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/employee/stillCut/modifyStillCut">
		<table border="1">
			<tr>
				<td rowspan="6">
					<c:choose>
						<c:when test="${stillCut.fileSize eq 0}">
							<img alt="영화이미지" src="${stillCut.fileName}">
						</c:when>
						<c:otherwise>						
							<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${stillCut.fileName}">
						</c:otherwise>
					</c:choose>
				</td>
				<td>원본 이름 : </td>
				<td>
					<input type="text" name="originName" value="${stillCut.originName}" readonly="readonly">
					<input type="hidden" name="stillCutKey" value="${stillCut.stillCutKey}">
					<input type="hidden" name="movieKey" value="${stillCut.movieKey}">
				</td>
			</tr>
			<tr>
				<td>파일 이름 : </td>
				<td>
					<input type="text" name="fileName" value="${stillCut.fileName}">
				</td>
			</tr>
			<tr>
				<td>파일 타입 : </td>
				<td>
					<input type="text" name="fileType" value="${stillCut.fileType}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>파일 사이즈 : </td>
				<td>
					<input type="number" name="fileSize" value="${stillCut.fileSize}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>이미지 종류 : </td>
				<td>
					<select name="poster">
						<c:choose>
							<c:when test="${stillCut.poster eq 'Y'}">
								<option value="Y">포스터</option>
							</c:when>
							<c:otherwise>
								<option value="N">스틸컷</option>
							</c:otherwise>
						</c:choose>	
						<c:choose>
							<c:when test="${stillCut.poster eq 'Y'}">
								<option value="N">스틸컷</option>
							</c:when>
							<c:otherwise>
								<option value="Y">포스터</option>
							</c:otherwise>
						</c:choose>		
					</select>	
				</td>
			</tr>
			<tr>
				<td>스틸컷 이미지 변경 : </td>
				<td>
					<input type="file" name="image">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>