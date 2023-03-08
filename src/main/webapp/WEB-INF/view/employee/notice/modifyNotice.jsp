<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
</head>
<body>
	<h1>공지사항 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/employee/notice/modifyNotice?noticeKey=${noticeKey}">
		<div>
			제목 : <input type="text" name="newTitle" value="${noticeTitle}">
		</div>
		<div>
			내용 : <textarea rows="5" cols="20" name="newContent">${noticeContent}</textarea>
		</div>
		<button type="submit">수정완료</button>
	</form>
</body>
</html>