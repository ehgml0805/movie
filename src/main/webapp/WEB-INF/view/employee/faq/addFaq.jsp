<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록</title>
</head>
<body>
	<h2>FAQ 등록</h2>
	<form method="post" action="${pageContext.request.contextPath}/employee/faq/addFaq">
		<div>
			질문 내용 : <input type="text" name="faqQuestion">
		</div>
		<div>
			답변 내용 : <textarea rows="5" cols="100" name="faqAnswer"></textarea>
		</div>
		<button type="submit">FAQ 등록</button>
	</form>
</body>
</html>