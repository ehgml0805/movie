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
	</head>
	<body>
		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
		<div class="container w-75">
			<h1 class="mt-5">극장상세</h1>
			<form id="form" class="d-flex justify-content-end">	
				<button class="btn btn-light me-3" type="button" id="modifyBtn">수정</button>
				<input class="form-control" type="hidden" name="theaterKey" value="${theaterOne.theaterKey}">
				<button class="btn btn-light" type="button" id="removeBtn">삭제</button>
			</form>
			<a class="btn btn-light" href="${pageContext.request.contextPath}/employee/screenroom/addScreenroom?theaterKey=${theaterOne.theaterKey}">상영관 등록</a>
			<div id="modify">
				<table class="table">
					<thead>
						<tr>
							<th>극장코드</th>
							<th>극장지역</th>
							<th>극장명</th>
							<th>극장주소</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${theaterOne.theaterKey}</td>
							<td>${theaterOne.theaterRegion}</td>
							<td>${theaterOne.theaterName}</td>
							<td>${theaterOne.theaterAddress}</td>
						</tr>
					</tbody>		
				</table>
				<h1 class="my-4">극장정보</h1>
				<div>${theaterOne.theaterInfo}</div>
				<div>${theaterOne.theaterTicketingInfo}</div>
			</div>
			<br/>
			<h1 class="my-4">상영관 목록</h1>
			<!-- 상영관 등록 모달 버튼 -->
			<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addTheaterModal">상영관 등록</button>
			<table class="table">
				<thead>
					<tr>
						<th>상영관코드</th>
						<th>상영관명</th>
						<th>좌석수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="s" items="${screenroomList}">
						<tr>
							<td>${s.screenroomKey}</td>
							<td><a href="${pageContext.request.contextPath}/employee/screenroom/screenroomOne?screenroomKey=${s.screenroomKey}">${s.screenroomName}</a></td>
							<td>${s.cntSeat}</td>
						</tr>
					</c:forEach>
				</tbody>		
			</table>
		</div>
		
		<!-- 상영관 등록 모달 -->
		<div class="modal fade" id="addTheaterModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">상영관 등록</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath}/employee/screenroom/addScreenroom" method="post">
							<input type="hidden" name="theaterKey" value="${theaterOne.theaterKey}">
							<table class="table">
								<tr>
									<th>상영관명</th>
									<td><input class="form-control" type="text" name="screenroomName"></td>
								</tr>
							</table>
							<button class="btn btn-light" type="submit">등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	
		<script>
			$(function() {
				let msg = '${msg}';
				if(msg == 'ADD_SUCCESS') {
					alert('등록 성공')
				}
				if(msg == 'ADD_ERROR') {
					alert('등록 실패')
				}
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
					alert('해당 극장의 상영관과 문의사항이 존재합니다.')
				}
				
				$('#modifyBtn').click(function() {
					let html = `
						<form id="modifyForm">
							<table border="1">
								<thead>
									<tr>
										<th>극장코드</th>
										<th>극장명</th>
										<th>극장주소</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" name="theaterKey" value="${theaterOne.theaterKey}" readonly="readonly"></td>
										<td><input type="text" name="theaterName" value="${theaterOne.theaterName}"/></td>
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
								</tbody>		
							</table>
							<div>극장정보</div>
							<div><textarea rows="10" cols="50" name="theaterInfo">${theaterOne.theaterInfo}</textarea></div>
							<div>예매시알림정보</div>
							<div><textarea rows="10" cols="50" name="theaterTicketingInfo">${theaterOne.theaterTicketingInfo}</textarea></div>
							<div><button type="button" id="modifyCkBtn">수정완료</button></div>
						</form>
					`
					
					$('#modify').html(html);
				});
				
				$(document).on('click', '#modifyCkBtn', function() {
					if(confirm('수정하시겠습니까?')){
						$('#modifyForm').attr('action', '${pageContext.request.contextPath}/employee/theater/modifyTheater');
						$('#modifyForm').attr('method', 'post');
						$('#modifyForm').submit();
					}
				})
				
				$('#removeBtn').click(function() {
					if(confirm('정말 삭제하시겠습니까?')){
						$('#form').attr('action', '${pageContext.request.contextPath}/employee/theater/removeTheater');
						$('#form').attr('method', 'GET');
						$('#form').submit();			
					}
				});
			})
		</script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!-- 다음 주소 API -->
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