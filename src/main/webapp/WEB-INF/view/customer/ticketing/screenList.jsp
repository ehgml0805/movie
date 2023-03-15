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
	<div class="container d-flex">
		<!-- 영화 -->
		<div class="container movie-container left-one">
			<h1>영화</h1>
			<div class="movie-name">
				<button class="movie-name-button" type="button">전체</button>
			</div>
			<c:forEach var="m" items="${movieList}">
				<div class="movie-list">
					<button class="movie-button" type="button" id="movieKey" name="movieKey" value="${m.movieKey}">
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
	   	<input type="hidden" name="movieKey" value="" />
	   	<input type="hidden" name="theaterKey" value="" />
	   	<input type="hidden" name="time" value="" />
	   	<input type="hidden" name="ratingNo" value="" />
	   	<input type="hidden" name="showTypeNo" value="" />
	   	<input type="hidden" name="screenNo" value="" />
	   	<input type="hidden" name="regionNo" value="" />
	   	<input type="hidden" name="showScheduleNo" value="" />
    </form>
    
    <script>
    	$(function() {
    		/* 영화 선택 시 이미지 출력 */
    		$('button.movie-button').click(function(){
    			$.ajax({
    				url :'${pageContext.request.contextPath}/ticketing/movieOne'
    				, type :'get'
    				, data : {movieKey:$(this).val()}
    				, success:function(list){
    					// alert(list);
    					let originName = list[0].originName;
    					$('#picture').attr('src', originName);
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
    		            var html = "";
    		            for (var i = 0; i < data.length; i++) {
    		                html += "<div>" + data[i].theaterName + "</div>";
    		            }
    		            $('#theaterName').html(html);
    		        },
    		        error: function() {
    		            alert('error')
    		        }
    		    })
    		});
			
		})
    </script>
</body>
</html>