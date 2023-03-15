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
		<div class="container center-one">
			<h1>극장</h1>
			<div class="theater-list">
                <button class="theater-all-button">전체</button>
                <div class="theater-spacial-button"></div>
            </div>
            <div class="list-theater-detail">
               <div class="all-theater-list">
                	<div class="explain-button">
                		<p style="display:flex">영화를 선택하세요</p>
                		<c:forEach var="region" items="${regions }">
                		<button class='list-theater-button' data-region='${region.no }' style="display:none">${region.name }</button>
                	</c:forEach>
                	</div>
               </div>
               <div class="theater-choies">
               
               </div>
           </div>
           <div class="theater-choies-check">
               <p class="check-content" style="display:flex;">전체극장<br>
                   목록에서 극장을 선택하세요
               </p>
               <!--선택했을 경우 클릭하면 입력되고 아니면 열리지 않는다.-->
               <div class="check-theater" style="display:none;">
               
               </div>
           </div>
		</div>
		<!-- 상영시간표 -->
		<div class="container right-one">
			<h1>상영시간표</h1>
			<div class="time-check">
            </div>
            <div class="movie-check">
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
</body>
<script type="text/javascript">
	$(function(){
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
	});
</script>
</html>