<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 부트스트랩4-->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> <!-- 부트스트랩 JavaScript 파일 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<title>MEET PLAY SHARE, E1I6</title>
	</head>
	<body>
		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
		<div class="container w-75">
			<h1>극장등록</h1>
			<form action="${pageContext.request.contextPath}/employee/theater/addTheater" method="post">
				<table class="table">
					<tr>
						<th>극장명</th>
						<td><input class="form-control" type="text" name="theaterName"></td>
					</tr>
					<tr>
						<th>극장지역</th>
						<td>
							<select class="form-control" name="theaterRegion">
							    <option value="서울">서울</option>
							    <option value="경기">경기</option>
							    <option value="인천">인천</option>
							    <option value="대전/충청/세종">대전/충청/세종</option>
							    <option value="부산/대구/경상">부산/대구/경상</option>
							    <option value="광주/전라">광주/전라</option>
							    <option value="강원">강원</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>극장정보</th>
						<td><textarea class="form-control" rows="10" cols="50" name="theaterInfo"></textarea></td>
					</tr>
					<tr>
						<th>극장주소</th>
						<td>
							<input class="form-control" type="text" id="postcode" name="postcode" placeholder="우편번호">
							<input class="form-control" type="button" onclick="DaumPostcode()" value="우편번호 찾기">
							<br>
							<input class="form-control" type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
							<input class="form-control" type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
							<input class="form-control" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
							<input class="form-control" type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
						</td>
					</tr>
					<tr>
						<th>예매시알림정보</th>
						<td><textarea class="form-control" rows="10" cols="50" name="theaterTicketingInfo"></textarea></td>
					</tr>
				</table>
				<div class="d-grid gap-2">
					<button class="btn btn-secondary" type="submit">등록</button>
				</div>
			</form>
		</div>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function DaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var roadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 참고 항목 변수
	
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName : data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraRoadAddr !== '') {
									extraRoadAddr = ' (' + extraRoadAddr + ')';
								}
	
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('postcode').value = '(' + data.zonecode + ')';
								document.getElementById("roadAddress").value = roadAddr;
								document.getElementById("jibunAddress").value = data.jibunAddress;
	
								// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
								if (roadAddr !== '') {
									document.getElementById("extraAddress").value = extraRoadAddr;
								} else {
									document.getElementById("extraAddress").value = '';
								}
							}
						}).open();
			}
		</script>
	</body>
</html>