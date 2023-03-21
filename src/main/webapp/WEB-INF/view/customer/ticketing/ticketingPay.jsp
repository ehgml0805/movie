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
	<div class="container col-lg-12 col-sm-12" style="width:1250px;">
		<div class="row mb-3">
			<div class="col">
                <h2>결제하기</h2>
            </div>
		</div>	
	
		<div class="container row col-lg-12 col-sm-12">
			<div class="col-lg-8 col-sm-8">
				<!-- 쿠폰 선택 -->
				<div class="bg-dark" style="color:white;">&nbsp;STEP 1.</div>
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
								<input type="radio" name="coupon" value="${c.couponKey}">
								${c.couponName}
							</td>
							<td>${c.couponSalePrice}원</td>
							<td>~ ${c.useByDate}</td>
						</tr>
					</c:forEach>			
				</table>
				<!-- 포인트 선택 -->
				<div class="bg-dark" style="color:white;">&nbsp;STEP 2.</div>
				<div>&nbsp;포인트</div>
				<table>
					<tr>
						<td>
							 보유 포인트 <input type="number" name="mypoint" value="${point}" readonly="readonly">원
						</td>
						<td>
							 사용할 포인트 <input type="number" name="point" value="">원
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
					<div class="payment_header">결제하실 금액</div>
					<div class="payment_footer">
						<div class="result">
							<span class="num" id="totalPrice"></span>
							<span class="won">원</span>
						</div>
					</div>
				</div>
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
				<div class="summary_box payment_box">
					<div class="payment_header">결제내역</div>
					<div class="payment_body" id="payment_list">
						<dl>
							<dt>신용카드</dt>
							<dd>
								<span class="num"></span>
								<span class="won">원</span>
							</dd>
						</dl>
					</div>
					<div class="payment_footer">
						<div class="laber">
							<span>남은 결제금액</span>
						</div>
						<div class="result">
							<span class="num"></span>
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
							<span id="adult-count"></span>
							<span id="teenager-count"></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="col-lg-4 col-sm-4">
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
	   	</div>
	   	<button class="payBtn" type="button" disabled="disabled">결제하기</button>
   	</div>
</body>
</html>