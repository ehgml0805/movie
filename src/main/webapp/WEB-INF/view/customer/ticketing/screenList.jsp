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
	<div class="container day">
        <!-- 페이지 네이션으로 입력할 것 -->
        <!--일에 따라서 class가 바뀐다. -->
        <div class="month"></div>
       	<div class="now-day">
       	</div>
    </div>
	<div class="container d-flex">
		<!-- 영화 -->
		<div class="container movie-container left-one">
			<h1>영화</h1>
			<div class="movie-name">
				<button class="movie-name-button" type="button">전체</button>
			</div>
			<c:forEach var="m" items="${movieList}">
				<div class="movie-list">
					<button class="movie-button" type="button" value="${m.movieKey}">
						<span>${m.grade}</span>
						<span class="txt">${m.movieTitle}</span>						
					</button>
				</div>					
			</c:forEach>
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

    		const dataDate = new Date();
    		let year = dataDate.getFullYear();
    		let month = dataDate.getMonth();
    		let dataDay = dataDate.getDate();
    		let dayLabel = dataDate.getDay();
    		let dayNumber = Number(dataDay);
    		$('div.month').text((Number(month)+1)+"월");
    		
    		const reserveDate = $('div.now-day');
    		
    		const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];
    		let thisWeek = [];
    		let button = "";
    		let spanWeekOfDay = "";
    		let spanDay = "";
    		let div = "";
    		for(let i = dayNumber ; i<=dayNumber+11 ; i++) {
    			
    			div = document.createElement("div");
    			button = document.createElement("button");
    			spanWeekOfMonth = document.createElement("span");
    			spanWeekOfDay = document.createElement("span");
    			spanDay = document.createElement("strong");
    			spanWeekOfMonth.classList="movie-week-of-month";
    			spanWeekOfDay.classList = 'movie-week-of-day';
    			spanDay.classList ='movie-day';
    			let resultDay = new Date(year, month, i);
    			let yyyy = resultDay.getFullYear();
    			let mm = Number(resultDay.getMonth())+1;
    			let dd = resultDay.getDate();
    			let d = resultDay.getDay();
    			
    			mm = String(mm).length === 1 ? '0'+mm : mm;
    			dd = String(dd).length === 1 ? '0'+dd : dd;
    			d = String(d).length === 1 ? '0'+d : d;
    			spanWeekOfMonth.innerHTML = mm;
    			spanWeekOfDay.innerHTML = dd;
    			
    			button.append(spanWeekOfDay);
    			if(d == '01'){
    				d=weekOfDay[1];
    				button.classList = "mon";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			} else if(d == '02'){
    				d=weekOfDay[2];
    				button.classList = "mon";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			} else if(d == '03'){
    				d=weekOfDay[3];
    				button.classList = "mon";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			} else if(d == '04'){
    				d=weekOfDay[4];
    				button.classList = "mon";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			} else if(d == '05'){
    				d=weekOfDay[5];
    				button.classList = "mon";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			} else if(d == '06'){
    				d=weekOfDay[6];
    				button.classList ="mon sat";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			} else if(d == '00'){
    				d=weekOfDay[0];
    				button.classList="mon sun";
    				button.setAttribute('data-day',yyyy+mm+dd+d);
    			}
    			if(i===dayNumber){
    				button.classList="mon active";
    				//해당날짜는 버튼이 눌려있게 설정함
    			}
    			spanDay.innerHTML = d;
    			button.append(spanDay);
    			reserveDate.append(button);
    			
    			
    			thisWeek[i] = yyyy + "-" + mm +'-' +dd +'-'+d ;
    		}
    		//날짜 클릭시 활성화 버튼과 hidden으로 data값 전송
    		$('div.now-day').on('click','button.mon',function(){
    			let $btnActive = $(this);
    			let dataAttr = $btnActive.attr('data-day');
    			if($btnActive.hasClass('active')){
    				$('button.mon').removeClass('active');
    			} else{
    				$('button.mon').removeClass('active');
    				$btnActive.addClass('active');
    			}
    		})
    		//날짜 클릭했으면 활성화버튼 해제 
    		$('div.now-day').on('click','button.active',function(){
    			let $btnMon = $(this);
    			$btnMon.attr('class','mon');
    		})
    		
    		$('button.movie-button').ready(function(){
    			$.ajax({
    				url :'${pageContext.request.contextPath}/ticketing/movieOne'
    				, type :'get'
    				, data : {movieKey:${param.movieKey}}
    				, success:function(list){
    					// alert(list);
    					let originName = list[0].originName;
    					let movieCode = list[0].movieCode;
    					// alert(movieCode);
    					if(movieCode != 0){
    						$('#picture').attr('src', originName);
    					} else {
    						$('#picture').attr('src', '${pageContext.request.contextPath}/stillCut-upload/'+originName);
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
    					let originName = list[0].originName;
    					let movieCode = list[0].movieCode;
    					$('#movieKey').val(list[0].movieKey);
    					// alert(movieCode);
    					if(movieCode != 0){
    						$('#picture').attr('src', originName);
    					} else {
    						$('#picture').attr('src', '${pageContext.request.contextPath}/stillCut-upload/'+originName);
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
							html += "<div>"+startDate+"~"+endDate+list[i].movieTitle+list[i].seatCount+list[i].screenroomName+list[i].theaterName+"</div><br>";
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