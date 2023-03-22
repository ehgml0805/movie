<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>영화 목록</title>
</head>
<body>

	<c:forEach var="m" items="${movieList}" varStatus="status">
		<c:if test="${m.poster eq 'Y'}">
			<c:choose>
			<c:when test="${m.movieCode ne '0'}">
				<div>
					<a href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}" >
						<img alt="영화이미지" src="${m.fileName}" width="300px" height="500px">
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div>
					<a href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}" >
						<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" width="300px" height="500px">
					</a>
				</div>
			</c:otherwise>		
			</c:choose>				
			<div>
				<a href="${pageContext.request.contextPath}/movie/movieOne?movieKey=${m.movieKey}" >
					${m.movieTitle}
				</a>
			</div>
			<div>영화 정보 : ${m.movieInfo}</div>
			<div>영화 줄거리 : ${m.movieSummary}</div>
			<div>등급 : ${m.grade}</div>
			<div>예매율 : ${m.reservationRate}</div>
			<div>개봉일 : ${m.openingdate}</div>
			<div>활성화 여부 : ${m.active}</div>
			<div>포스터 : ${m.poster}</div>
			<!-- 영화 찜 카운트 -->
			<c:if test="${wishlistCount[status.index].idCount == 0}">
				<button class="wishBtn" id="btn-${status.index}" value="${m.movieKey}" type="button">♡ ${wishlistCount[status.index].allCount}</button>
			</c:if>
			<c:if test="${wishlistCount[status.index].idCount == 1}">
				<button class="wishBtn" id="btn-${status.index}" value="${m.movieKey}" type="button">♥ ${wishlistCount[status.index].allCount}</button>
			</c:if>
			<a href="${pageContext.request.contextPath}/ticketing/screenList?movieKey=${m.movieKey}">예매하기</a>	
		</c:if>		
	</c:forEach>
	
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
						$('#'+btnId+'').text("♡ "+sumCount);
						//console.log($('#'+btnId+'').html());
					
					} else { // 찜하기 완료
						sumCount = Number(count) + 1;
						$('#'+btnId+'').text("♥ "+sumCount);
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