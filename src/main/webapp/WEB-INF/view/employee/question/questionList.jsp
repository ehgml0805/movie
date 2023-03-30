<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
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
				questionList
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
						<h2>문의사항 관리</h2><br>

						<table class="table">
							<tr>
								<td>번호</td>
								<td>문의제목</td>
								<td>답변여부</td>
								<td>문의날짜</td>
							</tr>
							<c:forEach var="l" items="${list}">
								<tr>
									<td>${l.num}</td>
									<td>
										<a href="${pageContext.request.contextPath}/employee/question/questionOne?questionKey=${l.questionKey}">${l.questionTitle}</a>
									</td>
									<!-- 답변없으면 -->
									<c:if test="${l.questionAnswer eq null}">
										<td>미완료</td>
									</c:if>
									<!-- 답변있으면 -->
									<c:if test="${l.questionAnswer ne null}">
										<td>답변완료</td>
									</c:if>
									<td>${l.createdate}</td>
								</tr>
							</c:forEach>
						</table>
							<!-- 페이징 -->
						<div>
							<!-- 처음으로 -->
							<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=1">처음</a>
							<!-- 1페이지에서 이전버튼 -->
							<c:if test="${currentPage <= 1}">
								<span>이전</span>
							</c:if>
							<!-- 이전페이지 -->
							<c:if test="${currentPage > 1}">
								<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=${currentPage-1}">이전</a>
							</c:if>
							<span>${currentPage} / ${lastPage}</span>
							<!-- 다음페이지 -->
							<c:if test="${currentPage < lastPage}">
								<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=${currentPage+1}">다음</a>
							</c:if>
							<!-- 마지막페이지에서 다음버튼 -->
							<c:if test="${currentPage >= lastPage}">
								<span>다음</span>
							</c:if>
							<!-- 마지막으로 -->
							<a href="${pageContext.request.contextPath}/employee/question/questionList?currentPage=${lastPage}">마지막</a>
						</div>
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