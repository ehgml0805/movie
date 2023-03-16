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
	<div class="container" style="width:1250px;">
		<div class="row mb-3">
			<div class="col">
                <h2>빠른 예매</h2>
            </div>
		</div>	
	</div>
	<!-- 날짜 -->
	<div class="container">
		<div class="date"></div>
		<button class="prevBtn">이전</button>
		<span class="container" id="calendar"></span>
	    <button class="nextBtn">다음</button>
    </div>
	<div class="container d-flex">
		<!-- 영화 -->
		<div class="container movie-container left-one">
			<h1>영화</h1>
			<div class="movie-name">
				<button class="movie-name-button" type="button">전체</button>
			</div>
			<div id="movieList">
				<c:forEach var="m" items="${movieList}">
					<div class="movie-list">
						<button class="movie-button" type="button" value="${m.movieKey}">
							<span>${m.grade}</span>
							<span class="txt">${m.movieTitle}</span>						
						</button>
					</div>					
				</c:forEach>
			</div>
			<div class="movie-img">
				<div class="choice-list" id="choiceMovieList-0">
					<img id="picture" alt="no-picture" src="">
                    <p id="picture-name">영화를 클릭하세요</p>
				</div>
			</div>	
		</div>
		<!-- 극장 -->
		<div class="container">
			<h1>극장</h1>
			<div id="theater">
				<div class="row">
					<div id="theaterRegion" class="col-6">
						<c:forEach var="r" items="${theaterRegionList}">
							<div>
								<button class="region" value="${r.theaterRegion}" type="button">${r.theaterRegion}(${r.count})</button>
							</div>
						</c:forEach>
					</div>
					<div class="col-6" id="theaterName"></div>
				</div>
			</div>
		</div>
		<!-- 상영시간표 -->
		<div class="container">
			<h1>상영시간표</h1>
			<div id="schedule">
			
			</div>
		</div>
	</div>
    <form action="/ticketing/ticketingList" method="post" id="form-post-List">
	   	<input type="hidden" name="day" value="" />
	   	<input type="hidden" id="movieKey" name="movieKey" value="" />
	   	<input type="hidden" id="theaterKey" name="theaterKey" value="" />
	   	<input type="hidden" name="time" value="" />
	   	<input type="hidden" name="ratingNo" value="" />
	   	<input type="hidden" name="showTypeNo" value="" />
	   	<input type="hidden" name="screenNo" value="" />
	   	<input type="hidden" name="regionNo" value="" />
	   	<input type="hidden" name="showScheduleNo" value="" />
    </form>
    
    <script>
		$(function() {
			
			// 시작 날짜 (오늘 날짜 기준)
			const startDate = new Date();
			let year = startDate.getFullYear();
			let month = startDate.getMonth();
			$('div.date').text(year+"년 "+(Number(month)+1)+"월");
			
			// 끝 날짜 (2주일치)
			const endDate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate() + 13);
			
			// 달력 출력할 ul 요소
			const calendar = document.getElementById("calendar");
			
			// 달력 출력할 button 요소들
			const buttonList = [];
			
			// 날짜 출력 함수
  	      
			function renderCalendar(start, end) {
			  buttonList.length = 0;
			  calendar.innerHTML = "";
			
			  for (let date = start; date <= end; date.setDate(date.getDate() + 1)) {
			    const button = document.createElement("button");
			    const dateString = date.toISOString().slice(0, 10);
			    const dayOfWeek = ["일", "월", "화", "수", "목", "금", "토"][date.getDay()];
			    button.value = dateString;
			    button.innerHTML = date.getDate() + " " + dayOfWeek;
			    button.classList.add('date-button');
			    buttonList.push(button);
			  }
			
			  for (const button of buttonList) {
			    const span = document.createElement("span");
			    span.appendChild(button);
			    calendar.appendChild(span);
			  }
			}
			
			// 초기 출력
			renderCalendar(startDate, endDate);

			// 이전 버튼 클릭 시
			$(document).on('click', 'button.prevBtn', function() {
			  const newStartDate = new Date(startDate);
			  newStartDate.setDate(startDate.getDate() - 14);
			  const newEndDate = new Date(newStartDate.getFullYear(), newStartDate.getMonth(), newStartDate.getDate() + 13);
			  year = newStartDate.getFullYear();
			  month = newStartDate.getMonth();
			  $('div.date').text(year+"년 "+(Number(month)+1)+"월");
			  startDate.setTime(newStartDate.getTime());
			  endDate.setTime(newEndDate.getTime());
			  renderCalendar(startDate, endDate);
			});

			// 다음 버튼 클릭 시
			$(document).on('click', 'button.nextBtn', function() {
			  const newStartDate = new Date(startDate);
			  newStartDate.setDate(startDate.getDate() - 12);
			  const newEndDate = new Date(newStartDate.getFullYear(), newStartDate.getMonth(), newStartDate.getDate() + 13);
			  year = newStartDate.getFullYear();
			  month = newStartDate.getMonth();
			  $('div.date').text(year+"년 "+(Number(month)+1)+"월");
			  startDate.setTime(newStartDate.getTime());
			  endDate.setTime(newEndDate.getTime());
			  renderCalendar(startDate, endDate);
			});
    		
			// 날짜 버튼 클릭 시 년도와 월 변환
			$(document).on('click', 'button.date-button', function() {
				year = $(this).val().slice(0, 4);
				month = $(this).val().slice(6, 7);
				$('div.date').text(year+"년 "+(Number(month))+"월");
			});
			
			// 날짜 선택 시 예매 가능한 영화 목록 출력
			$(document).on('click', '.date-button', function() {
				$.ajax({
					url : '${pageContext.request.contextPath}/ticketing/movieListByDate',
					type : 'GET',
					data : {startDate : $(this).val()},
					success : function (data) {
						
						let html = "";
						for(let i = 0; i < data.length; i++) {
						 	html +=	"<div class='movie-list'>"
						 	if(data[i].startDate === undefined) {
								html += "<button class='movie-button' type='button' value='"+ data[i].movieKey + "' disabled='disabled'>"
								html += "<span>" + data[i].grade + "</span><span class='txt'> " + data[i].movieTitle + "</span>"
								html += "</button>"						 		
						 	}
						 	if(data[i].startDate !== undefined) {
								html += "<button class='movie-button' type='button' value='"+ data[i].movieKey + "'>"
								html += "<span>" + data[i].grade + "</span><span class='txt'> " + data[i].movieTitle + "</span>"
								html += "</button>"						 		
						 	}
							html += "</div>";
							
							/*
							let moviekey = data[i].movieKey;
							let grade = data[i].grade;
							let movieTitle = data[i].movieTitle;
							
							
							html += `
								<div class='movie-list'>
									<button class='movie-button' type='button' value='${data[i].movieKey}'>
										<span>${data[i].grade}000</span>
										<span class='txt'>${data[i].movieTitle}</span>		
									</button>
								</div>	
							`;
							*/
							
							$('#movieKey').val(data[0].movieKey);
						}
						
						$('#movieList').html(html);
					},
					error : function() {
						alert('error')
					}
				})
			})
			
			// 영화 정보에서 예매하기 클릭하여 매개변수 값이 있을 경우
    		$('button.movie-button').ready(function(){
    			$.ajax({
    				url :'${pageContext.request.contextPath}/ticketing/movieOne'
    				, type :'get'
    				, data : {movieKey:${movieKey}}
    				, success:function(list){
    					// alert(list);
    					let fileName = list[0].fileName;
    					let movieCode = list[0].movieCode;
    					// alert(movieCode);
    					if(movieCode != 0){
    						$('#picture').attr('src', fileName);
    					} else {
    						$('#picture').attr('src', '${pageContext.request.contextPath}/stillCut-upload/'+fileName);
    					}    					
    				}
    			});
    		});
  	      	  	      
    		/* 영화 선택 시 이미지 출력 */
    		$('button.movie-button').click(function(){
    			$.ajax({
    				url :'${pageContext.request.contextPath}/ticketing/movieOne'
    				, type :'get'
    				, data : {movieKey:$(this).val()}
    				, success:function(list){
    					// alert(list);
    					let fileName = list[0].fileName;
    					let movieCode = list[0].movieCode;
    					$('#movieKey').val(list[0].movieKey);
    					// alert(movieCode);
    					if(movieCode != 0){
    						$('#picture').attr('src', fileName);
    					} else {
    						$('#picture').attr('src', '${pageContext.request.contextPath}/stillCut-upload/'+fileName);
    					}    					
    				}
    			});
    		});
    		
    		/* 빠른 예매 - 영화 선택 시 해당 지역 및 상영중인 극장 수 출력 */
    		$('.movie-button').click(function() {
				$.ajax({
					url : '${pageContext.request.contextPath}/ticketing/regionList',
					type : 'GET',
					data : {movieKey : $(this).val()},
					success : function(data) {
						let html = '';
			            for (let i=0; i < data.length; i++) {
			                html += "<div><button class='region' value='" + data[i].theaterRegion + "' type='button'>" 
			                		+ data[i].theaterRegion + "(" + data[i].regionCount + ")" + "</button></div>";
			            }
			            
						$('#theaterRegion').html(html);
					},
					error : function() {
						alert('error')
					}
				})
			});
    		
    		/*  지역 선택 시 해당 지역 극장 리스트 출력 */
    		$(document).on('click', '.region', function() {
    		    $.ajax({
    		        type: 'GET',
    		        url: '${pageContext.request.contextPath}/ticketing/theaterList',
    		        data: { theaterRegion: $(this).val() },
    		        dataType: 'json',
    		        success: function(data) {
    		        	$('#theaterKey').val(data[0].theaterKey);
    		            var html = "";
    		            for (var i = 0; i < data.length; i++) {
    		                html += "<button class='theater-button'>" + data[i].theaterName + "</button>";
    		            }
    		            $('#theaterName').html(html);
    		        },
    		        error: function() {
    		            alert('error')
    		        }
    		    })
    		});
    		
    		// 극장 선택 시 상영 스케줄 출력
    		$(document).on('click', '.theater-button', function() {
    			// alert('클릭');
				$.ajax({
					url : '${pageContext.request.contextPath}/ticketing/screeningScheduleList'
					, type : 'GET'
					, data : {movieKey: $('#movieKey').val(), theaterKey: $('#theaterKey').val()}
					, dataType : 'json'
					, success:function(list){
						// alert(list)
						let html = "";
						for(let i=0; i< list.length; i++){
							let startDate_ = list[i].startDate.split("T");
							let startDate = startDate_[1].slice(0, 5);
							let endDate_ = list[i].endDate.split("T");
							let endDate = endDate_[1].slice(0, 5);
							html += "<button>"+startDate+"~"+endDate+list[i].movieTitle+list[i].seatCount+list[i].screenroomName+list[i].theaterName+"</button><br>";
						}
						$('#schedule').html(html);
					}
					, error:function(){
						alert('에러');
					}
				});	
			});
		})
    </script>
</body>
</html>