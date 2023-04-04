<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- employeeHead -->
<c:import url="/WEB-INF/inc/employeeHead.jsp"></c:import>
<!-- favicon -->
<link rel="shortcut icon" href="../../img/favicon-32x32.png"> 
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
				QuestionOne
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
						<h2>고객 문의사항</h2><br>
						<table class="table">
							<tr>
								<td>지역/극장</td>
								<td>${map.theaterRegion} / ${map.theaterName}</td>
							</tr>
							<tr>
								<td>문의유형</td>
								<td>${map.questionCategory}</td>
							</tr>
							<tr>
								<td>고객아이디</td>
								<td>${map.customerId}</td>
							</tr>
							<tr>
								<td>제목</td>
								<td>${map.questionTitle}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea rows="5" class="form-control text-center" readonly="readonly">${map.questionContent}</textarea></td>
							</tr>
							<!-- 답변 있을 때 -->
							<c:if test="${map.questionAnswer != null}">
								<tr>
									<td colspan="2">
										답변내용 ${map.createdate}
										<a href="${pageContext.request.contextPath}/employee/question/removeQuestionAnswer?questionKey=${map.questionKey}" id="dle">삭제</a>
									</td>
								</tr>
								<tr>
									<td>답변</td>
									<td><textarea rows="5" class="form-control text-center" readonly="readonly">${map.questionAnswer}</textarea></td>
								</tr>
							</c:if>
						</table>
						<!-- 답변 없을 때 답변입력 폼-->
						<c:if test="${map.questionAnswer == null}">
							<h3>답변입력</h3>
							<form method="post" action="${pageContext.request.contextPath}/employee/question/addQuestionAnswer">
								<input type="hidden" name="questionKey" value="${map.questionKey}">
								<table class="table">
									<tr>
										<td>답변</td>
										<td>
											<textarea rows="5" name="questionAnswer" class="form-control"></textarea>
										</td>
									</tr>
								</table>
								<button type="submit" class="form-control">입력</button>
							</form>
						</c:if>
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
	
	<script>
		// 삭제버튼 클릭시
	    $("#dle").on("click", function(){
	    	var result = confirm("삭제 하시겠습니까?");
	    	if (result == false) {
	    		return false;
	    	}
	    });
	</script>
</body>
</html>