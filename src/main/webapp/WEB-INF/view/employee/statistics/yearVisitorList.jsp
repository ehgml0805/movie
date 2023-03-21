<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>년도별 총 방문자 수</h1>
	<table border="1">
		<thead>
 			<tr>
        		<th>년도</th>
      			<th>총 방문자 수</th>
      		</tr>
    	</thead>
    	<tbody>
 			<c:forEach var="yv" items="${yearVisitorList}">
        		<tr>
          			<td>${yv.year}</td>
         			<td>${yv.totalVisitors}</td>
        		</tr>
      		</c:forEach>
   		</tbody>
  	</table>
</body>
</html>