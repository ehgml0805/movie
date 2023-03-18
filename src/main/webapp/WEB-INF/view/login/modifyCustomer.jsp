<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<h1>회원가입</h1>
	

	<form method ="post" action ="${pageContext.request.contextPath}/login/modifyCustomer" enctype="multipart/form-data">
		<table>
			<tr>
				<th>프로필 사진</th>
				<td>
					<input type="file" name="customerImgList">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type ="text" id = "customerId" name="customerId">
				</td>
			</tr>
			<tr>	
				<th>이름</th>
				<td>
					<input type ="text" id="customerName" name="customerName">
				</td>
			</tr>
			<tr>	
				<th>비밀번호</th>
				<td>
					<input type ="password" id ="customerPw" name="customerPw">
				</td>
			</tr>
			<tr>	
				<th>주소</th>
				<td>
					<input type ="text" id ="customerAddress" name="customerAddress">
				</td>
			</tr>
			<tr>	
				<th>생일</th>
				<td>
					<input type ="date" id ="customerBirthday" name="customerBirthday">
				</td>
			</tr>
			<tr>	
				<th>성별</th>
				<td>
					<input type ="radio" id ="customerGender" name="customerGender" value="M" checked>남자
					<input type ="radio" id ="customerGender" name="customerGender" value="F" >여자
				</td>
			</tr>
			<tr>	
				<th>휴대폰 번호</th>
				<td>
					<input type ="tel" id ="customerPhone" name="customerPhone"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
     					required
     					minlength="13"
						maxlength="13">
				</td>
			</tr>
			<tr>	
				<th>Email</th>
				<td>
					<input type ="email" id ="customerEmail" name="customerEmail" 
						 size="30" required>
				</td>
			</tr>
			
			
		</table>
		<button type ="submit" id="addBtn">회원수정</button>

	
	</form>

</body>
</html>