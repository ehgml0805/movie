<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
</head>
<body>
	<h1>공지사항 등록</h1>
	<form method="post" action="${pageContext.request.contextPath}/employee/notice/addNotice" enctype="multipart/form-data">
		<div>
			제목 : <input type="text" name="noticeTitle">
		</div>
		<div>
			내용 : <textarea rows="5" cols="20" name="noticeContent"></textarea>
		</div>
		<div>
			이미지 : <input type="file" name="img">
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>