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
		<div><img src="${pageContext.request.contextPath}/img/snackhome.png"></div>
		<ul class="nav nav-tabs" id="postTab" style="font-weight: bold; margin-top: 40px;" >
			<li class="nav-item"><a data-toggle="tab" href="#tab0" class="nav-link active"  style="color: black;" >베스트</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab1" class="nav-link"  style="color: black;">관람권</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab2" class="nav-link"  style="color: black;">콤보</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab3" class="nav-link"  style="color: black;">팝콘</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab4" class="nav-link"  style="color: black;">스낵</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab5" class="nav-link"  style="color: black;">음료</a></li>
		</ul>
		<div class="tab-content" id="postTabContent" style="margin-top: 40px;">
			<div id="tab0" class="tab-pane fade show active"> 
				<table>
					<tr>
				 	<c:forEach var="b" items="${best}" varStatus="s">
				 		<c:if test = "${s.inext != 0; s.index%3==0}">
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
			<div id="tab1" class="tab-pane fade"> 
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack1}" varStatus="s">
				 		<c:if test = "${s.inext != 0; s.index%3==0}">
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
			<div id="tab2" class="tab-pane fade">
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack2}" varStatus="s">
				 		<c:if test = "${s.inext != 0; s.index%3==0}">
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
			<div id="tab3" class="tab-pane fade">  
		  		<table>
					<tr>
				 	<c:forEach var="b" items="${snack3}" varStatus="s">
				 		<c:if test = "${s.inext != 0; s.index%3==0}">
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
			<div id="tab4" class="tab-pane fade">
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack4}" varStatus="s">
				 		<c:if test = "${s.inext != 0; s.index%3==0}">
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
			<div id="tab5" class="tab-pane fade"> 
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack5}" varStatus="s">
				 		<c:if test = "${s.inext != 0; s.index%3==0}">
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
	
		</div>
	</div>
</body>
</html>