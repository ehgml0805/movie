<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 리스트</title>
<!-- employeeHead -->
<c:import url="/WEB-INF/inc/employeeHead.jsp"></c:import>
<!-- 모달 쿠폰 등록 -->

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
				couponList
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
					<h2>쿠폰관리</h2><br>
					<!-- 쿠폰등록 모달 버튼 -->
					<div class="text-right">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#acModal">쿠폰등록</button>
					</div>
					
					<!-- 로그인 모달 내부 -->
					<div class="modal fade" id="acModal" tabindex="-1" aria-labelledby="acModalLabel" aria-hidden="true">
				
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="acModalLabel">쿠폰등록</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form action="${pageContext.request.contextPath}/employee/coupon/addCoupon" method="post" id="CForm">
				
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">쿠폰명</label>
											<input type="text" name="couponName" id="couponName" class="form-control" placeholder="쿠폰명을 입력하세요.">
										</div>
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">할인금액</label>
											<input type="text" name="couponSalePrice" id="couponSalePrice" class="form-control" placeholder="할인금액을 입력하세요.">
										</div>
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">쿠폰등급</label>
											<input type="text" name="couponGrade" id="couponGrade" class="form-control" placeholder="silver, gold, vip 등급을 입력하주세요.">
										</div>
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">사용기한</label>
											<input type="date" name="useByDate" id="useByDate" class="form-control">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
											<button type="button" class="btn btn-primary" id="CBt">등록</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<table class="table">
						<tr>
							<td>쿠폰 번호</td>
							<td>쿠폰명</td>
							<td>할인금액</td>
							<td>등급</td>
							<td>사용기한</td>
							<td>발행일자</td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
						<c:forEach var="c" items="${clist}">
							<tr>
								<td>${c.couponKey }</td>
								<td>${c.couponName }</td>
								<td>${c.couponSalePrice }</td>
								<td>${c.couponGrade }</td>
								<td>${c.useByDate }</td>
								<td>${c.createdate }</td>
								<td>
									<a href="${pageContext.request.contextPath}/employee/coupon/modifyCoupon?couponKey=${c.couponKey}">수정</a>
								</td>
								<td>
									<a href="${pageContext.request.contextPath}/employee/coupon/removeCoupon?couponKey=${c.couponKey}">삭제</a>
								</td>
							</tr>
						</c:forEach>
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
	<c:import url="/WEB-INF/inc/employeeFooter.jsp"></c:import>
	
	<script>
	
	 //쿠폰등록 모달
	var acModal = document.getElementById('acModal')
	var couponNameInput = document.querySelector('#couponName')
	acModal.addEventListener('show.bs.modal', function (event) {
    	couponNameInput.focus()
		
	})
	//쿠폰등록
	$('#CBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('쿠폰 등록 클릭');
		if($('#couponName').val()==""){
			alert('쿠폰명을 입력해주세요!');
			return false;
		}
		if($('#couponSalePrice').val()==""){
			alert('할인금액을 입력해주세요!');
			return false;
		}
		if($('#couponGrade').val()==""){
			alert('쿠폰등급을 입력해주세요!');
			return false;
		}
		if($('#couponSalePrice').val()==""){
			alert('할인금액을 입력해주세요!');
			return false;
		}
		if($('#useByDate').val()==""){
			alert('사용기한을 입력해주세요!');
			return false;
		}
		$('#CForm').submit();
	}); 
	</script>
	<!-- 모달 사용하려고 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>