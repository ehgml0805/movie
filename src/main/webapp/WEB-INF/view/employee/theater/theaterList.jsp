<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>theaterList</title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	</head>
	<body>
		<h1>극장 리스트</h1>
		<a href="${pageContext.request.contextPath}/employee/theater/addTheater">극장등록</a>
		<table border="1">
			<thead>
				<tr>
					<th>극장코드</th>
					<th>극장지역</th>
					<th>극장명</th>
					<th>극장주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="t" items="${theaterList}">
					<tr>
						<td>${t.theaterKey}</td>
						<td>${t.theaterRegion}</td>
						<td><a href="${pageContext.request.contextPath}/employee/theater/theaterOne?theaterKey=${t.theaterKey}">${t.theaterName}</a></td>
						<td>${t.theaterAddress}</td>
					</tr>
				</c:forEach>
			</tbody>		
			</table>
		<script>
			$(function(){
				let msg = '${msg}';
				
				if(msg == 'ADD_SUCCESS') {
					alert('등록 성공')
				}
				if(msg == 'ADD_ERROR') {
					alert('등록 실패')
				}
				if(msg == 'REMOVE_SUCCESS') {
					alert('삭제 성공')
				}
				if(msg == 'REMOVE_ERROR') {
					alert('삭제 실패')
				}
			})
		</script>
	</body>
</html>