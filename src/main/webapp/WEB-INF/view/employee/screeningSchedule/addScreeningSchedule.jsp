<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상영 스케줄 등록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h2>상영 스케줄 등록</h2>
	<form method="post" action="${pageContext.request.contextPath}/employee/screeningSchedule/addScreeningSchedule">
		<table>
			<tr>
				<td>영화 선택</td>
				<td>
					<select name="movieKey">
						<c:forEach var="m" items="${movieList}">
							<option value="${m.movieKey}">${m.movieTitle}</option>
						</c:forEach>						
					</select>
				</td>
			</tr>
			<tr>
				<td>극장 선택</td>
				<td>
					<select id="theaterList" name="theaterList">
						<c:forEach var="t" items="${theaterList}">
							<option class="theaterKeyOption" value="${t.theaterKey}">${t.theaterRegion} ${t.theaterName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>상영관 선택</td>
				<td>
					<select id="screenroomKey" name="screenroomKey">
					</select>
				</td>
			</tr>
			<tr>
				<td>시작 시간 : </td>
				<td>
					<input type="datetime-local" name="startDate">
				</td>
			</tr>
			<tr>
				<td>종료 시간 : </td>
				<td>
					<input type="datetime-local" name="endDate">
				</td>
			</tr>
			<tr>
				<td>시사회 여부 : </td>
				<td>
					<select name="preview">
						<option value="N">일반 상영</option>
						<option value="Y">시사회</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격 : </td>
				<td>
					<input type="number" name="price">원
				</td>
			</tr>
		</table>
		<input type="hidden" name="theaterKey" id="theaterKey" value="0">
		<button type="submit">등록</button>
	</form>
</body>
<script>
	$(function(){
		$(document).ready(function(){
			$('#theaterKey').val($('#theaterList option:selected').val());
			let theaterKey = $('#theaterKey').val();
			$.ajax({
				url:'${pageContext.request.contextPath}/screenroom/screenroomList',
				type : "GET",
				data: {
					theaterKey: theaterKey
				},
				dataType: 'json',		
				success:function(data){
					// alert('성공');
					var html = '';
					for(let i=0; i<data.length; i++){
						html += '<option value='
						html += data[i].screenroomKey+'>'+data[i].screenroomName
						html += '</option>'
					}
					$('#screenroomKey').html(html);
				},
				error:function(error){
					alert("에러");
				}
			});
		});
		
		// ajax로 지역 선택시 극장 출력/ 극장 선택시 상영관 출력 되게 수정
		$(document).on('change', '#theaterList', function(){
			// input에 저장해주기
			$('#theaterKey').val($(this).val());
			
			let theaterKey = $('#theaterKey').val();
			
			$.ajax({
				url:'${pageContext.request.contextPath}/screenroom/screenroomList',
				type : "GET",
				data: {
					theaterKey: theaterKey
				},
				dataType: 'json',		
				success:function(data){
					// alert('성공');
					var html = '';
					for(let i=0; i<data.length; i++){
						html += '<option value='
						html += data[i].screenroomKey+'>'+data[i].screenroomName
						html += '</option>'
					}
					$('#screenroomKey').html(html);
				},
				error:function(error){
					alert("에러");
				}
			});
		});
	});
</script>
</html>