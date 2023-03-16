<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
</head>
<body>
	<h2>FAQ 수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/employee/faq/modifyFaq">
		<input type="hidden" name="faqKey" value="${faqKey}">
		<div>
			질문 내용 : <input type="text" name="faqQuestion" value="${faqQuestion }">
		</div>
		<div>
			답변 내용 : <textarea rows="5" cols="100" name="faqAnswer">${faqAnswer}</textarea>
		</div>
		<button type="submit">FAQ 수정</button>
	</form>
</body>
</html>