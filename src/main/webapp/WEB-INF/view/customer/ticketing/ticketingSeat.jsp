<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
<body>
	<!-- 제목 -->
	<div class="container" style="width:1250px;">
		<div class="row mb-3">
			<div class="col">
                <h2>빠른 예매</h2>
            </div>
		</div>	
	</div>
	
	<!-- 인원/좌석 선택 -->
	<div class="container">
		<div class="bg-dark" style="text-align:center;"><span class="text-white">인원/좌석</span></div>
		<!-- 인원 선택 / 극장, 시간 정보 -->
		<div class="container d-flex col-1g-12 col-sm-12">
			<!-- 인원 선택 -->
			<div class="col-1g-6 col-sm-6">
				<div class="d-flex">
					<div class="ms-5">
					<span class="me-3">성인</span>
						<div class="btn-group border" role="group" aria-label="Basic example">
							<button type="button" class="btn btn-light btn-adult-down">-</button>
							 <!-- <input type="number" class="adult-quantity w-25 text-center" name="adult-quantity" value="0"/> -->
							<button type="button" class="btn border-left border-right adult-quantity">0</button>
							<button type="button" class="btn btn-light btn-adult-up">+</button>
						</div>
					</div>
					<div class="ms-5">
						<span class="me-3">청소년</span>
						<div class="btn-group border" role="group" aria-label="Basic example">
							<button type="button" class="btn btn-light btn-teenager-down">-</button>
							<!-- <input type="number" class="teenager-quantity w-25 text-center" name="teenager-quantity" value="0"/> -->
							<button type="button" class="btn border-left border-right teenager-quantity">0</button>
							<button type="button" class="btn btn-light btn-teenager-up">+</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 극장, 시간 정보 -->
			<div class="col-1g-6 col-sm-6">
				<div><span id="theater">${scheduleOne.theaterName}</span> | <span id="screenroom">${scheduleOne.screenroomName}</span> | 남은 좌석 <span id="leftSeat" style="color:red;"></span>/<span id="totalSeat">${scheduleOne.seatCount}</span> </div>
				<div class="time">${scheduleOne.date} ${scheduleOne.startDate} ~ ${scheduleOne.endDate}</div>
			</div>
		</div>
		
		<!-- 좌석 선택 -->
		<div class="container seat-view">
			<div class="seat">
				<img src="${pageContext.request.contextPath}/resources/images/btn/img-theater-screen.png" alt="screen-seat" class="screen-seat">
				<div class="seat-wrapper">
					<div class="toggle-seat" id="seat-layout">
						<section>
                        	<div id="show-seat">
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
												<div class="seatRow-${row}"	>
												${row}
												<c:if test="${s.active eq 'Y'}">
													<c:if test="${s.useable eq 'Y'}">
														<button class="choice-seat" id="seat${s.seatKey}" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px;" value="${s.seatKey}" data-active="${s.active}">${seatNumber}</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;">1</button>
													</c:if>
												</c:if>
												<c:if test="${s.active eq 'N'}">
													<c:if test="${s.useable eq 'Y'}">
														<button class="choice-seat btn btn-secondary p-0" id="seat${s.seatKey}" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px;" value="${s.seatKey}" data-active="${s.active}" disabled="disabled">X</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
													</c:if>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${s.active eq 'Y'}">
													<c:if test="${s.useable eq 'Y'}">
														<button class="choice-seat" id="seat${s.seatKey}" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px;" data-active="${s.active}" value="${s.seatKey}">${seatNumber}</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
													</c:if>
												</c:if>				
												<c:if test="${s.active eq 'N'}">
													<c:if test="${s.useable eq 'Y'}">
														<button class="choice-seat btn btn-secondary p-0" id="seat${s.seatKey}" style="postion:absolute; width:30px; height:30px; top:52px; left:106px;" data-active="${s.active}" value="${s.seatKey}" disabled="disabled">X</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
													</c:if>
												</c:if>				
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
	
	<!-- 결제 선택 -->
	<form action="/ticketing/ticketingList" method="post" id="form-post-List">
	   	<input type="hidden" id="day" name="day" value="" />
	   	<input type="hidden" id="movieKey" name="movieKey" value="" />
	   	<input type="hidden" id="theaterKey" name="theaterKey" value="" />
	   	<input type="hidden" id="scheduleKey" name="scheduleKey" value="${scheduleOne.scheduleKey}" />
	   	<input type="hidden" id="ck" name="ck" value="" />
	   	<input type="hidden" id="totalNow" name="totalNow" value="0" />
	   	<input type="hidden" name="showTypeNo" value="" />
	   	<input type="hidden" name="screenNo" value="" />
	   	<input type="hidden" name="regionNo" value="" />
	   	<input type="hidden" name="showScheduleNo" value="" />
	   	
	   	<div class="container d-flex bg-dark" style="color:white;">
		   	<div class="row col-lg-12 col-sm-12">
		   		<div class="movie-img col-lg-3 col-sm-3">
					<div class="choice-list" id="choiceMovieList-0">
						<img id="picture" alt="no-picture" src="${stillCut.fileName}" style="width:120px; height:171px;">
	                    <p id="picture-name">${scheduleOne.movieTitle}</p>
					</div>
				</div>	
				<div class="col-lg-3 col-sm-3">
					<table>
						<tr>
							<td>극장</td>
							<td><span id="theater-name">${scheduleOne.theaterName}</span></td>
						</tr>
						<tr>
							<td>일시</td>
							<td><span id="startday"></span><span id="time">${scheduleOne.startDate}</span></td>
						</tr>
						<tr>
							<td>상영관</td>
							<td><span id="screenroom-name">${scheduleOne.screenroomName}</span></td>
						</tr>
						<tr>
							<td>인원</td>
							<td>
								<span id="adult-count"></span>
								<span id="teenager-count"></span>
							</td>
						</tr>
					</table>
				</div>
				<div class="col-lg-3 col-sm-3">
					<table>
						<tr>
							<td>좌석명</td>
							<td><span id="seatName"></span></td>
						</tr>
						<tr>
							<td>좌석번호</td>
							<td><span id="seatNo"></span></td>
						</tr>
					</table>
				</div>
				<div class="col-lg-3 col-sm-3">
					<table>
						<tr>
							<td>일반</td>
							<td><span id="price"></span></td>
						</tr>
						<tr>
							<td>총금액</td>
							<td><span id="totalPrice"></span></td>
						</tr>
					</table>
				</div>
		   	</div>
		   	<button class="payBtn" type="button" disabled="disabled">결제 선택</button>
	   	</div>
    </form>
</body>
<script>
	$(document).ready(function(){
		// 기본값 설정
		$('#ck').val(0);
		$('#totalNow').val(0);
		alert('ck : ' + ck);
		alert('totalNow : ' + totalNow);
		
		// 상영관 키로 좌석 가져오기
		$('show-seat').append(function(){
			let unUseableSeat = new Array(); // 빈 좌석			
			<c:forEach var="s" items="${seatList}">
				<c:if test="${s.useable eq 'N'}">
					unUseableSeat.push("${s.seatKey}")
				</c:if>
			</c:forEach>
			
			let noActiveSeat = new Array(); // 예약 마감 좌석			
			<c:forEach var="s" items="${seatList}">
				<c:if test="${s.active eq 'N'}">
					noActiveSeat.push("${s.seatKey}")
				</c:if>
			</c:forEach>
			
			let showSeat = $("div#show-seat");
			
		});
		
		// 인원수
		const adultQuantity = document.querySelector('.adult-quantity');
		const teenagerQuantity = document.querySelector('.teenager-quantity');
		// 성인 인원 버튼
		const upBtnAdult = document.querySelector('.btn-adult-up');
		const downBtnAdult = document.querySelector('.btn-adult-down');
		// 청소년 인원 버튼
		const upBtnTeenager = document.querySelector('.btn-teenager-up');
		const downBtnTeenager = document.querySelector('.btn-teenager-down');
		// 총 인원 수 (인원 제한 8명)
		let totalQuantity = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent); 
		// 결제서 인원 수
		let adultCount = document.querySelector('#adult-count');
		let teenagerCount = document.querySelector('#teenager-count');
		
		// 성인 + 버튼
		upBtnAdult.addEventListener('click', function(){
			let q = parseInt(adultQuantity.textContent);
			totalQuantity = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent);
			if(totalQuantity < 8) {
				adultQuantity.textContent = q+1;
				adultCount.textContent = "성인 " + parseInt(adultQuantity.textContent); 
			} else {
				alert('인원선택은 총 8명까지 가능합니다.')
			}
	    });
		// 성인 -버튼
		downBtnAdult.addEventListener('click', function(){
			let q = parseInt(adultQuantity.textContent);
			if(adultQuantity.textContent > 0) {
				adultQuantity.textContent = q-1;	
				adultCount.textContent = "성인 " + parseInt(adultQuantity.textContent);
			}
			if(adultQuantity.textContent == 0) {
				adultCount.textContent = "";
			}
	    });
		
		// 청소년 + 버튼
		upBtnTeenager.addEventListener('click', function(){
			let q = parseInt(teenagerQuantity.textContent);
			totalQuantity = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent);
			if(totalQuantity < 8) {
				teenagerQuantity.textContent = q+1;
				teenagerCount.textContent = "청소년 " + parseInt(teenagerQuantity.textContent);
			} else {
				alert('인원선택은 총 8명까지 가능합니다.')
			}
	    });
		// 청소년 -버튼
		downBtnTeenager.addEventListener('click', function(){
			let q = parseInt(teenagerQuantity.textContent);
			if(teenagerQuantity.textContent > 0) {
				teenagerQuantity.textContent = q-1;
				teenagerCount.textContent = "청소년 " + parseInt(teenagerQuantity.textContent);
			}
			if(teenagerQuantity.textContent == 0) {
				teenagerCount.textContent = "";
			}
			
	    });
		
		// 좌석에 마우스를 올릴 시
		$('.choice-seat').hover(function() {
			let totalNow = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent);		
			if(totalNow != 0 && totalNow >= 2){
				$(this).css('background-color','red');
				
				let parent = $(this).parent();
				let lastButton = parent.children().last();
				// alert(lastButton);
				if($(this).val() == lastButton.val()){ // 행의 마지막 버튼이라면
					let button2 = $(this).prev(); // 해당 버튼 기준 왼쪽 버튼
					
					if (button2.attr('data-active') == 'Y') { // 예매 안된 좌석
						button2.css('background-color','red');
					} else { 								  // 예매된 좌석
						button2.css('background-color','');
					}
				} else if($(this).val() != lastButton.val()) { // 행의 마지막 버튼이 아니라면
					let button2 = $(this).next();
					let prevBtn = $(this).prev();
					if (button2.attr('data-active') == 'Y') { // 예매 안된 좌석
						button2.css('background-color','red');
					} else {								  // 예매된 좌석
						prevBtn.css('background-color','red');
					}
				}				
			} else if(totalNow != 0) {
				$(this).css('background-color','red');
			}
		}, function(){
			let totalNow = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent);		
			if(totalNow != 0 && totalNow >= 2){
				$(this).css('background-color','white');
				
				let parent = $(this).parent();
				let lastButton = parent.children().last();
				// alert(lastButton);
				if($(this).val() == lastButton.val()){ // 행의 마지막 버튼이라면
					let button2 = $(this).prev();
				
					if (button2.attr('data-active') == 'Y') { // 예매 안된 좌석
						button2.css('background-color','white');	
					} else {								  // 예매 된 좌석
						button2.css('background-color','');
					}
				} else if($(this).val() != lastButton.val()) { // 행의 마지막 버튼이 아니라면			
					let button2 = $(this).next();
					let prevBtn = $(this).prev();
				
					if (button2.attr('data-active') == 'Y') { // 예매 안된 좌석
						button2.css('background-color','white');
					} else {								  // 예매 된 좌석
						button2.css('background-color','');
						prevBtn.css('background-color','white');
					}
				}				
			} else if(totalNow != 0) {
				$(this).css('background-color','white');
			}
		});
		
		// 좌석 선택 시
		$(document).on('click', '.choice-seat', function() {
			
			if($('#ck').val() == 1){
				alert('좌석 선택이 완료되었습니다.');
			} else (
					// 좌석 키 값 저장, 선택된 좌석 위치 색상 바꿔주기
					
					// 총 인원 수 값 가져오기
					let totalNow = $('#totalNow').val();
					
					if(totalNow != 0 && totalNow >= 2){
						// 총 인원수에서 선택된 인원 수 빼주기
						totalNow = totalNow-2
						
						// 좌석 키 값 저장
						let seatKey = [];
						seatKey.push($(this).val());
						
						// 좌석 색깔 바꿔주기
						$(this).css('background-color','red');
						
						// 행의 마지막 버튼 불러오기
						let parent = $(this).parent();
						let lastButton = parent.children().last();
						// alert(lastButton);
						
						if($(this).val() == lastButton.val()){
							let button2 = $(this).prev();
							
							// 좌석 색깔 바꿔주기
							button2.css('background-color','red');
							
							// 좌석 키 값 저장
							seatKey.push(button2.val());
							
						} else if($(this).val() != lastButton.val()) {				
							let button2 = $(this).next();
							
							// 좌석 색깔 바꿔주기
							button2.css('background-color','red');
							
							// 좌석 키 값 저장
							seatKey.push(button2.val());
						}				
					} else if(totalNow != 0) {
						// 총 인원수에서 선택된 인원 수 빼주기
						totalNow = totalNow-1
						
						// 좌석 색깔 바꿔주기
						$(this).css('background-color','red');
						
						// 좌석 키 값 저장
						seatKey.push($(this).val());
						
						$('#ck').val(1);
						if($('#ck').val() == 1){
							$('.payBtn').attr("disabled", false);
						}
					}
					
					// 가격 출력
			)
		});
	});
</script>
</html>