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
		<link rel="shortcut icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
	   	<link rel="shortcut icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
	  	<style>
	  		img.poster {
			    width: 230px;
			    height: 331px;
			}
			div .movie-title {
			  overflow: hidden;
			  text-overflow: ellipsis; 
			  white-space: nowrap;
			  word-break:break-all;
			  width: inherit;
			}
			.btn:active, .btn:focus {
				outline:none !important;
				box-shadow:none !important;
			}
			.heart {
				color: red;
			}
			.movie-grade {
			    width: 23px;
			    height: 23px;
			    background-size: 23px 23px;
			}
	  	</style>
	</head>
	<body>
	 	<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import>
		<div class="container w-75">
				<div class="row">
				<h2 class="mt-4 mb-4">전체영화</h2>
				<c:forEach var="m" items="${movieList}" varStatus="status">
					<div class="col-3 mb-5 pe-4">
						<c:if test="${m.poster eq 'Y' && m.active eq 'Y'}">
							<!-- 영화 이미지 -->
							<c:choose>
							<c:when test="${m.movieCode ne '0'}">
								<div>
									<a href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}" >
										<img class="poster w-100 h-100" alt="영화이미지" src="${m.fileName}">
									</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}" >
										<img class="poster w-100 h-100" alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" width="300px" height="500px">
									</a>
								</div>
							</c:otherwise>		
							</c:choose>
							<%-- <div>영화 정보 : ${m.movieInfo}</div> --%>
							<%-- <div>영화 줄거리 : ${m.movieSummary}</div> --%>
							
							<!-- 영화 정보 -->				
							<div>
								<p class="movie-title mt-3">
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
									 ${m.movieTitle}
								</p>
							</div>
							<div>
								<span>예매율 : ${m.reservationRate}%</span><br>
								<span>개봉일 : ${m.openingdate}</span>
							</div>
							<!-- 영화 찜 카운트 -->
							<div class="d-flex justify-content-between mt-3">
								<c:if test="${wishlistCount[status.index].idCount == 0}">
									<button class="btn wishBtn border" id="btn-${status.index}" value="${m.movieKey}" type="button"><span>♡</span> ${wishlistCount[status.index].allCount}</button>
								</c:if>
								<c:if test="${wishlistCount[status.index].idCount == 1}">
									<button class="btn wishBtn border" id="btn-${status.index}" value="${m.movieKey}" type="button"><span class="heart">♥</span> ${wishlistCount[status.index].allCount}</button>
								</c:if>
								<a class="btn d-block" style="background-color: #503396; color: white; width: 150px" href="${pageContext.request.contextPath}/ticketing/screenList?movieKey=${m.movieKey}">예매</a>
							</div>	
						</c:if>		
					</div>
				</c:forEach>
			</div>
		</div>
		<div>
			<!-- footer -->
			<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
		</div>
		<script>
			// 찜 버튼 클릭시
			var customerId = '${customerId}';
			var key = '';
			var btnId = '';
			var count = '';
			var sumCount = '';
			$(".wishBtn").on("click", function(e){
				key = $(this).val(); // 영화키
				count = $(this).text().substring(2); // 찜카운트만 가져오기
				btnId = $(this).attr("id"); // 클릭한 버튼 id
				console.log(key + " : movieKey");
				console.log(count + " : count");
				console.log(btnId + " : btnId");
				console.log(customerId + " : customerId");
				if(customerId == '') { // 로그인 안되어 있으면
					alert("로그인 후 이용 가능합니다");
					return
				} else {
					// WishlistRestController로 요청
					$.ajax({
						url : "${pageContext.request.contextPath}/customer/wishlist/wishlistCheck"
						, type : "get"
						, data : {movieKey : key}
						, success : function(ck) { // 10 = 찜해제 , 20 = 찜완료
							console.log(ck + " : ck");
							
							if(ck == 10) { // 찜해제 완료
								sumCount = Number(count) - 1;
								$('#'+btnId+'').html("<span>♡</span> "+sumCount);
								//console.log($('#'+btnId+'').html());
							
							} else { // 찜하기 완료
								sumCount = Number(count) + 1;
								$('#'+btnId+'').html("<span class='heart'>♥</span> "+sumCount);
								//console.log($('#'+btnId+'').html());
							}
						}
						, error : function() {
							console.log("찜 에러");
						}
					});
				}		
			});
		</script>
	</body>
</html>