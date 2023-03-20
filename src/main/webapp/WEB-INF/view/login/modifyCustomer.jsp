<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<h1>회원수정</h1>
	

	<form method ="post" action ="${pageContext.request.contextPath}/login/modifyCustomer" >
		<table>
			<tr>
				<th>프로필 사진</th>
				<td>
					<input type="file" name="customerImgList">
					<c:if test="${map.fileName ne null}">
						<div><img src="${pageContext.request.contextPath}/customer-upload/${map.fileName}" name="customerImgFileName"></div>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type ="text" id = "customerId" name="customerId" value="${loginCustomer.customerId}" readonly="readonly">
				</td>
			</tr>
			<tr>	
				<th>이름</th>
				<td>
					<input type ="text" id="customerName" name="customerName" value="${loginCustomer.customerName}">
				</td>
			</tr>
			
			<!-- 카카오회원은 비밀번호를 수정할 수 없다 -->
			<c:if test="${empty loginCustomer.oauth}">
			<tr>	
				<th>비밀번호</th>
				<td>
					<input type ="password" id ="customerPw" name="customerPw">
				</td>
			</tr>
			
			</c:if>
			<tr>	
				<th>주소</th>
				<td>
					<input type ="text" id ="customerAddress" name="customerAddress" value="${loginCustomer.customerAddress}">
				</td>
			</tr>
			<tr>	
				<th>생일</th>
				<td>
					<input type ="date" id ="customerBirthday" name="customerBirthday" value="${loginCustomer.customerBirthday}">
				</td>
			</tr>
			<tr>	
				<th>성별</th>
				<c:if test="${loginCustomer.customerGender =='M'}">
				<td>
					<input type ="radio" id ="customerGender" name="customerGender" value="M" checked>남자
					<input type ="radio" id ="customerGender" name="customerGender" value="F" >여자
				</td>
				</c:if>
				<c:if test="${loginCustomer.customerGender =='F'}">
				<td>
					<input type ="radio" id ="customerGender" name="customerGender" value="M" >남자
					<input type ="radio" id ="customerGender" name="customerGender" value="F" checked >여자
				</td>
				</c:if>
			</tr>
			<tr>	
				<th>휴대폰 번호</th>
				<td>
					<input type ="tel" id ="customerPhone" name="customerPhone" placeholder="000-0000-0000" value="${loginCustomer.customerPhone}"
						pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
     					required
     					minlength="13"
						maxlength="13">
				</td>
			</tr>
			<!-- 카카오 회원은 email을 수정할 수 없다 -->
			<c:if test="${empty loginCustomer.oauth}">
				<tr>	
					<th>Email</th>
					<td>
						<input type ="email" id ="customerEmail" name="customerEmail"  value="${loginCustomer.customerEmail}"
							 size="30" required >
					</td>
				</tr>
			</c:if>
			
			
			
			
		</table>
		<button type ="submit" id="addBtn">회원수정</button>

	
	</form>

</body>
</html>