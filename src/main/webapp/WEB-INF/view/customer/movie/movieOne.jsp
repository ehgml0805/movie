<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>MEET PLAY SHARE, E1I6</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
  	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
  	<style>
		.btn:active, .btn:focus {
			outline:none !important;
			box-shadow:none !important;
		}
		.heart {
			color: red;
		}
		.movie-grade {
		    width: 40px;
		    height: 40px;
		    background-size: 40px 40px;
		}
  	</style>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import>
	
	<div class="container-fluid">
		<c:forEach var="m" items="${movie}" varStatus="status">
			<c:if test="${m.poster eq 'Y'}">
				<!-- movie-detail -->
				<div class="movie-detail row col-lg-12 col-md-12 bg-dark" style="color:white; background: linear-gradient(45deg, #070707, #8C8C8C);">
					<div class="col-lg-6 col-md-6"  style="padding-top:50px; padding-left:200px; padding-bottom:30px;">
						<p class="contents-type">#메가토크 #돌비시네마 #프리미어 #무대인사</p>
						<p style="font-size:40px;">
						<!-- 영화 등급 -->
						<span class="movie-grade"> 
							<c:if test="${m.grade eq 'ALL'}">
								<img class="movie-grade" alt="grade" src="${pageContext.request.contextPath}/img/ALL.png">
							</c:if> 
							<c:if test="${m.grade eq '18'}">
								<img class="movie-grade" alt="grade" src="${pageContext.request.contextPath}/img/18.png">
							</c:if> 
							<c:if test="${m.grade eq '15'}">
								<img class="movie-grade" alt="grade" src="${pageContext.request.contextPath}/img/15.png">
							</c:if> 
							<c:if test="${m.grade eq '12'}">
								<img class="movie-grade" alt="grade" src="${pageContext.request.contextPath}/img/12.png">
							</c:if> 
						</span>
						<!-- 영화 제목 -->
						${m.movieTitle}</p>
						<!-- 영화 찜 카운트 -->
						<div class="d-flex justify-content-between mt-2" style="padding-top:10px;">
							<c:if test="${wishlistCount[status.index].idCount == 0}">
								<button class="btn wishBtn border" id="btn-${status.index}" value="${m.movieKey}" type="button" style="color:white;"><span style="color:white;">♡</span> ${wishlistCount[status.index].allCount}</button>
							</c:if>
							<c:if test="${wishlistCount[status.index].idCount == 1}">
								<button class="btn wishBtn border" id="btn-${status.index}" value="${m.movieKey}" type="button" style="color:white;"><span class="heart" style="color:red;">♥</span> ${wishlistCount[status.index].allCount}</button>
							</c:if>
						</div>
						<br><br><br><br>
						<!-- info -->
						<div class="info">
							<div>${m.movieInfo}</div>
							<br><br><br>
							<div class="rate">
								<span style="font-size:20px;">예매율 : </span>
								<span style="font-size:30px;">${m.reservationRate}%</span>
							</div>
						</div>
					</div>
					<!--// info -->
					<div class="col-lg-6 col-md-6" style="padding-top:50px;">
						<c:choose>
							<c:when test="${m.movieCode ne '0'}">
								<div style="padding-left:300px;">									
									<img alt="영화이미지" src="${m.fileName}" style="width:260px; height:374px; border-radius: 10px;">
								</div>			
							</c:when>
							<c:otherwise>
								<div style="padding-left:300px;">
									<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" style="width:260px; height:374px; border-radius: 10px;">
								</div>			
							</c:otherwise>
						</c:choose>
						<div class="reserve" style="padding-top:10px; padding-left:300px; padding-bottom:30px;">
							<a class="btn" type="button" style="color:white; background-color:#3DB7CC; width:260px; height:40px;" href="${pageContext.request.contextPath}/ticketing/screenList?movieKey=${m.movieKey}">예매</a>	
						</div>
					</div>
				</div>
			</div>
			<div class="container">	
				<ul class="nav nav-tabs"id="postTab" style="font-weight: bold; margin-top: 40px;">
				  <li class="nav-item"><a data-toggle="tab" href="#tab1" class="nav-link active" style="color: black;">주요정보</a></li>
				  <li class="nav-item"><a data-toggle="tab" href="#tab2" class="nav-link" style="color: black;">스틸컷</a></li>
				</ul>
				<div class="tab-content" id="postTabContent" style="margin-top: 40px;">
					<!-- 탭의 내용 -->
					<div id="tab1" class="tab-pane active">
						<div>${m.movieSummary}</div>
						<br>
						<div>${m.movieInfo}</div>
					</div>
					<div id="tab2" class="tab-pane fade">
			</c:if>
			<c:if test="${m.poster eq 'N'}">
				<c:choose>
					<c:when test="${m.movieCode ne '0'}">
						<%-- <div class="card" style="border:none;">
							<div class="card-body" style="background-image: url(${m.fileName}); background-size:cover;"></div>
						</div> --%>
						<span><img alt="영화이미지" src="${m.fileName}" style="width:30%; border-radius: 10px; margin:10px;"></span>
					</c:when>
					<c:otherwise>
						<%-- <div class="card" style="border:none;">
							<div class="card-body" style="background-image: url(${pageContext.request.contextPath}/stillCut-upload/${m.fileName}); background-size:cover;"></div>
						</div> --%>
						<span><img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" style="width:30%; border-radius: 10px; margin:10px;"></span>	
					</c:otherwise>
				</c:choose>		
			</c:if>			
		</c:forEach>
		</div></div><br><br>
		<table style="text-align:center;">
			<tr>
				<td>고객아이디</td>	
				<td>평점</td>	
				<td>내용</td>	
				<td>좋아요</td>	
				<td>작성일자</td>	
				<td>삭제</td>	
				<td>신고</td>	
			</tr>
			<c:forEach var="r" items="${rlist}">
				<tr>
					<td>${r.customerId}</td>
					<td>
						${r.ratings }
						<c:if test="${r.ratings==1}">
							★
							</c:if> <c:if test="${r.ratings==2}">
							★★
							</c:if> <c:if test="${r.ratings==3}">
							★★★
							</c:if> <c:if test="${r.ratings==4}">
							★★★★
							</c:if> <c:if test="${r.ratings==5}">
							★★★★★
						</c:if>
					</td>
					<td>${r.content }</td>
					<td>${r.love }</td>
					<td>${r.createdate }</td>
					<td><a>삭제</a> </td>
					<td>
						<a href="${pageContext.request.contextPath}/customer/review/insultReport?customerId=${r.customerId}&ticketingKey=${r.ticketingKey}&movieKey=${mKey}">욕설/비방 신고</a>
						<a href="${pageContext.request.contextPath}/customer/review/spoilerReport?customerId=${r.customerId}&ticketingKey=${r.ticketingKey}&movieKey=${mKey}">스포일러 신고</a>
					</td>
				</tr>	
			</c:forEach>
		</table>
	</div>	
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
</body>
</html>