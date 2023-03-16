<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 리스트</title>
<!-- 모달 쿠폰 등록 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<!-- 쿠폰등록 모달 버튼 -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#acModal">쿠폰등록</button>
	
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
	<table>
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