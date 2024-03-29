<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>theaterList</title>
		<!-- employeeHead -->
		<c:import url="/WEB-INF/inc/employeeHead.jsp"></c:import>
	 	<link rel="shortcut icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
   		<link rel="shortcut icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon-32x32.png">
		<style>
			a {
				color : #037B94;
			}
		</style>
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
					theaterList
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
							<h2>극장 관리</h2><br>
							<div class="text-right">
								<a href="${pageContext.request.contextPath}/employee/theater/addTheater">극장등록</a>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>극장코드</th>
										<th>극장지역</th>
										<th>극장명</th>
										<th>극장주소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="t" items="${theaterList}">
										<tr>
											<td>${t.theaterKey}</td>
											<td>${t.theaterRegion}</td>
											<td><a href="${pageContext.request.contextPath}/employee/theater/theaterOne?theaterKey=${t.theaterKey}">${t.theaterName}</a></td>
											<td>${t.theaterAddress}</td>
										</tr>
									</c:forEach>
								</tbody>		
							</table>
						<!-- Main End -->
						</div>
					</div>
					
					<!-- 관리자 메뉴 -->
					<c:import url="/WEB-INF/inc/employeeMenu.jsp"></c:import>
					
				</div>
			</div>
		</section>	
		<!-- footer -->
		<div>
			<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
		</div>
		<script>
			$(function(){
				let msg = '${msg}';
				
				if(msg == 'ADD_SUCCESS') {
					alert('등록 성공')
				}
				if(msg == 'ADD_ERROR') {
					alert('등록 실패')
				}
				if(msg == 'REMOVE_SUCCESS') {
					alert('삭제 성공')
				}
				if(msg == 'REMOVE_ERROR') {
					alert('삭제 실패')
				}
			})
		</script>
	</body>
</html>