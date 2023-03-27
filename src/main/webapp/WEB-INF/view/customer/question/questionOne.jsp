<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<div class="container mt-3" style="width: 70%;">
		<h2 class="text-center">문의사항</h2><br>
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
					<textarea rows="5" cols="100" readonly="readonly" class="text-center form-control">${map.questionContent}</textarea>
				</td>
			</tr>
			<c:if test="${map.questionAnswer != null}">
				<tr>
					<td colspan="2">답변내용 <small>답변일 : ${map.createdate}</small></td>
				</tr>
				<tr>
					<td>답변</td>
					<td>
						<textarea rows="5" cols="100" readonly="readonly" class="text-center form-control">${map.questionAnswer}</textarea>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
	
</body>
</html>