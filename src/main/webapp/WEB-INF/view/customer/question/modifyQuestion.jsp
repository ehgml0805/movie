<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>문의사항 수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/customer/question/modifyQuestion">
		<input type="hidden" name="questionKey" value="${questionKey}">
		<table>
			<tr>
				<td>지역 / 극장</td>
				<td>${theaterRegion} / ${theaterName}</td>
			</tr>
			<tr>
				<td>문의유형</td>
				<td>${questionCategory}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="questionTitle" id="questionTitle" value="${questionTitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="questionContent" id="questionContent">${questionContent}</textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>