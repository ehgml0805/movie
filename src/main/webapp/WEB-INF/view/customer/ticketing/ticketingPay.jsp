<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MEET PLAY SHARE, E1I6</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="shortcut icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
  	<link rel="shortcut icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>

	<!-- 제목 -->
	<div class="container col-lg-12 col-sm-12" style="width:1250px;">
		<div class="row mb-3">
			<div class="col">
                <h2>결제하기</h2>
            </div>
		</div>	
	
		<div class="container row col-lg-12 col-sm-12">
			<div class="col-lg-8 col-sm-8">
				<!-- 쿠폰 선택 -->
				<div class="bg-dark" style="color:white;">&nbsp;STEP 1.<button type="button" id="myCouponRetry" style="color:white; float:right;">다시하기</button></div>
				<div id="myCouponList">
					<div>&nbsp;할인쿠폰</div>				
					<table>
						<tr>
							<td>쿠폰 이름 </td>
							<td>할인 금액 </td>
							<td>사용기한 </td>
						</tr>
						<c:forEach var="c" items="${myCouponList}">		
							<tr>
								<td>
									<input type="radio" class="coupon" name="coupon" value="${c.mycouponKey}" data-price="${c.couponSalePrice}">
									${c.couponName}
								</td>
								<td>${c.couponSalePrice}원</td>
								<td>~ ${c.useByDate}</td>
							</tr>
						</c:forEach>			
					</table>
				</div>
				<!-- 포인트 선택 -->
				<div class="bg-dark" style="color:white;">&nbsp;STEP 2.</div>
				<div>&nbsp;포인트</div>
				<table>
					<tr>
						<td>
							 보유 포인트 <input type="number" id="mypoint" name="mypoint" value="${point}" readonly="readonly">원
						</td>
						<td>
							 사용할 포인트 <input type="number" id="point" name="point" value="">원
						</td>
					</tr>
				</table>
				<!-- 결제 수단 선택 -->
				<div class="bg-dark" style="color:white;">&nbsp;STEP 3.</div>
				<div>&nbsp;결제수단</div>
				<div>
					<input type="radio" name="kakaoPay" checked="checked"> 카카오페이
				</div>
			</div>
			<div class="col-lg-4 col-sm-4">
				<div class="summary_box total_box">
					<div class="payment_header" id="payment">결제하실 금액</div>
					<div class="payment_footer">
						<div class="result">
							<span class="num" id="totalPrice">${totalPrice}</span>
							<span class="won">원</span>
						</div>
					</div>
				</div>
				<br>
				<div class="summary_box discount_box">
					<div class="payment_header">할인내역</div>
					<div class="payment_footer">
						<div class="label">
							<span>총 할인금액</span>
						</div>
						<div class="result">
							<span class="num" id="discountPrice"></span>
							<span class="won">원</span>
						</div>
					</div>
				</div>
				<br>
				<div class="summary_box payment_box">
					<div class="payment_header">결제내역</div>
					<div class="payment_body" id="payment_list">
						<dl>
							<dt>카카오페이</dt>
							<dd>
								<span class="num" id="kakaoPrice"></span>
								<span class="won">원</span>
							</dd>
						</dl>
					</div>
					<div class="payment_footer">
						<div class="laber">
							<span>남은 결제금액</span>
						</div>
						<div class="result">
							<span class="num" id="remainPrice"></span>
							<span class="won">원</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 예매 정보 상태 -->
	<div class="container d-flex bg-dark" style="color:white;">
	   	<div class="row col-lg-12 col-sm-12">
	   		<div class="movie-img col-lg-4 col-sm-4">
				<div class="choice-list" id="choiceMovieList-0">
					<img id="picture" alt="no-picture" src="${stillCut.fileName}" style="width:120px; height:171px;">
                    <p id="picture-name">${scheduleOne.movieTitle}</p>
				</div>
			</div>	
			<div class="col-lg-4 col-sm-4">
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
							<c:if test="${adultNo ne 0}">
								<span id="adult-count">일반 ${adultNo}명&nbsp;</span>
							</c:if>
							<c:if test="${teenagerNo ne 0}">
								<span id="teenager-count">청소년 ${teenagerNo}명</span>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-lg-4 col-sm-4">
				<table>
					<tr>
						<td>좌석명</td>
						<td><span id="seatName">일반석</span></td>
					</tr>
					<tr>
						<td>좌석번호</td>
						<td>
							<c:forEach var="s" begin="0" end="${fn:length(seatNumber)-1}" step="1">
								<span id="seatNo">${seatNumber[s]}</span>
								<input type="hidden" class="seatKey" name="seatKey" value="${seatKey[s]}">
							</c:forEach>
						</td>
					</tr>
				</table>
			</div>
	   	</div>
	   	<input type="hidden" id="scheduleKey" name="scheduleKey" value="${scheduleOne.scheduleKey}">
	   	<input type="hidden" id="totalAmount" name="totalAmount" value="${totalPrice}">
	   	<input type="hidden" id="discountAmount" name="discountAmount" value="0">
	   	<input type="hidden" id="kakaoAmount" name="kakaoAmount" value="0">
	   	<input type="hidden" id="usePoint" name="usePoint" value="0">
	   	<input type="hidden" id="movieTitle" name="movieTitle" value="${scheduleOne.movieTitle}">
	   	<button id="kakaopay" class="payBtn" type="button" style="background-color:#3F0099; color:white; width:200px; height:200px;">결제하기</button>
   	</div>
   	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>
</body>
<script>
	$(function(){
		let totalPrice = parseInt($('#totalPrice').text());
		let couponPrice = '0'; // 쿠폰 가격
		let pointVal = '0'; // 사용할 보인트
		let discountPrice = '0'; // 총 할인가격
		$('#kakaoPrice').text(totalPrice);
		$('#remainPrice').text(totalPrice);
		
		// input에 저장해주기
		$('#kakaoAmount').val(totalPrice);
		
		// 쿠폰 선택 시
		$(document).on('click', '.coupon', function(){
			couponPrice = $('.coupon:checked').attr('data-price'); // 쿠폰 적용 가격
			discountPrice = parseInt(pointVal) + parseInt(couponPrice); // 총 할인가격
			
			// 총 할인금액
			$('#discountPrice').text(discountPrice);
			$('#kakaoPrice').text(totalPrice - discountPrice);
			$('#remainPrice').text(totalPrice - discountPrice);
			
			// input에 저장해주기
			$('#discountAmount').val(discountPrice);
			$('#kakaoAmount').val(totalPrice - discountPrice);
		});
		
		$('#point').on('blur', function() {
			if(parseInt($('#mypoint').val()) < parseInt($(this).val())) {
				alert('보유 포인트를 초과했습니다.');
				$(this).val('');
			}
			if(parseInt($('#mypoint').val()) < 0) {
				$(this).val('');
			}
			
			pointVal = ($('#point').val() === '') ? '0' : $(this).val(); // 사용할 포인트
			discountPrice = parseInt(pointVal) + parseInt(couponPrice); // 총 할인가격
			
			// 총 할인금액
			$('#discountPrice').text(discountPrice);		
			$('#kakaoPrice').text(totalPrice - discountPrice);
			$('#remainPrice').text(totalPrice - discountPrice);
			
			// input에 저장해주기
			$('#usePoint').val(pointVal);
			$('#discountAmount').val(discountPrice);
			$('#kakaoAmount').val(totalPrice - discountPrice);
		});
		
		// 다시하기 ajax
		$('#myCouponRetry').click(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/customer/ticketing/mycouponeList'
				, type : 'GET'
				, success : function() {
					let html = `
					<div>&nbsp;할인쿠폰</div>				
					<table>
						<tr>
							<td>쿠폰 이름 </td>
							<td>할인 금액 </td>
							<td>사용기한 </td>
						</tr>
						<c:forEach var="c" items="${myCouponList}">		
							<tr>
								<td>
									<input type="radio" class="coupon" name="coupon" value="${c.couponKey}" data-price="${c.couponSalePrice}">
									${c.couponName}
								</td>
								<td>${c.couponSalePrice}원</td>
								<td>~ ${c.useByDate}</td>
							</tr>
						</c:forEach>			
					</table>`;
					
					$('#myCouponList').html(html);
					
					// 쿠폰 적용
					couponPrice = ($('.coupon:checked').attr('data-price') == undefined) ? '0' : $('.coupon:checked').attr('data-price'); // 쿠폰 적용 가격
					discountPrice = parseInt(pointVal) + parseInt(couponPrice); // 총 할인가격
					// 총 할인금액
					$('#discountPrice').text(discountPrice);
					$('#kakaoPrice').text(totalPrice - discountPrice);
					$('#remainPrice').text(totalPrice - discountPrice);
					
					// input에 저장해주기
					$('#discountAmount').val(discountPrice);
					$('#kakaoAmount').val(totalPrice - discountPrice);
				}
				, error : function() {
					alert('error')
				}
			});
		})
		
		$('#kakaopay').click(function(){
			let scheduleKey = $('#scheduleKey').val();
			let mycouponKey = 0;
			if($('.coupon:checked').val() != undefined){
				mycouponKey = $('.coupon:checked').val();
			}
			totalPrice = $('#totalAmount').val();
			discountPrice = 0;
			if($('#discountAmount').val() != 0){
				discountPrice = $('#discountAmount').val();
			}
			let kakaoPrice = 0;
			if($('#kakaoAmount').val() != 0){
				kakaoPrice = $('#kakaoAmount').val();
			}
			var seatKey = new Array();
			$('.seatKey').each(function() {
				seatKey.push(parseInt($(this).val()));
			});
			let movieTitle = $('#movieTitle').val();
			let usePoint = $('#usePoint').val();
			
			// alert('scheduleKey : ' + scheduleKey + ' mycouponKey : ' + mycouponKey + ' totalPrice : ' + totalPrice + ' discountPrice : ' + discountPrice + ' kakaoPrice : ' + kakaoPrice + ' seatKey : ' + seatKey + ' movieTitle : ' + movieTitle + 'usePoint : ' + usePoint);
			
			$.ajax({
				url:'${pageContext.request.contextPath}/kakaopay',
				type : "POST",
				traditional : true, // ajax 배열 넘기기 옵션!
				data: {
				    scheduleKey: scheduleKey,
				    mycouponKey: mycouponKey,
				    totalPrice: totalPrice,
				    discountPrice: discountPrice,
				    kakaoPrice : kakaoPrice,
				    seatKey: seatKey,
				    movieTitle : movieTitle,
				    usePoint : usePoint
				},
				dataType: 'json',		
				success:function(data){
					var box = data.next_redirect_pc_url;
					location.href = box;
				},
				error:function(error){
					alert("카카오페이 에러");
				}
			});
		});

	});
</script>
</html>