<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<!-- employeeHead -->
<c:import url="/WEB-INF/inc/employeeHead.jsp"></c:import>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/home" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="${pageContext.request.contextPath}/employeeHome" class="stext-109 cl8 hov-cl1 trans-04">
				Admin Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				NoticeOne
			</span>
		</div>
	</div>

	<!-- Content page -->
	<section class="bg0 p-t-70 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg text-center">
					<!-- Main start -->
						<h1>공지사항</h1>
						<h3>${map.noticeTitle}</h3>
						<div style="text-align:right;">
							<small>등록일 ${map.createdate}</small>
							<a href="${pageContext.request.contextPath}/employee/notice/modifyNotice?noticeKey=${map.noticeKey}&noticeTitle=${map.noticeTitle}&noticeContent=${map.noticeContent}">수정</a>
							<a href="${pageContext.request.contextPath}/employee/notice/removeNotice?noticeKey=${map.noticeKey}&fileName=${map.fileName}">삭제</a>
						</div>
						<hr>
						<c:if test="${map.fileName ne null}">
							<div><img src="${pageContext.request.contextPath}/notice-upload/${map.fileName}" style="width:100%; height:100%;"></div>
						</c:if>
						<div>${map.noticeContent}</div>
					<!-- Main End -->
					</div>
				</div>
				
				<!-- 관리자 메뉴 -->
				<c:import url="/WEB-INF/inc/employeeMenu.jsp"></c:import>
				
			</div>
		</div>
	</section>	
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/employeeFooter.jsp"></c:import>

</body>
</html>