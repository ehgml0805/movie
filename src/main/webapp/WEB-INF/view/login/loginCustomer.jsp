<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 전 -->
	
	<c:if test="${loginCustomer == null}">
		<h1>고객 로그인</h1>
		<form method="post" action="${pageContext.request.contextPath}/login/loginCustomer">
			<table>
				<tr>
					<th>customerId</th>
					<td>
						<input type ="text" name="customerId">
					</td>
				</tr>
				<tr>	
					<th>customerPw</th>
					<td>
						<input type ="password" name="customerPw">
					</td>	
				</tr>
			</table>
			<button type =submit>로그인</button>
		</form>	
	</c:if>
	
	<a href="${pageContext.request.contextPath}/homeEx">이전</a>
	
	<!-- 로그인되있는 상태라면 -->

	<c:if test="${loginCustomer != null }">
	
		<h1>${loginCustomer.customerName}님 로그인 되어있습니다.</h1>
	
	</c:if>

</body>
</html>