<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<title>MEET PLAY SHARE, E1I6</title>

</head>

<body>
	<div>
		<!-- 네비바 -->
		<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import> 
	</div>
	
	<div><img src="${pageContext.request.contextPath}/img/snackhome.png"></div>
	<div class="container">
		
		<ul class="nav nav-tabs" id="postTab" style="font-weight: bold; margin-top: 40px;" >
			<li class="nav-item"><a data-toggle="tab" href="#tab1" class="nav-link"  style="color: black;" >베스트</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab2" class="nav-link"  style="color: black;">관람권</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab3" class="nav-link"  style="color: black;">콤보</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab4" class="nav-link active"  style="color: black;">팝콘</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab5" class="nav-link"  style="color: black;">스낵</a></li>
			<li class="nav-item"><a data-toggle="tab" href="#tab6" class="nav-link"  style="color: black;">음료</a></li>
		</ul>
		<div class="tab-content" id="postTabContent" style="margin-top: 40px;">
			<div id="tab1" class="tab-pane fade">
				
				<table>
					<tr>
					<div>
					 	<c:forEach var="b" items="${best}" varStatus="s">
					 		<c:if test = "${s.index != 0; s.index%3==0}">
					 			</tr><tr>
					 		</c:if>
					 		<td>
					 			<div> 
					 				<a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
					 				<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="370" height="370"></a>
					 				<div style="text-align: center; font-weight: bold; font-size: 15px;">
					 					${b.snackName}
					 				</div>
					 				<div style="text-align: center; font-size: 24px;">
						 				<font color="#503396">
											 <fmt:formatNumber value="${b.snackPrice }"/>원 		
										</font>	
									</div>		 				
					 			</div>
					 		</td>
					 	</c:forEach>
					 </div>
			 		</tr>
			 	</table>	
			</div>
			<div id="tab2" class="tab-pane fade"> 
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack1}" varStatus="s">
				 		<c:if test = "${s.index != 0; s.index%3==0}">
				 			</tr><tr>
				 		</c:if>
				 		<td>
				 			<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
				 				<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="370" height="370"></a></div><br>
				 			<div style="text-align: center; font-weight: bold; font-size: 15px;">
					 					${b.snackName}
			 				</div>
			 				<div style="text-align: center; font-size: 24px;">
				 				<font color="#503396">
									 <fmt:formatNumber value="${b.snackPrice }"/>원 		
								</font>	
							</div>		 	
				 			<c:if test="${loginEmp != null }">
					 			<a> 삭제 </a>
				 			</c:if>
				 		</td>
				 	</c:forEach>
			 		</tr>
			 	</table>	
			</div>
			<div id="tab3" class="tab-pane fade ">
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack2}" varStatus="s">
				 		<c:if test = "${s.index != 0; s.index%3==0}">
				 			</tr><tr>
				 		</c:if>
				 		<td>
				 			<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
				 				<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="370" height="370"></a></div><br>
				 			<div style="text-align: center; font-weight: bold; font-size: 15px;">
					 					${b.snackName}
			 				</div>
			 				<div style="text-align: center; font-size: 24px;">
				 				<font color="#503396">
									 <fmt:formatNumber value="${b.snackPrice }"/>원 		
								</font>	
							</div>	
				 		</td>
				 	</c:forEach>
			 		</tr>
			 	</table>	
			</div>
			<div id="tab4" class="tab-pane fade show active">  
		  		<table>
					<tr>
				 	<c:forEach var="b" items="${snack3}" varStatus="s">
				 		<c:if test = "${s.index != 0; s.index%3==0}">
				 			</tr><tr>
				 		</c:if>
				 		<td>
				 			<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
				 				<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="370" height="370"></a></div><br>
				 			<div style="text-align: center; font-weight: bold; font-size: 15px;">
					 					${b.snackName}
			 				</div>
			 				<div style="text-align: center; font-size: 24px;">
				 				<font color="#503396">
									 <fmt:formatNumber value="${b.snackPrice }"/>원 		
								</font>	
							</div>	
				 		</td>
				 	</c:forEach>
			 		</tr>
			 	</table>	
			</div>
			<div id="tab5" class="tab-pane fade">
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack4}" varStatus="s">
				 		<c:if test = "${s.index != 0; s.index%3==0}">
				 			</tr><tr>
				 		</c:if>
				 		<td>
				 			<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
				 				<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="370" height="370"></a></div><br>
				 			<div style="text-align: center; font-weight: bold; font-size: 15px;">
					 					${b.snackName}
			 				</div>
			 				<div style="text-align: center; font-size: 24px;">
				 				<font color="#503396">
									 <fmt:formatNumber value="${b.snackPrice }"/>원 		
								</font>	
							</div>	
				 		</td>
				 	</c:forEach>
			 		</tr>
			 	</table>	
			</div>
			<div id="tab6" class="tab-pane fade"> 
				<table>
					<tr>
				 	<c:forEach var="b" items="${snack5}" varStatus="s">
				 		<c:if test = "${s.index != 0; s.index%3==0}">
				 			</tr><tr>
				 		</c:if>
				 		<td>
				 			<div><a href="${pageContext.request.contextPath}/snack/snackOne?snackKey=${b.snackKey}">
				 				<img src="${pageContext.request.contextPath}/snackImg/${b.fileName}.${b.fileType}" width="370" height="370"></a></div><br>
				 			<div style="text-align: center; font-weight: bold; font-size: 15px;">
					 					${b.snackName}
			 				</div>
			 				<div style="text-align: center; font-size: 24px;">
				 				<font color="#503396">
									 <fmt:formatNumber value="${b.snackPrice }"/>원 		
								</font>	
							</div>	
				 		</td>
				 	</c:forEach>
			 		</tr>
			 	</table>	
			</div>
	
		</div>
	</div>
	<div>
		<!-- footer -->
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>
	
</body>
</html>