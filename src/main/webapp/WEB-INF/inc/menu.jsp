<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div>
	<!-- 비 로그인 -->
	<c:if test="${loginCustomer == null }">
		<a href="${pageContext.request.contextPath}/movie/movieList">영화</a>
		<a href="${pageContext.request.contextPath}/ticket/ticketing">예매</a>
		<a href="${pageContext.request.contextPath}/theater/theaterList">극장</a>
		<a href="${pageContext.request.contextPath}/homeEx">홈</a>
		<a href="${pageContext.request.contextPath}/event/eventList">이벤트</a>
		<a href="${pageContext.request.contextPath}/snack/snackHome">스토어</a>
		<a href="${pageContext.request.contextPath}/membership/membership">혜택/멤버쉽</a>
		<a href="${pageContext.request.contextPath}">관리자</a>
		<a href="${pageContext.request.contextPath}/login/loginCustomer">로그인</a>
	</c:if>
	
	<!-- 로그인 -->
		<c:if test="${loginCustomer != null }">
		<a href="${pageContext.request.contextPath}/movie/movieList">영화</a>
		<a href="${pageContext.request.contextPath}/ticket/ticketing">예매</a>
		<a href="${pageContext.request.contextPath}/theater/theaterList">극장</a>
		<a href="${pageContext.request.contextPath}/homeEx">홈</a>

		<a href="${pageContext.request.contextPath}/customer/event/eventList">이벤트</a>
		<a href="${pageContext.request.contextPath}/customer/order/cartList">카트</a>
		<a href="${pageContext.request.contextPath}/customer/order/orderPage">주문</a>
		<a href="${pageContext.request.contextPath}/event/eventList">이벤트</a>

		<a href="${pageContext.request.contextPath}/snack/snackHome">스토어</a>
		<a href="${pageContext.request.contextPath}/membership/membership">혜택/멤버쉽</a>
		<a href="${pageContext.request.contextPath}">관리자</a>
		<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
	</c:if>
</div> 
    