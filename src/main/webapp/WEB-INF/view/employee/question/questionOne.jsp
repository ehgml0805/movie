<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>문의사항</h2>
	<table border="1">
		<tr>
			<td>지역/극장</td>
			<td>${map.theaterRegion} / ${map.theaterName}</td>
		</tr>
		<tr>
			<td>문의유형</td>
			<td>${map.questionCategory}</td>
		</tr>
		<tr>
			<td>고객아이디</td>
			<td>${map.customerId}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${map.questionTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${map.questionContent}</td>
		</tr>
		<!-- 답변 있을 때 -->
		<c:if test="${map.questionAnswer != null}">
			<tr>
				<td colspan="2">
					답변내용 ${map.createdate}
					<a href="${pageContext.request.contextPath}/employee/question/removeQuestionAnswer?questionKey=${map.questionKey}">삭제</a>
				</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>${map.questionAnswer}</td>
			</tr>
		</c:if>
	</table>
	<!-- 답변 없을 때 답변입력 폼-->
	<c:if test="${map.questionAnswer == null}">
		<h3>답변</h3>
		<form method="post" action="${pageContext.request.contextPath}/employee/question/addQuestionAnswer">
			<input type="hidden" name="questionKey" value="${map.questionKey}">
			<div>
				답변: <textarea rows="5" cols="20" name="questionAnswer"></textarea>
			</div>
			<button type="submit">입력</button>
		</form>
	</c:if>
	
	
</body>
</html>