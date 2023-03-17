<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	</head>
	<body>
		<h1>상영관상세</h1>
		<form id="form">	
			<input type="hidden" name="screenroomKey" value="${screenroomOne.screenroomKey}">
			<button type="button" id="modifyBtn">수정</button>
			<button type="button" id="removeBtn">삭제</button>
		</form>
		<a href="${pageContext.request.contextPath}/employee/seat/addSeat?screenroomKey=${screenroomOne.screenroomKey}">좌석 등록</a>
		<div id="modify">
			<table border="1">
				<thead>
					<tr>
						<th>상영관코드</th>
						<th>상영관명</th>
						<th>좌석수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${screenroomOne.screenroomKey}</td>
						<td>${screenroomOne.screenroomName}</td>
						<td>${screenroomOne.seatCount}</td>
					</tr>
				</tbody>		
			</table>
		</div>
		<div id="seat">좌석 배치도</div>
		<c:forEach var="s" items="${seatList}">
			<div>${s.seatNumber}</div>
		</c:forEach>
		<script>
			$(function() {
				let msg = '${msg}';
				
				if(msg == 'MODIFY_SUCCESS') {
					alert('수정 성공')
				}
				if(msg == 'MODIFY_ERROR') {
					alert('수정 실패')
				}
				if(msg == 'REMOVE_SUCCESS') {
					alert('삭제 성공')
				}
				if(msg == 'REMOVE_ERROR') {
					alert('삭제 실패')
				}
				if(msg == 'REMOVE_DUP') {
					alert('해당 상영관의 좌석과 상영 스케줄이 존재합니다.')
				}
				
				$('#modifyBtn').click(function() {
					let html = `
						<form id="modifyForm">
							<table border="1">
								<thead>
									<tr>
										<th>상영관코드</th>
										<th>상영관명</th>
										<th>좌석수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" name="screenroomKey" value="${screenroomOne.screenroomKey}" readonly="readonly"></td>
										<td><input type="text" name="screenroomName" value="${screenroomOne.screenroomName}"/></td>
										<td><input type="text" value="${screenroomOne.seatCount}" readonly="readonly"></td>
									</tr>
								</tbody>		
							</table>
							<div><button type="button" id="modifyCkBtn">수정완료</button></div>
						</form>
					`
					
					$('#modify').html(html);
				});
				
				$(document).on('click', '#modifyCkBtn', function() {
					if(confirm('수정하시겠습니까?')){
						$('#modifyForm').attr('action', '${pageContext.request.contextPath}/employee/screenroom/modifyScreenroom');
						$('#modifyForm').attr('method', 'post');
						$('#modifyForm').submit();
					}
				})
				
				$('#removeBtn').click(function() {
					if(confirm('정말 삭제하시겠습니까?')){
						$('#form').attr('action', '${pageContext.request.contextPath}/employee/screenroom/removeScreenroom');
						$('#form').attr('method', 'GET');
						$('#form').submit();			
					}
				});
			})
		</script>
	</body>
</html>