<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
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
				AddNotice
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
						<h1>공지사항 등록</h1><br>
						<form method="post" id="form" action="${pageContext.request.contextPath}/employee/notice/addNotice" enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>제목</td>
									<td>
										<input type="text" name="noticeTitle" id="noticeTitle" class="form-control">
									</td>
								</tr>
								<tr>
									<td>내용</td>
									<td>
										<textarea rows="5" name="noticeContent" id="noticeContent" class="form-control"></textarea>
									</td>
								</tr>
								<tr>
									<td>이미지</td>
									<td>
										<input type="file" name="img" class="form-control">
									</td>
								</tr>
							</table>
							<button type="button" id="btn" class="form-control">등록</button>
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
	
	<script>
		// 입력확인 검사
		$("#btn").on("click", function(){
			// 제목입력 확인
			if($('#noticeTitle').val() == "") {
				alert("제목을 입력해주세요.");
				$("#noticeTitle").focus();
				return false;
			}
			// 내용입력 확인
			if($('#noticeContent').val() == "") {
				alert("내용을 입력해주세요.");
				$("#noticeContent").focus();
				return false;
			}
			$('#form').submit();
		});
	</script>
</body>
</html>