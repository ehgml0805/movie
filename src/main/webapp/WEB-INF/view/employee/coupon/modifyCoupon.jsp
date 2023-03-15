<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쿠폰 수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h3>쿠폰 수정</h3>
	<form action="${pageContext.request.contextPath}/employee/coupon/modifyCoupon" method="post" id="CForm">
		<div>
			쿠폰번호: <input type="text" name="couponKey" id="couponKey" value="${co.couponKey}" >
		</div>
		<div>
			쿠폰명: <input type="text" name="couponName" id="couponName" value="${co.couponName}" >
		</div>
		<div>
			할인금액: <input type="text" name="couponSalePrice" id="couponSalePrice" value="${co.couponSalePrice}" >
		</div>
		<div>
			쿠폰등급: <input type="text" name="couponGrade" id="couponGrade" value="${co.couponGrade}" >
		</div>
		<div>
			사용기한: <input type="date" name="useByDate" id="useByDate" value="${co.useByDate}" >
		</div>
		
		<button type="button" id="CBt"> 수정</button>
		
	</form>
	
	<script>
	//쿠폰등록
	$('#CBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('쿠폰 수정 클릭');
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
</body>
</html>