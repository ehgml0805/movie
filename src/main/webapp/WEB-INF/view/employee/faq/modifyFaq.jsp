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
	<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/home" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="#" class="stext-109 cl8 hov-cl1 trans-04">
				Admin Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				ModifyFaq
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
						<h1>FAQ 수정</h1><br>
						<form method="post" action="${pageContext.request.contextPath}/employee/faq/modifyFaq">
							<input type="hidden" name="faqKey" value="${faqKey}">
							<table class="table">
								<tr>
									<td>질문 내용</td>
									<td><input type="text" name="faqQuestion" value="${faqQuestion }" class="form-control"><td>
								</tr>
								<tr>
									<td>답변 내용</td>
									<td><textarea rows="5" name="faqAnswer" class="form-control">${faqAnswer}</textarea></td>
								</tr>
							</table>
							<button type="submit" class="form-control">FAQ 수정</button>
						</form>
					<!-- Main End -->
					</div>
				</div>
				
				<!-- 관리자 메뉴 -->
				<c:import url="/WEB-INF/inc/employeeMenu.jsp"></c:import>
				
			</div>
		</div>
	</section>	
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 

</body>
</html>