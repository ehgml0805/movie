<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div>성인 : </div>
				<div>일반 : </div>
			</div>
			<!-- 극장, 시간 정보 -->
			<div class="col-1g-6 col-sm-6">
				<div><span id="theater">${scheduleOne.theaterName}</span> | <span id="screenroom">${scheduleOne.screenroomName}</span> | 남은 좌석 <span id="leftSeat" style="color:red;"></span>/<span id="totalSeat">${scheduleOne.seatCount}</span> </div>
				<div class="time">${scheduleOne.date} ${scheduleOne.startDate} ~ ${scheduleOne.endDate}</div>
			</div>
		</div>
		
		<!-- 좌석 선택 -->
		<div class="container">
			
		</div>
	</div>
	
	<!-- 결제 선택 -->
	<form action="/ticketing/ticketingList" method="post" id="form-post-List">
	   	<input type="hidden" id="day" name="day" value="" />
	   	<input type="hidden" id="movieKey" name="movieKey" value="" />
	   	<input type="hidden" id="theaterKey" name="theaterKey" value="" />
	   	<input type="hidden" id="scheduleKey" name="scheduleKey" value="${scheduleOne.scheduleKey}" />
	   	<input type="hidden" id="ck" name="ck" value="" />
	   	<input type="hidden" name="ratingNo" value="" />
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
							<td><span id="party"></span></td>
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
		// 상영 스케줄 키로 모든 정보 가져오기
		/*
		$.ajax({
			url : ''
			, type : 'GET'
			, data : {screen}
		})
		*/
	});
</script>
</html>