<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	
	<!-- 로그인 모달 내부 -->
	<div class="modal fade" id="modal-login-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="loginFormModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="loginFormModalLabel">로그인</h5>
				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/login/loginCustomer" method="post" id="cloginForm">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">ID</label>
							<input type="text" name="customerId" id="customerId" class="form-control" placeholder="아이디를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">PW</label>
							<input type="password" name="customerPw" id="customerPw" class="form-control" placeholder="비밀번호를 입력하세요.">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="cloginBt">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">
//관리자 로그인
$('#cloginBt').click(function() {
	// 폼 유효성 검사
	// 폼 액션 전송
	console.log('로그인 클릭');
	if($('#customerId').val()==""){
		alert('아이디를 입력해주세요!');
		return false;
	}
	if($('#customerPw').val()==""){
		alert('비밀번호를 입력해주세요!');
		return false;
	}
	$('#cloginForm').submit();
});

// 관리자 로그인
const CLoginModal = document.querySelector('#CLoginModal')
const customerId = document.querySelector('#customerId')

CLoginModal.addEventListener('shown.bs.modal', function () {
	 empIdInput.focus()
})


</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
</script>
</body>
</html>