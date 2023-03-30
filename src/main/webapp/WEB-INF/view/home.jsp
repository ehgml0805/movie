<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	  	<meta charset="utf-8">
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 부트스트랩4-->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> <!-- 부트스트랩 JavaScript 파일 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		
		<title>MEET PLAY SHARE, E1I6</title>
		<style>
			.movie-list {
				height: 600px;
				/* background-image: linear-gradient(to top, rgba(0,0,0,0.7), rgba(0,0,0,1)); */
				background: radial-gradient(circle, #14100E, #25243D);
				/* background-color: black; */
			}
			.cards-wrapper {
			  display: flex;
			  justify-content: center;
			}
			.card img {
			  max-width: 100%;
			  max-height: 100%;
			}
			.card{
			  margin: 0 0.5em;
			  box-shadow: 2px 6px 8px 0 rgba(22, 22, 26, 0.18);
			  border: none;
			}
			.carousel-inner {
			  padding: 1em;
			}
			.carousel-control-prev,
			.carousel-control-next {
			  background-color: #e1e1e1;
			  width: 5vh;
			  height: 5vh;
			  border-radius: 50%;
			  top: 50%;
			  transform: translateY(-50%);
			}
			@media (min-width: 768px) {
			  .card img {
			    height: 11em;
			  }
			}
			
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

			
			.event-container {
  				margin-left: 16%;
			}
			.event-bg {
    			position: relative;
    			padding-bottom: 10%;
			}
			.event-bg::after {
			    content: "";
			    position: absolute;
			    left: 0;
			    right: 0;
			    bottom: -10%;
			    height: 50%;
			    background: #503396;
			    z-index: -1;	
			}
			.customer {
				margin-top: 1%;
			}
			.separator {
    			border: 1px solid #CCC;
    			width: 100%; /* Adjust the width of the separator line */
    			margin-top: 10%;
			}

		</style>

		
	</head >
	<body  >

	</head>
	<body>

		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu.jsp"></c:import> 
		
		
		
		<%-- <div>오늘 총 방문자 수: ${todayCount}</div> --%>
		<!-- 영화 목록 -->
		<div class="movie-list">
			<div class="container">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<c:forEach var="m" items="${movieList}" varStatus="status">
							<c:if test="${status.index % 4 == 0}">
								<div class="carousel-item ${status.index == 0 ? 'active' : ''}">
									<div class="row">
							</c:if>
							 <c:if test="${m.active eq 'Y'}">
							<div class="col-md-3">
								<div class="card mt-3" style="width: 100%; height:100%;">
									<c:if test="${m.poster eq 'Y'}">
										<!-- 영화 이미지 -->
										<c:choose>
											<c:when test="${m.movieCode ne '0'}">
												<div>
													<a 
														href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}">
														<img class="poster w-100 h-100" alt="영화이미지" src="${m.fileName}">
													</a>
												</div>
											</c:when>
											<c:otherwise>
												<div>
													<a 
														href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}">
														<img class="poster w-100 h-100" alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}">
													</a>
												</div>
											</c:otherwise>
										</c:choose>
			
										<!-- 영화 정보 -->
										<div class="card-body pt-0">
											<div>
												<h4 class="nanumgothic movie-title mt-3 card-title">${m.grade} ${m.movieTitle}</h4>
											</div>
											<!-- 영화 찜 카운트 -->
											<div class="d-flex justify-content-between mt-3">
												<c:if test="${wishlistCount[status.index].idCount == 0}">
													<button class="btn wishBtn border" id="btn-${status.index}"
														value="${m.movieKey}" type="button">
														<span>♡</span> ${wishlistCount[status.index].allCount}
													</button>
												</c:if>
												<c:if test="${wishlistCount[status.index].idCount == 1}">
													<button class="btn wishBtn border" id="btn-${status.index}"
														value="${m.movieKey}" type="button">
														<span class="heart">♥</span>
														${wishlistCount[status.index].allCount}
													</button>
												</c:if>
												<a class="btn d-block" style="background-color: #503396; color: white; width: 150px" href="${pageContext.request.contextPath}/ticketing/screenList?movieKey=${m.movieKey}">예매</a>
											</div>
										</div>
									</c:if>
								</div>
								
							</div>
							</c:if>
							<c:if test="${(status.index + 1) % 4 == 0 || status.last}">
									</div>
								</div>
							</c:if>
						
				</c:forEach>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="visually-hidden">Next</span>
				</button>
				</div>
			</div>
		</div>
		<!-- 이벤트 -->
		<div class="event-bg">
			<div class="container mt-4 event-container">
			    <h3>혜택/이벤트</h3>
			    <div class="row">
			        <!-- Medium card -->
			        <div class="col-md-6">
			            <div class="row">
			                <div class="card" style="width: 600px; height: 250px;">
		           	 			<div class="carousel slide" data-bs-ride="carousel" style="width: 580px; height: 240px;">
	      	 			      		<div class="carousel-inner">
	        							<div class="carousel-item active">
						                    <a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=3">
						                 	   <img src="${pageContext.request.contextPath}/event-upload/스즈메패키지.jpg" style="width: 580px; height: 240px;">
						                    </a>
				                		</div>
		                		        <div class="carousel-item">
	          								<a href="${pageContext.request.contextPath}/customer/notice/noticeOne?noticeKey=5">
	          	 								<img src="${pageContext.request.contextPath}/event-upload/u멤버십2.jpg" style="width: 580px; height: 240px;">
	          								</a>
	        							</div>
		                		        <div class="carousel-item">
	          								<a href="${pageContext.request.contextPath}/customer/notice/noticeOne?noticeKey=6">
	          	 								<img src="${pageContext.request.contextPath}/event-upload/해피투게더2.jpg" style="width: 580px; height: 240px;">
	          								</a>
	        							</div>			           
			               			</div> 
			            		</div>
			            	</div>
			            </div>		
			            <div class="row mt-4">
			                <!-- Small card 1 -->
			                <div class="col-md-6">
			                    <div class="card" style="width: 19rem;">
			                    	<a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=2">
			                        	<img src="${pageContext.request.contextPath}/event-upload/슬램덩크FULL콤보.png" style="width: 19rem; height: 120px;">
			                        </a>
			                        <div class="card-body">
			                            <h5 class="card-title">슬램덩크 한정판 굿즈 + 팝콘 패키지 출시!</h5>
			                        </div>
			                    </div>
			                </div>
			                <!-- Small card 2 -->
			                <div class="col-md-6">
			                    <div class="card" style="width: 19rem;">
		                   	 		<a href="${pageContext.request.contextPath}/customer/notice/noticeOne?noticeKey=4">
			                        	<img src="${pageContext.request.contextPath}/event-upload/메박오리지널티켓.jpg" style="width: 18rem; height: 190px;">
			                    	</a>
			                    </div>
			                </div>
			            </div>
			        </div>
			        <!-- Large card -->
			        <div class="col-md-6">
			            <div class="card" style="width: 395px; height: 500px;">
		           	 		<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=48&movieKey=1">
			                	<img src="${pageContext.request.contextPath}/event-upload/스즈메 시사회.jpg" style="width: 392px; height: 480px;">
			            	</a>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
		<span style=""></span>
		<hr class="separator">
		<!-- 고객 센터 -->
		<div class="customer">
			<div class="container mt-5">
			    <div class="row mt-3">
			        <div class="col-md-2">
			        	<a href="${pageContext.request.contextPath}/faq/faqList" style="text-decoration: none; color: inherit;">
		           			<i class="bi bi-question-circle" style="font-size: 4rem;"></i>
			            	<div>자주 묻는 질문</div>
		           		</a>	
			        </div>
			        <div class="col-md-2">
		       	 		<a href="${pageContext.request.contextPath}/customer/question/questionList" style="text-decoration: none; color: inherit;">
				            <i class="bi bi-people-fill" style="font-size: 4rem;"></i>
				            <div>1:1 문의</div>
				        </a>    
			        </div>
	   		        <div class="col-md-2">
		       	 		<a href="${pageContext.request.contextPath}/customer/notice/noticeList" style="text-decoration: none; color: inherit;">
				            <i class="bi bi-card-list" style="font-size: 4rem;"></i>
				            <div>공지 사항</div>
				        </a>    
			        </div>
			    </div>
			</div>
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