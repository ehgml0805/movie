<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>극장등록</h1>
	<form action="${pageContext.request.contextPath}/employee/theater/addTheater" method="post">
		<table border="1">
			<tr>
				<th>극장명</th>
				<td><input type="text" name="theaterName"></td>
			</tr>
			<tr>
				<th>극장지역</th>
				<td>
					<select name="theaterRegion">
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
				<td><textarea rows="10" cols="50" name="theaterInfo"></textarea></td>
			</tr>
			<tr>
				<th>극장주소</th>
				<td>
					<input type="text" id="postcode" name="postcode" placeholder="우편번호">
					<input type="button" onclick="DaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소">
					<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소">
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소">
					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<th>예매시알림정보</th>
				<td><textarea rows="10" cols="50" name="theaterTicketingInfo"></textarea></td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
	
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