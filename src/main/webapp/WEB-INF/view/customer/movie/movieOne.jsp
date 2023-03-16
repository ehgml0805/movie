<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 상세정보</title>
</head>
<body>
	<c:forEach var="m" items="${movie}">
		<c:if test="${m.poster eq 'Y'}">
			<c:choose>
				<c:when test="${m.movieCode ne '0'}">
					<div><img alt="영화이미지" src="${m.fileName}" width="300px" height="500px"></div>			
				</c:when>
				<c:otherwise>
					<div><img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" width="300px" height="500px"></div>			
				</c:otherwise>
			</c:choose>
			<div>${m.movieTitle}</div>
			<div>영화 정보 : ${m.movieInfo}</div>
			<div>영화 줄거리 : ${m.movieSummary}</div>
			<div>등급 : ${m.grade}</div>
			<div>예매율 : ${m.reservationRate}</div>
			<div>개봉일 : ${m.openingdate}</div>
			<div>활성화 여부 : ${m.active}</div>
			<div>포스터 : ${m.poster}</div>
			<a href="${pageContext.request.contextPath}/ticketing/screenList?movieKey=${m.movieKey}">예매하기</a>	
			<div>스틸컷 : </div>
		</c:if>
		<c:if test="${m.poster eq 'N'}">
			<c:choose>
				<c:when test="${m.movieCode ne '0'}">
					<div><img alt="영화이미지" src="${m.fileName}" width="300px" height="500px"></div>			
				</c:when>
				<c:otherwise>
					<div><img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" width="300px" height="500px"></div>			
				</c:otherwise>
			</c:choose>		
		</c:if>			
	</c:forEach>
	
	
	<table>
		<tr>
			<td>고객아이디</td>	
			<td>평점</td>	
			<td>내용</td>	
			<td>좋아요</td>	
			<td>작성일자</td>	
			<td>삭제</td>	
			<td>신고</td>	
		</tr>
		<tr>
			<c:forEach var="r" items="${rlist}">
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
					<a href="${pageContext.request.contextPath}/customer/review/report?customerId=${r.customerId}&ticketingKey=${r.ticketingKey}&movieKey=${mKey}">욕설/비방 신고</a>
					<a href="${pageContext.request.contextPath}/customer/review/report?customerId=${r.customerId}&ticketingKey=${r.ticketingKey}&movieKey=${mKey}">스포일러 신고</a>
				</td>
			</c:forEach>
			
		</tr>
	</table>
</body>
</html>