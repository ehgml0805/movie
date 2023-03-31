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
</head>
<body>
	
	<!-- 로그인 모달 내부 -->
	<div class="modal fade" id="modal-loginEmployee-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="loginEmployeeFormModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title white" id="loginFormModalLabel" >...................</h5>
				<img src="${pageContext.request.contextPath}/img/new-e1i6box-white.png"width="200" style="margin:0px auto;">
				<button type="button" class="btn-close btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/login/loginEmployee" method="post" id="eloginForm">

						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">ID</label>
							<input type="text" name="employeeId" id="employeeId" class="form-control" placeholder="아이디를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">PW</label>
							<input type="password" name="EmployeePw" id="EmployeePw" class="form-control" placeholder="비밀번호를 입력하세요.">
						</div>
						<br>
						<div  class="mb-3">
							<button class="btn my_btn" id="eloginBt"  onclick="location.href='${pageContext.request.contextPath}/login/loginEmployee'" >
							
								<span style="font-size: 5mm;">관리자로 로그인</span>
		
							</button>
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
//관리자 로그인
$('#eloginBt').click(function() {
	// 폼 유효성 검사
	// 폼 액션 전송
	console.log('로그인 클릭');
	if($('#employeeId').val()==""){
		alert('아이디를 입력해주세요!');
		return false;
	}
	if($('#EmployeePw').val()==""){
		alert('비밀번호를 입력해주세요!');
		return false;
	}
	$('#eloginForm').submit();
});




</script>
	
</body>

</html>