<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이벤트 추가</h1>
	<form method="post" action="${pageContext.request.contextPath}/employee/event/addEvent" enctype="multipart/form-data">
		<input type="hidden" name="movieKey" value="">
		<div>
			이벤트 제목 : <input type="text" name="eventTitle">
		</div>
		<div>
			이벤트 내용 : <textarea rows="5" cols="50" name="eventContent"></textarea>
		</div>
		<div>
			이미지 : <input type="file" name="eventImgList" multiple="multiple">
		</div>
		<div>
			이벤트 시작날짜 : <input type="date" name="eventStartDate">
		</div>
		<div>
			이벤트 종료날짜 : <input type="date" name="eventEndDate">
		</div>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>