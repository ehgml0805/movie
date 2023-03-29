<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">


.btn { background-color: #99ccff; width: 70px; padding: 3px; border: solid 1px #6699ff;  font-size: 9pt; }
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	
	<!-- 로그인 모달 내부 -->
	<div class="modal fade" id="modal-addCustomer-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="addCustomerFormModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="addCustomerFormModalLabel">회원가입</h5>
				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/login/addCustomer" method="post" id="addCustomerForm" enctype="multipart/form-data">
						<div class="mb-3">
							iD중복검사
							<input type="text" name="idck" class="col-form-label" >
							<input type="submit" value="중복체크" class="btn">
							</div>  
					   
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">프로필사진</label>
							<input type="file" name="customerImgList" id="customerImgList" class="form-control" >
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">ID</label>
							<input type="text" name="customerId" id="customerId" class="form-control" placeholder="아이디를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">이름</label>
							<input type="text" name="customerName" id="customerName" class="form-control" placeholder="이름을 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">비밀번호</label>
							<input type="password" name="customerPw" id="customerPw" class="form-control" placeholder="비밀번호를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">주소</label>
							<input type="text" name="customerAddress" id="customerAddress" class="form-control" placeholder="주소를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">생년월일</label>
							<input type="date" name="customerBirthday" id="customerBirthday" class="form-control" placeholder="생년월일을 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">성별</label>
							<input type="radio" name="customerGender" id="customerGender"  value="M" checked>남
							<input type="radio" name="customerGender" id="customerGender"  value="F">여
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">전화번호</label>
							<input type="tel" name="customerPhone" id="customerPhone" class="form-control" placeholder="000-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
	     					required
	     					minlength="13"
							maxlength="13">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">생년월일</label>
							<input type="email" name="customerEmail" id="customerEmail" class="form-control"  size="30" required placeholder="이메일을 입력하세요.">
						</div>
						<br>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="addCustomerBt">회원가입</button>
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div>
	
	
<script>

$('#addCustomerBt').click(function() {
	// 폼 유효성 검사
	// 폼 액션 전송
	console.log('회원가입 클릭');
	if($('#customerId').val()==""){
		alert('아이디를 입력해주세요!');
		return false;
	}
	if($('#customerName').val()==""){
		alert('이름을 입력해주세요!');
		return false;
	}
	if($('#customerPw').val()==""){
		alert('비밀번호를 입력해주세요!');
		return false;
	}
	if($('#customerAddress').val()==""){
		alert('주소를 입력해주세요!');
		return false;
	}
	if($('#customerBirthday').val()==""){
		alert('생일을 입력해주세요!');
		return false;
	}
	if($('#customerGender').val()==""){
		alert('성별을 입력해주세요!');
		return false;
	}
	if($('#customerPhone').val()==""){
		alert('전화번호를 입력해주세요!');
		return false;
	}
	if($('#customerEmail').val()==""){
		alert('이메일을 입력해주세요!');
		return false;
	}
	
	$('#addCustomerForm').submit();
});




</script>
	
</body>

</html>