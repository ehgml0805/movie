<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

			<span class="stext-109 cl4">
				questionOne
			</span>
		</div>
	</div>
	
	<!-- Content page -->
	<section class="bg0 p-t-30 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 고객 고객센터 메뉴 -->
				<c:import url="/WEB-INF/inc/customerMenu.jsp"></c:import>
				
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg text-center">
						<!-- Main start -->
						<h2>나의 문의내역</h2><br><hr><br>

						<!-- 답변 없으면 수정가능 -->
						<c:if test="${map.questionAnswer == null}">
							<div style="text-align:right;">
								<a href="${pageContext.request.contextPath}/customer/question/modifyQuestion?questionKey=${map.questionKey}&theaterRegion=${map.theaterRegion}&theaterName=${map.theaterName}&questionCategory=${map.questionCategory}&questionTitle=${map.questionTitle}&questionContent=${map.questionContent}">수정</a>
							</div>
						</c:if>
						<table class="table text-center">
							<tr>
								<td>지역/극장</td>
								<td>${map.theaterRegion} / ${map.theaterName}</td>
							</tr>
							<tr>
								<td>문의유형</td>
								<td>${map.questionCategory}</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>${map.questionTitle}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
									<textarea rows="5"readonly="readonly" class="text-center form-control">${map.questionContent}</textarea>
								</td>
							</tr>
							<c:if test="${map.questionAnswer != null}">
								<tr>
									<td colspan="2">답변내용 <small>답변일 : ${map.createdate}</small></td>
								</tr>
								<tr>
									<td>답변</td>
									<td>
										<textarea rows="5"readonly="readonly" class="text-center form-control">${map.questionAnswer}</textarea>
									</td>
								</tr>
							</c:if>
						</table>
						<!-- Main End -->
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>