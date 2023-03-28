<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body {
	  font-family: Arial, sans-serif;
	  line-height: 1.6;
	  margin: 50px;
	}
	
	h2 {
	  font-size: 24px;
	  margin-bottom: 20px;
	}
	.form-group {
  		margin-bottom: 20px;
	}

	label {
  		display: block;
  		font-size: 18px;
  		margin-bottom: 5px;
	}
	
	input[type="text"],
	textarea {
  		width: 100%;
  		padding: 12px;
  		font-size: 16px;
  		border: 1px solid #ccc;
  		border-radius: 4px;
  		box-sizing: border-box;
  		resize: vertical;
	}
	.btn {
  		background-color: #999;
  		color: white;
  		padding: 12px 20px;
	  	border: none;
	  	border-radius: 4px;
	  	cursor: pointer;
	  	font-size: 18px;
	  	margin-top: 20px;
	}

	.btn:hover {
  		background-color: #999;
	}
</style>
<meta charset="UTF-8">
<title>FAQ 등록</title>
</head>
<body>
	<h2>FAQ 등록</h2>
	<form class="faq-form" method="post" action="${pageContext.request.contextPath}/employee/faq/addFaq">
		<div class="form-group">
	 		<label for="faqQuestion">질문 내용:</label>
			<input type="text" id="faqQuestion" name="faqQuestion">
		</div>
		<div class="form-group">
			<label for="faqAnswer">답변 내용:</label> 
			<textarea rows="5" cols="100" name="faqAnswer"></textarea>
		</div>
		<button type="submit" class="btn">FAQ 등록</button>
	</form>
</body>
</html>