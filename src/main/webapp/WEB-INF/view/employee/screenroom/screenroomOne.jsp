<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MEET PLAY SHARE, E1I6</title>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 부트스트랩4-->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> <!-- 부트스트랩 JavaScript 파일 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<link rel="shortcut icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
		<link rel="shortcut icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
		<style>
			.screen-seat{
			    border-left: 1px solid rgb(180, 179, 179);
			    border-right: 1px solid rgb(180, 179, 179) ;
			    width: 60%;
			     margin-left: 10%;
			    display: block;
			}
			.seat-wrapper{
			    border: 1px solid rgb(180, 179, 179);
			    border-top: 1px solid white;
			    width: 60%;
			    margin-left: 10%;
			    height: 500px;
			    float:left;
			}
			#seat-layout{
			    width: 90%;
			    height: 500px;
			    position: relative;
			    margin-left: 10%;
			    overflow: auto;
			    cursor: pointer;			
			}
			
			.choice-color {
				background-color: #352461;
				color : red;
			}
		</style>
	</head>
	<body>
		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
		<div class="container w-75">
			<h1 class="mt-5">상영관상세</h1>
			<form id="form">	
				<input type="hidden" name="screenroomKey" value="${screenroomOne.screenroomKey}">
				<div class="d-flex justify-content-end">
					<button class="btn btn-light me-3" type="button" id="modifyBtn">수정</button>
					<button class="btn btn-light" type="button" id="removeBtn">삭제</button>
				</div>
			</form>
			<div id="modify">
				<table class="table">
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
							<td>${screenroomOne.cntSeat}</td>
						</tr>
					</tbody>		
				</table>
			</div>
			<div class="d-flex justify-content-center">
				<div id="seat">좌석 배치도 <button class="border" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;"></button> 공간</div>
			</div>		
			<div class="d-flex justify-content-end">
				<button id="useable" type="button" class="btn btn-light">공간/좌석 만들기</button>
			</div>
			<!-- 좌석 등록 모달 버튼 -->
			<c:if test="${screenroomOne.seatCount eq 0}">
				<button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addSeatModal">좌석 등록</button>
			</c:if>
			<div class="seat seat-view">
			<img src="${pageContext.request.contextPath}/resources2/images/img-theater-screen.png" alt="screen-seat" class="screen-seat" style="margin-left:270px;">
			<div class="seat-wrapper" style="margin-left:270px;">
				<div class="toggle-seat" id="seat-layout">
					<section>
                       	<div id="show-seat" style="margin-top:100px;">
							<c:forEach var="s" items="${seatList}" varStatus="status">
								<c:set var="in" value="${status.index}"/>
								
								<c:set var="exSeat" value="${seatList[in-1].seatNumber}"/>
								<c:set var="seat" value="${s.seatNumber}"/>
								
								<c:set var="exRow" value="${fn:substring(exSeat,0,1)}" />
								<c:set var="row" value="${fn:substring(seat,0,1)}" />
								
								<c:set var="seatNo" value="${s.seatNumber}"/>
								<c:set var = "length" value = "${fn:length(seatNo)}"/>
								<c:set var="seatNumber" value="${fn:substring(seatNo,1,length)}" />
											
								<c:choose>
									<c:when test="${exRow ne row}">
										</div>
											<div class="seatRow-${row}" style="margin-left:50px;">
											<button style="background-color:white; font-size:12px; font-weight:bold; width:20px; height:18px; padding:0; margin:0; display:inline-block;">${row}</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<c:if test="${s.useable eq 'Y'}">
												<button data-useable="Y" data-choice="N" class="choice-seat" id="seat${s.seatKey}" style="background-color:#5D5D5D; font-size:12px;  color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;" value="${s.seatKey}" data-active="${s.active}" data-seat="${s.seatNumber}">${seatNumber}</button>
											</c:if>
											<c:if test="${s.useable eq 'N'}">
												<button class="border useableN" value="${s.seatKey}" data-useable="N" data-choice="N" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px;  padding:0; margin:0; display:inline-block;"></button>
											</c:if>
											<%-- <c:if test="${s.active eq 'Y'}">
												<c:if test="${s.useable eq 'Y'}">
													<button data-useable="Y" data-choice="N" class="choice-seat" id="seat${s.seatKey}" style="background-color:#5D5D5D; font-size:12px;  color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;" value="${s.seatKey}" data-active="${s.active}" data-seat="${s.seatNumber}">${seatNumber}</button>
												</c:if>
												<c:if test="${s.useable eq 'N'}">
													<button class="border useableN" value="${s.seatKey}" data-useable="N" data-choice="N" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px;  padding:0; margin:0; display:inline-block;"></button>
												</c:if>
											</c:if>
											<c:if test="${s.active eq 'N'}">
												<c:if test="${s.useable eq 'Y'}">
													<button data-useable="Y" data-choice="N" class="choice-seat btn btn-secondary p-0" id="seat${s.seatKey}" style="background-color:#5D5D5D; font-size:12px; color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;" value="${s.seatKey}" data-active="${s.active}"  data-seat="${s.seatNumber}" disabled="disabled">X</button>
												</c:if>
												<c:if test="${s.useable eq 'N'}">
													<button class="border useableN" value="${s.seatKey}" data-useable="N" data-choice="N" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;"></button>
												</c:if>
											</c:if> --%>
										</c:when>
										<c:otherwise>
											<c:if test="${s.useable eq 'Y'}">
												<button data-useable="Y" data-choice="N" class="choice-seat" id="seat${s.seatKey}" style="background-color:#5D5D5D; font-size:12px;  color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;" data-active="${s.active}"  data-seat="${s.seatNumber}" value="${s.seatKey}">${seatNumber}</button>
											</c:if>
											<c:if test="${s.useable eq 'N'}">
												<button class="border useableN" value="${s.seatKey}" data-useable="N" data-choice="N" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;"></button>
											</c:if>
											<%-- <c:if test="${s.active eq 'Y'}">
												<c:if test="${s.useable eq 'Y'}">
													<button data-useable="Y" data-choice="N" class="choice-seat" id="seat${s.seatKey}" style="background-color:#5D5D5D; font-size:12px;  color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;" data-active="${s.active}"  data-seat="${s.seatNumber}" value="${s.seatKey}">${seatNumber}</button>
												</c:if>
												<c:if test="${s.useable eq 'N'}">
													<button class="border useableN" value="${s.seatKey}" data-useable="N" data-choice="N" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;"></button>
												</c:if>
											</c:if>				
											<c:if test="${s.active eq 'N'}">
												<c:if test="${s.useable eq 'Y'}">
													<button data-useable="Y" class="choice-seat btn btn-secondary p-0" id="seat${s.seatKey}" style="font-size:12px;  width:20px; height:18px; padding:0; margin:0; display:inline-block;" data-choice="N" data-active="${s.active}"  data-seat="${s.seatNumber}"value="${s.seatKey}" disabled="disabled">X</button>
												</c:if>
												<c:if test="${s.useable eq 'N'}">
													<button class="border useableN" value="${s.seatKey}" data-useable="N" data-choice="N" style="font-size:12px; background-color:#eee; color:white;  width:20px; height:18px; padding:0; margin:0; display:inline-block;"></button>
												</c:if>
											</c:if> --%>				
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</section>	
				</div>
			</div>
		</div>
	</div>
		</div>
		
		<!-- 상영관 등록 모달 -->
		<div class="modal fade" id="addSeatModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">상영관 등록</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath}/employee/seat/addSeat" method="post">
							<input type="hidden" value="${param.screenroomKey}" name="screenroomKey">
							좌석 행 : <input class="form-control" type="number" name="x">
							좌석 열 : <input class="form-control" type="number"name="y">
							<button class="btn btn-light mt-2" type="submit">만들기</button>		
						</form>
					</div>
				</div>
			</div>
		</div>
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
							<table class='table'>
								<thead>
									<tr>
										<th>상영관코드</th>
										<th>상영관명</th>
										<th>좌석수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input class='form-control' type="text" name="screenroomKey" value="${screenroomOne.screenroomKey}" readonly="readonly"></td>
										<td><input class='form-control' type="text" name="screenroomName" value="${screenroomOne.screenroomName}"/></td>
										<td><input class='form-control' type="text" value="${screenroomOne.seatCount}" readonly="readonly"></td>
									</tr>
								</tbody>		
							</table>
							<div><button class='btn btn-secondary' type="button" id="modifyCkBtn">수정완료</button></div>
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
				
				/* 좌석 선택 */
				let seatKey = new Array();
				let useable = new Array();
				
				$('.choice-seat').click(function() {					
					if($(this).attr('data-choice') == 'Y') {
						$(this).css('background-color','#5D5D5D');
						$(this).attr('data-choice', 'N');
						seatKey = seatKey.filter(value => value != $(this).val());
						useable.push('N'); 
					} else {
						$(this).css('background-color','#3F0099');
						$(this).attr('data-choice', 'Y');
						seatKey.push($(this).val());
						useable.push('N');
					}
				});
				
				$('.useableN').click(function() {					
					if($(this).attr('data-choice') == 'Y') {
						$(this).css('background-color','');
						$(this).attr('data-choice', 'N');
						seatKey = seatKey.filter(value => value != $(this).val());
						useable.push('Y');
					} else {
						$(this).css('background-color','#3F0099');
						$(this).attr('data-choice', 'Y');
						seatKey.push($(this).val());
						useable.push('Y');
					}
				});
				
				$('#useable').click(function() {
					if(seatKey == '') {
						alert('좌석을 선택해주세요.')
						return;
					}
					let data = {"seatKey" : seatKey, "useable" : useable};
					$.ajax({
					    type: "POST",
					    url: "${pageContext.request.contextPath}/employee/seat/modifySeat",
					    contentType: 'application/json; charset=utf-8',
					    data: JSON.stringify(data),
					    success: function(response) {
					        alert("공간/좌석 만들기 성공");
					        location.reload();
					    },
					    error: function(e) {
					        console.log(e);
					    }
					});
					
				});
				
				
			})
		</script>
	</body>
</html>