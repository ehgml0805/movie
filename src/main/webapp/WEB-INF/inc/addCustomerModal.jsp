<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<body>

	<!-- 회원가입 모달 -->
	<div class="modal fade" id="modal-addCutomer-form" data-bs-backdrop="static" tabindex="-1" aria-labelledby="addCustomerFormModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="addCustomerFormModalLabel">로그인</h5>
				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<div class="modal-body">
				<form action="${pageContext.request.contextPath}/login/addCustomer" method="post" id="form-addCustomer">
					아이디
					<input type="text" class="form-control" name="customerId" id="customerId" placeholder="아이디" maxlength="12" />
					이름
					<input type="text" class="form-control mt-3" name="customerName" id="customerName" placeholder="이름" />
					비밀번호
					<input type="password" class="form-control mt-3" name="customerPw" id="customerPw" placeholder="비밀번호"  />
					주소
					<input type="text" class="form-control mt-3" name="customerAddress" id="customerAddress" placeholder="주소"  />
					생일
					<input type ="date"  class="form-control mt-3" id ="customerBirthday" name="customerBirthday">
					성별
					<input type ="radio" class="form-control mt-3" id ="customerGender" name="customerGender" value="M" checked>남자
					<input type ="radio" class="form-control mt-3" id ="customerGender" name="customerGender" value="F" >여자
					전화번호
					<input type ="tel" class="form-control mt-3"  id ="customerPhone" name="customerPhone"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
     					required
     					minlength="13"
						maxlength="13">
					e-mail
					<input type ="email"  class="form-control mt-3" id ="customerEmail" name="customerEmail" 
						 size="30" required>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="addCustomerbt">회원가입</button>
				</div>
				
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">

</script>