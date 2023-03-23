<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.png"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animate/animate.css">
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/css/main.css">
<!--===============================================================================================-->
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
						<br>
						<div >
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=ade6ceae84db1bedc786e318204f8ca8
									&redirect_uri=http://localhost/movie/kakao/callback&response_type=code">
								<img src="${pageContext.request.contextPath}/img/kakao_login.png" width="460" height="60">
							</a>
						</div>
						<div  class="flex-c-m flex-w w-full p-tb-40">
							<button class="btn btn-primary" style="WIDTH: 345pt; HEIGHT: 45pt">
							
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
								
								  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
								  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
							
								</svg>
								
								<span style="font-size: 5mm;">관리자로 로그인</span>
								
								
							</button>
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