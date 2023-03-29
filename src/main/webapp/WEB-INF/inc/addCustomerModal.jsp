<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	
	<!-- 로그인 모달 내부 -->
	<div class="modal fade" id="modal-addCustomer-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="addCustomerFormModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<img src="${pageContext.request.contextPath}/img/megabox-logo2.png" width="460" height="80">
				<h5 class="modal-title" id="addCustomerFormModalLabel"></h5>
				<button type="button" class="btn-close btn-close-black" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<div class="modal-body">
					<div class="mb-3">
						ID중복검사
						<input type="text" id="id" class="col-form-label" >
						<input type="button" value="중복체크" id="ckBtn" class="btn btn-primary">
					</div>
					<div>${errorMsg}</div>
					<form action="${pageContext.request.contextPath}/login/addCustomer" method="post" id="addCustomerForm" enctype="multipart/form-data">
						  
					   
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">프로필사진</label>
							<input type="file" name="customerImgList" id="customerImgList" class="form-control" >
						</div>
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">ID</label>
							<input type="text" name="customerId" id="customerIdCk" class="form-control" placeholder="아이디를 입력하세요." readonly="readonly">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">이름</label>
							<input type="text" name="customerName" id="addCustomerName" class="form-control" placeholder="이름을 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">비밀번호</label>
							<input type="password" name="customerPw" id="addCustomerPw" class="form-control" placeholder="비밀번호를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">주소</label>
							<input type="text" name="customerAddress" id="addCustomerAddress" class="form-control" placeholder="주소를 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">생년월일</label>
							<input type="date" name="customerBirthday" id="addCustomerBirthday" class="form-control" placeholder="생년월일을 입력하세요.">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">성별</label>
							<input type="radio" name="customerGender" id="addCustomerGender"  value="M" checked>남
							<input type="radio" name="customerGender" id="addCustomerGender"  value="F">여
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">전화번호</label>
							<input type="tel" name="customerPhone" id="addCustomerPhone" class="form-control" placeholder="000-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
	     					required
	     					minlength="13"
							maxlength="13">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">생년월일</label>
							<input type="email" name="customerEmail" id="addCustomerEmail" class="form-control"  size="30" required placeholder="이메일을 입력하세요.">
						</div>
						<br>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type=submit class="btn btn-primary" id="addCustomerBt">회원가입</button>
						</div>
					</form>
				
				</div>
			</div>
		</div>
	</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>	
<script>



   $('#ckBtn').click(function(){
      $.ajax({
         url:'idck'
         , type:'get'
         , data : {customerId:$('#id').val()}
         , success:function(model){ // model : 'YES' / 'NO'
            if(model=='YES') {
               // 사용가능한 아이디
               $('#customerIdCk').val($('#id').val());
               alert($('#id').val()+'는 사용가능한 아이디입니다');
            } else {
               // 사용중인 아이디
               alert($('#id').val()+'는 사용중인 아이디입니다');
            }
         }
      });
   });   
   
	$('#addCustomerBt').click(function() {
		// 폼 유효성 검사
		// 폼 액션 전송
		console.log('회원가입 클릭');
		if($('#customerIdCk').val()==""){
			alert('아이디를 입력해주세요!');
			return false;
		}
		if($('#addCustomerName').val()==""){
			alert('이름을 입력해주세요!');
			return false;
		}
		if($('#addCustomerPw').val()==""){
			alert('비밀번호를 입력해주세요!');
			return false;
		}
		if($('#addCustomerAddress').val()==""){
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
		if($('#addCustomerPhone').val()==""){
			alert('전화번호를 입력해주세요!');
			return false;
		}
		if($('#addCustomerEmail').val()==""){
			alert('이메일을 입력해주세요!');
			return false;
		}

		$('#addCustomerForm').submit();
			alert('회원가입에 성공하였습니다!');
	});

</script>




	
</body>

</html>