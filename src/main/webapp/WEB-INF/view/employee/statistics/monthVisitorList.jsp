<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 방문자 통계</title>
</head>
<body>
	<h1>월별 방문자 통계 ${year}년</h1>
    <table border="1">
		<thead>
  			<tr>
         		<th>월</th>
       			<th>총 방문자수</th>
       		</tr>
     	</thead>
     	<tbody>
       		<c:forEach var="mv" items="${monthVisitorList}">
         		<tr>
           			<td>${mv.month}</td>
           			<td>${mv.totalVisitors}</td>
         		</tr>
  		 	</c:forEach>
     	</tbody>
   	</table>
</body>
</html>