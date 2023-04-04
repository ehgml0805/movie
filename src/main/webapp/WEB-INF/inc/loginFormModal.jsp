<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<style>
     .white{
       color: white;
     }
     
     .my_btn {
	  background-color: #342462;
	  color: white;
	  border: none;
	  
	  width: 460px;
	  height: 60px;
	}

</style>
<body>
	
	<!-- 로그인 모달 내부 -->
	<div class="modal fade" id="modal-login-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="loginFormModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			
			<div class="modal-header">
				
				<h5 class="modal-title white" id="loginFormModalLabel" >...................</h5>
				<img src="${pageContext.request.contextPath}/img/new-e1i6box-white.png"width="200" style="margin:0px auto;">
				<button type="button" class="btn-close btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				
			</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/login/loginCustomer" method="post" id="cloginForm">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">ID</label>
							<input type="text" name="customerId" id="customerId" class="form-control" placeholder="아이디를 입력하세요." value="goodee">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">PW</label>
							<input type="password" name="customerPw" id="customerPw" class="form-control" placeholder="비밀번호를 입력하세요." value="1234">
						</div>
						<br>
						<div class="mb-3">
							<button type="button" class="btn my_btn" id="cloginBt" >로그인</button>
						</div>
						<!-- 카카오로그인 -->
						<div >
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=ade6ceae84db1bedc786e318204f8ca8
									&redirect_uri=http://localhost/movie/kakao/callback&response_type=code">
								<img src="${pageContext.request.contextPath}/img/kakao_login.png" width="460" height="60">
							</a>
							
						</div>
						<br>
						
						
						<div class="modal-footer">
							
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div>
	
	
<script>

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
	



</script>
	
</body>

</html>