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
														<button data-useable="Y" class="choice-seat" id="seat${s.seatKey}" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px;" value="${s.seatKey}" data-active="${s.active}" data-seat="${s.seatNumber}">${seatNumber}</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button data-useable="N" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
													</c:if>
												</c:if>
												<c:if test="${s.active eq 'N'}">
													<c:if test="${s.useable eq 'Y'}">
														<button data-useable="Y" class="choice-seat btn btn-secondary p-0" id="seat${s.seatKey}" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px;" value="${s.seatKey}" data-active="${s.active}"  data-seat="${s.seatNumber}" disabled="disabled">X</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button data-useable="N" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
													</c:if>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${s.active eq 'Y'}">
													<c:if test="${s.useable eq 'Y'}">
														<button data-useable="Y" class="choice-seat" id="seat${s.seatKey}" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px;" data-active="${s.active}"  data-seat="${s.seatNumber}" value="${s.seatKey}">${seatNumber}</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button data-useable="N" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
													</c:if>
												</c:if>				
												<c:if test="${s.active eq 'N'}">
													<c:if test="${s.useable eq 'Y'}">
														<button data-useable="Y" class="choice-seat btn btn-secondary p-0" id="seat${s.seatKey}" style="postion:absolute; width:30px; height:30px; top:52px; left:106px;" data-active="${s.active}"  data-seat="${s.seatNumber}"value="${s.seatKey}" disabled="disabled">X</button>
													</c:if>
													<c:if test="${s.useable eq 'N'}">
														<button data-useable="N" style="background-color:white; postion:absolute; width:30px; height:30px; top:52px; left:106px; visibility: hidden;"></button>
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
	<form action="${pageContext.request.contextPath}/ticketing/ticketingPay" method="get" id="form-post-List">
	   	<input type="hidden" id="seatKey" name="seatKey" value="" />
	   	<input type="hidden" id="movieKey" name="movieKey" value="${scheduleOne.movieKey}" />
	   	<input type="hidden" id="theaterKey" name="theaterKey" value="" />
	   	<input type="hidden" id="scheduleKey" name="scheduleKey" value="${scheduleOne.scheduleKey}" />
	   	<input type="hidden" id="ck" name="ck" value="" />
	   	<input type="hidden" id="totalNow" name="totalNow" value="0" />
	   	<input type="hidden" id="seatNumber" name="seatNumber" value=""> 
	   	<input type="hidden" name="showTypeNo" value="" />
	   	<input type="hidden" name="screenNo" value="" />
	   	<input type="hidden" name="regionNo" value="" />
	   	<input type="hidden" name="showScheduleNo" value="" />
	   	<input type="hidden" id="i" value="" />
	   	
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
		   	<button class="payBtn" type="submit" disabled="disabled">결제 선택</button>
	   	</div>
    </form>
</body>
<script>
	$(function(){
		$(document).ready(function(){
			// 기본값 설정
			$('#ck').val(0);
			$('#totalNow').val(0);
			
			var totalNow = $('#totalNow').val();
			/* var seatKey = new Array(0); */
		});
		
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
			// 결제 선택 안되게 ck 값 없애주기
			$('#ck').val(0);
			$('.payBtn').attr("disabled", true);
			
			let q = parseInt(adultQuantity.textContent);
			totalQuantity = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent);
			if(totalQuantity < 8) {
				adultQuantity.textContent = q+1;
				adultCount.textContent = "성인 " + parseInt(adultQuantity.textContent); 
				$('#totalNow').val(parseInt($('#totalNow').val())+1);
			} else {
				alert('인원선택은 총 8명까지 가능합니다.')
			}
	    });
		// 성인 - 버튼
		downBtnAdult.addEventListener('click', function(){
			// 선택한 좌석 개수가 현재 인원(성인+청소년)보다 크거나 같다면 모두 취소 
	         if($('#seatKey').val() != '') {
	            const seatArr = $('#seatKey').val().split(',');
	            
	            if(seatArr.length >= parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent)) {
	               const result = window.confirm("선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?");
	               if(result) {
	                  location.reload();
	               } else {
	                  return;
	               }                           
	            }
	         }
			
			let q = parseInt(adultQuantity.textContent);
			if(adultQuantity.textContent > 0) {
				adultQuantity.textContent = q-1;	
				adultCount.textContent = "성인 " + parseInt(adultQuantity.textContent);
				$('#totalNow').val(parseInt($('#totalNow').val())-1);
			}
			if(adultQuantity.textContent == 0) {
				adultCount.textContent = "";
			}
	    });
		
		// 청소년 + 버튼
		upBtnTeenager.addEventListener('click', function(){
			// 결제 선택 안되게 ck 값 없애주기
			$('#ck').val(0);
			$('.payBtn').attr("disabled", true);
			
			let q = parseInt(teenagerQuantity.textContent);
			totalQuantity = parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent);
			if(totalQuantity < 8) {
				teenagerQuantity.textContent = q+1;
				teenagerCount.textContent = "청소년 " + parseInt(teenagerQuantity.textContent);
				$('#totalNow').val(parseInt($('#totalNow').val())+1);
			} else {
				alert('인원선택은 총 8명까지 가능합니다.')
			}
	    });
		// 청소년 - 버튼
		downBtnTeenager.addEventListener('click', function(){
			// 선택한 좌석 개수가 현재 인원(성인+청소년)보다 크거나 같다면 모두 취소 
	         if($('#seatKey').val() != '') {
	            const seatArr = $('#seatKey').val().split(',');
	            
	            if(seatArr.length >= parseInt(adultQuantity.textContent) + parseInt(teenagerQuantity.textContent)) {
	               const result = window.confirm("선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?");
	               if(result) {
	                  location.reload();
	               } else {
	                  return;
	               }                           
	            }
	         }
			
			let q = parseInt(teenagerQuantity.textContent);
			if(teenagerQuantity.textContent > 0) {
				teenagerQuantity.textContent = q-1;
				teenagerCount.textContent = "청소년 " + parseInt(teenagerQuantity.textContent);
				$('#totalNow').val(parseInt($('#totalNow').val())-1);
			}
			if(teenagerQuantity.textContent == 0) {
				teenagerCount.textContent = "";
			}
			
	    });
		
		// 좌석에 마우스를 올릴 시
		$('.choice-seat').hover(function() {
			totalNow = $('#totalNow').val();
			if($(this).hasClass('active') == false && $(this).attr('data-active') == 'Y' && $(this).attr('data-useable') == 'Y'){ //버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
				if(totalNow >= 2){
					$(this).css('background-color','red');
					
					let nextBtn = $(this).next();
					let prevBtn = $(this).prev();
					if (nextBtn.hasClass('active') == false && nextBtn.attr('data-active') == 'Y' && nextBtn.attr('data-useable') == 'Y') {	// 옆 버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
						nextBtn.css('background-color','red');								
					} else if(prevBtn.hasClass('active') == false && prevBtn.attr('data-active') == 'Y' && prevBtn.attr('data-useable') == 'Y') {	 // 앞 버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
						prevBtn.css('background-color','red');
					}			
				} else if(totalNow == 1) {
					$(this).css('background-color','red');
				}
			}	
		}, function(){ // 좌석에 마우스 땔 때
			totalNow = $('#totalNow').val();
			
			if($(this).hasClass('active') == false && $(this).attr('data-active') == 'Y' && $(this).attr('data-useable') == 'Y'){ //버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
				if(totalNow >= 2){
					$(this).css('background-color','white');
						
					let nextBtn = $(this).next();
					let prevBtn = $(this).prev();
					if (nextBtn.hasClass('active') == false && nextBtn.attr('data-active') == 'Y' && nextBtn.attr('data-useable') == 'Y') {	// 옆 버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
						nextBtn.css('background-color','white');								
					} else if(prevBtn.hasClass('active') == false && prevBtn.attr('data-active') == 'Y' && prevBtn.attr('data-useable') == 'Y') {	 // 앞 버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
						prevBtn.css('background-color','white');
					}				
				} else if(totalNow == 1) {
					$(this).css('background-color','white');
				}
			}
		});
		
		var seatKey = new Array();
		var seatNumber = new Array();
		// 좌석 선택 시
		$(document).on('click', '.choice-seat', function() {
			if($(this).hasClass('active') == false && $(this).attr('data-active') == 'Y' && $(this).attr('data-useable') == 'Y'){
				if($('#ck').val() == 1){
					alert('좌석 선택이 완료되었습니다.');
				} else {
						/* 좌석 키 값 저장, 선택된 좌석 위치 색상 바꿔주기 */
						
						// 총 인원 수 값 가져오기
						totalNow = $('#totalNow').val();
						
						if(totalNow == 0){
							alert('인원을 선택해주세요.');
						} else if (totalNow >= 2){		
							
							// 좌석 키 값 저장
							seatKey.push($(this).val());
							
							// 좌석 색깔 바꿔주기
							$(this).css('background-color','red');
							
							// 좌석 클래스 active로 설정
							$(this).addClass("active");
							
							// 좌석번호 저장
							seatNumber.push($(this).attr('data-seat'));
							
							// 총 인원수에서 선택된 인원 수 빼주기
							$('#totalNow').val(parseInt($('#totalNow').val())-1);
							totalNow = parseInt(totalNow) - 1;
							
							let nextBtn = $(this).next();
							let prevBtn = $(this).prev();
							
							if (nextBtn.hasClass('active') == false && nextBtn.attr('data-active') == 'Y' && nextBtn.attr('data-useable') == 'Y') {	// 옆 버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족
								// 좌석 색깔 바꿔주기
								nextBtn.css('background-color','red');
								
								// 좌석 키 값 저장
								seatKey.push(nextBtn.val());	
								
								// 좌석 클래스 active로 설정
								nextBtn.addClass("active");
								
								// 좌석번호 저장
								seatNumber.push(nextBtn.attr('data-seat'));	
								
								// 총 인원수에서 선택된 인원 수 빼주기
								$('#totalNow').val(parseInt($('#totalNow').val())-1);
								totalNow = parseInt(totalNow) - 1;
								
							} else if(prevBtn.hasClass('active') == false && prevBtn.attr('data-active') == 'Y' && prevBtn.attr('data-useable') == 'Y') {	 // 앞 버튼이 모든 조건(예매 안되고 사용가능한 좌석이고 선택 안 된 좌석) 만족							
								// 좌석 색깔 바꿔주기
								prevBtn.css('background-color','red');
								
								// 좌석 키 값 저장
								seatKey.push(prevBtn.val());
								
								// 좌석 클래스 active로 설정
								prevBtn.addClass("active");
								
								// 좌석번호 저장
								seatNumber.push(prevBtn.attr('data-seat'));
								
								// 총 인원수에서 선택된 인원 수 빼주기
								$('#totalNow').val(parseInt($('#totalNow').val())-1);
								totalNow = parseInt(totalNow) - 1;						
							}																
							
							if(totalNow == 0){
								$('#ck').val(1);
								if($('#ck').val() == 1){
									$('.payBtn').attr("disabled", false);
								}
							}
						} else if(totalNow == 1) {
							// 총 인원수에서 선택된 인원 수 빼주기
							$('#totalNow').val(parseInt($('#totalNow').val())-1);
							totalNow = parseInt(totalNow) - 1;
							
							// 좌석 색깔 바꿔주기
							$(this).css('background-color','red');
							
							// 좌석 클래스 active로 설정
							$(this).addClass("active");
							
							// 좌석 키 값 저장
							seatKey.push($(this).val());
							
							// 좌석번호 저장
							seatNumber.push($(this).attr('data-seat'));
							
							$('#ck').val(1);
							if($('#ck').val() == 1){
								$('.payBtn').attr("disabled", false);
							}
						}
						
						$('#seatKey').val(seatKey);
						// alert(seatKey);
						$('#seatNumber').val(seatNumber);
						// 가격 출력
				}
			} else if($(this).hasClass('active') == true) {
				/* 좌석 선택 취소 */
				alert('지정한 좌석 선택을 취소하였습니다.');
				// active 클래스를 없애주기
				
				// 결제 선택 안되게 ck 값 없애주기
				$('#ck').val(0);
				$('.payBtn').attr("disabled", true);
				
				// 총 인원 수 값 가져오기
				totalNow = $('#totalNow').val();
				// alert('totalNow : ' + totalNow);
				
				// 총 인원수에서 선택된 인원 수 더해주기
				$('#totalNow').val(parseInt($('#totalNow').val()) + 1);
				totalNow = parseInt(totalNow) + 1;
				// alert('totalNow : ' + totalNow);
				
				// 좌석 색깔 바꿔주기
				$(this).css('background-color','white');
				
				// 좌석 클래스 active 제거
				$(this).removeClass("active");
				
				// 좌석 키 값 제거
				seatKey.splice($.inArray($(this).val(), seatKey),1);
				
				// 좌석 번호 제거
				seatNumber.splice($.inArray($(this).attr('data-seat'), seatNumber), 1);
			}
			$('#seatKey').val(seatKey);
			$('#seatNumber').val(seatNumber);
			$('#seatNo').text($('#seatNumber').val())			
		});
	});
</script>
</html>