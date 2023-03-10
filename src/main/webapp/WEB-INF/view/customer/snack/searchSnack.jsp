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
		<h3>검색결과</h3>
		<br>
		<c:if test="${empty list}">
			<h2>검색결과가 없습니다</h2>
		</c:if>
		<table>
			<tr>
				<c:forEach var="b" items= "${list}" varStatus="s">
					<c:if test="${s.index != 0 && s.index % 3 == 0}">
						</tr><tr>
					</c:if>
					<td>
						<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
							<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}"></a></div><br>
			 			<div style="text-align: center;">${b.snackName}</div>				
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>

</body>
</html>