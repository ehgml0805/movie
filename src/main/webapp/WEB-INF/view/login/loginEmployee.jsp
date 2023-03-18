<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 아작스 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- 로그인 전 -->
	
	<c:if test="${loginEmployee == null}">
		<h1>고객 로그인</h1>
		<form method="post" action="${pageContext.request.contextPath}/login/loginEmployee">
			<table>
				<tr>
					<th>employeeId</th>
					<td>
						<input type ="text" name="employeeId">
					</td>
				</tr>
				<tr>	
					<th>employeePw</th>
					<td>
						<input type ="password" name="employeePw">
					</td>	
				</tr>
			</table>
			<button type =submit>로그인</button>
		</form>	
	</c:if>
	
	

	

	<div>
		<a href="${pageContext.request.contextPath}/homeEx">이전</a>
	</div>
	
	<!-- 로그인되있는 상태라면 -->

	<c:if test="${loginEmployee != null }">
	
		<h1>${loginEmployee.employeeName}님 로그인 되어있습니다.</h1>
	
	</c:if>

</body>



</html>