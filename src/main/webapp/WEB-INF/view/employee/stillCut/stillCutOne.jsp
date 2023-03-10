<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스틸컷 상세정보</title>
</head>
<body>
	<h2>스틸컷 상세정보</h2>
	<table border="1">
		<tr>
			<td rowspan="5">
				<c:choose>
					<c:when test="${stillCut.fileSize eq 0}">
						<img alt="영화이미지" src="${stillCut.originName}">
					</c:when>
					<c:otherwise>						
						<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${stillCut.originName}">
					</c:otherwise>
				</c:choose>
			</td>
			<td>원본 이름 : </td>
			<td>${stillCut.originName}</td>
		</tr>
		<tr>
			<td>파일 이름 : </td>
			<td>${stillCut.fileName}</td>
		</tr>
		<tr>
			<td>파일 타입 : </td>
			<td>${stillCut.fileType}</td>
		</tr>
		<tr>
			<td>파일 사이즈 : </td>
			<td>${stillCut.fileSize}</td>
		</tr>
		<tr>
			<td>이미지 종류 : </td>
			<td>
				<c:choose>
					<c:when test="${stillCut.poster eq 'Y'}">
						포스터
					</c:when>
					<c:otherwise>
						스틸컷
					</c:otherwise>
				</c:choose>				
			</td>
		</tr>
	</table>
	<a href="${pageContext.request.contextPath}/employee/stillCut/modifyStillCut?stillCutKey=${stillCut.stillCutKey}">
		수정
	</a>
	<a href="${pageContext.request.contextPath}/employee/stillCut/removeStillCut?stillCutKey=${stillCut.stillCutKey}&movieKey=${movieKey}">
		삭제
	</a>
</body>
</html>