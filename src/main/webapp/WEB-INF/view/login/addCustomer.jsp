<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<body>
	<h1>회원가입</h1>
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>	
	<div>${errorMsg}</div>
	
	<form method ="post" action ="${pageContext.request.contextPath}/login/addCustomer">
		<table>
			<tr>
				<th>customerId</th>
				<td>
					<input type ="text" id = "customerId" name="customerId">
				</td>
			</tr>
			<tr>	
				<th>customerName</th>
				<td>
					<input type ="text" id="customerName" name="customerName">
				</td>
			</tr>
			<tr>	
				<th>customerPw</th>
				<td>
					<input type ="password" id ="customerPw" name="customerPw">
				</td>
			</tr>
			<tr>	
				<th>customerAddress</th>
				<td>
					<input type ="text" id ="customerAddress" name="customerAddress">
				</td>
			</tr>
			<tr>	
				<th>customerBirthday</th>
				<td>
					<input type ="date" id ="customerBirthday" name="customerBirthday">
				</td>
			</tr>
			<tr>	
				<th>customerGender</th>
				<td>
					<input type ="radio" id ="customerGender" name="customerGender" value="M" checked>남자
					<input type ="radio" id ="customerGender" name="customerGender" value="F" >여자
				</td>
			</tr>
			<tr>	
				<th>customerPhone</th>
				<td>
					<input type ="tel" id ="customerPhone" name="customerPhone"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
     					required
     					minlength="13"
						maxlength="13">
				</td>
			</tr>
			<tr>	
				<th>customerEmail</th>
				<td>
					<input type ="email" id ="customerEmail" name="customerEmail" 
						 size="30" required>
				</td>
			</tr>
			
			
		</table>
		<button type ="submit" id="addBtn">회원가입</button>

	
	</form>
</body>
<script>

	$('#ckBtn').click(function(){
		$.ajax({
			url:'idck'
			, type:'get'
			, data : {customerId:$('#id').val()}
			, success:function(model){ // model : 'YES' / 'NO'
				if(model=='YES') {
					// 사용가능한 아이디
					$('#customerId').val($('#id').val());
				} else {
					// 사용중인 아이디
					alert($('#id').val()+'는 사용중인 아이디입니다');
				}
			}
		});
	});
	
	

	$('#addBtn').click(function(){
		console.log("form action 전송");
		
	})

</script>
</html>