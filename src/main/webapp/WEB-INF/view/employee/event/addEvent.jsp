<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addEvent</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addImg').click(function() {
			let flag = true;
			$('.eventImgList').each(function(){
				if($(this).val() == '') {
					flag = false;
				}
			});
			
			if(flag){
				$('#imgSection').append("<div><input class='eventImgList' type='file' name='eventImgList'></div>");
			} else {
				alert('파일이 첨부되지 않은 eventImgList가 존재합니다');
			}
		});
		
		$('#addEvent').click(function(){
			let flag = true;
			if($('#movieKey').val()== '') {
				alert('영화를 선택해주세요');
			} else if($('#eventTitle').val() == '') {
				alert('이벤트 제목을 입력하세요');
			} else if($('#eventContent').val() == '') {
				alert('이벤트 내용을 입력해주세요');
			} else if($('#eventStartDate').val() == '') {
				alert('이벤트 시작날짜를 입력해주세요');
			} else if($('#eventEndDate').val() == '') {
				alert('이벤트 종료날짜를 입력해주세요');
			} else {
				$('.eventImgList').each(function() {
					if($(this).val() == ''){
						flag = false;
					}	
				});
				if(flag) {
					$('#addForm').submit();
				} else {
					alert('이미지가 첨부되지 않은 eventImgList가 존재합니다');
				}
			}
		});
	});
</script>
</head>
<body>
	<h1>이벤트 추가</h1>
	<form id="addForm" method="post" action="${pageContext.request.contextPath}/employee/event/addEvent" enctype="multipart/form-data">	
		<div>
		    영화 선택 :
		    <select name="movieKey" id="movieKey">
		        <option value="">영화 선택</option>
		        <c:forEach var="m" items="${list}">
		            <option value="${m.movieKey}">${m.movieTitle}</option>
		        </c:forEach>
		    </select>
		</div>
		<div>
			이벤트 제목 : <input type="text" name="eventTitle" id="eventTitle">
		</div>
		<div>
			이벤트 내용 : <textarea rows="5" cols="50" name="eventContent" id="eventContent"></textarea>
		</div>
		<div>
			이벤트 시작날짜 : <input type="date" name="eventStartDate" id="eventStartDate">
		</div>
		<div>
			이벤트 종료날짜 : <input type="date" name="eventEndDate" id="eventEndDate">
		</div>
		<div>
			<button type="button" id="addImg">이미지 추가</button>
			<div id="imgSection">
				<!-- 이미지 input 태그가 추가될 영역 -->
			</div>
		</div>
		<div>
			<button type="button" id="addEvent">등록</button>
		</div>
	</form>
</body>
</html>