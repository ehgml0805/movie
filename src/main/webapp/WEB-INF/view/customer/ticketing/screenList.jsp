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
		<div class="container">
			<h1>영화</h1>
			<c:forEach var="m" items="${movieList}">
				<div>
					<button class="movie-button" type="button" value="${m.movieKey}">
						<span>${m.grade}</span>
						<span class="txt">${m.movieTitle}</span>						
					</button>
				</div>					
			</c:forEach>	
		</div>
		<!-- 극장 -->
		<div class="container">
			<h1>극장</h1>
			<c:forEach var="m" items="${movieList}">
				<button class="movie-button" type="button" value="${m.movieKey}">
					<span>${m.grade}</span>
					<span class="txt">${m.movieTitle}</span>						
				</button>					
			</c:forEach>	
		</div>
		<!-- 상영시간표 -->
		<div class="container">
			<h1>상영시간표</h1>
			<c:forEach var="m" items="${movieList}">
				<button class="movie-button" type="button" value="${m.movieKey}">
					<span>${m.grade}</span>
					<span class="txt">${m.movieTitle}</span>						
				</button>					
			</c:forEach>	
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
</html>