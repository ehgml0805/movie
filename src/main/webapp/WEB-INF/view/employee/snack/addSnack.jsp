<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<c:import url="/WEB-INF/inc/menu.jsp">
		</c:import>
	</div>
	
	<div class="container">
		<h1>상품추가</h1>
		<hr style="height: 3px; background-color:black;">
		
		<form action ="${pageContext.request.contextPath}/employee/snack/insertSnack" method="post" enctype="multipart/form-data">
			<div>상품이름 : <input type="text" name="snackName"></div>
			<hr>
			<div>상품가격 : <input type="number" name="snackPrice"></div>
			<hr>
			<div>품절 유무 : Y<input type="radio" name="soldOut" value="Y">&nbsp;N<input type="radio" name="soldOut" value="N"></div>
			<div>
				품목종류 : &nbsp; <select name = "snackCategoryKey">
						<c:forEach var="c" items="${category}">
							<option value="${c.snackCategoryKey}">${c.categoryContent}</option>
						</c:forEach>
					</select>
			</div>
			<hr>
			<div>
				상품정보 : <textarea rows="3" cols="50" name= "snackContent"></textarea>
			</div>
			<hr>
			<div>
				사진(jpeg or png) : <input type="file" name="mf" accept="image/jpeg, image/png">
			</div>
			<hr>
			<button class="btn btn-outline-dark btn-lg" type="submit">상품 추가</button>
		</form>
		
	</div>

</body>
</html>