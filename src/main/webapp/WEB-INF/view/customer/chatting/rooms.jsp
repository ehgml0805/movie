<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div class="container">
	    <div>
	        <ul>
	         <c:forEach var="l" items="${list}">
	         	<c:if test="${l.name eq id}">
	         	<li><a id="check" href="${pageContext.request.contextPath}/chatting/room?roomId=${l.roomId}">${l.name}</a></li>
	         	<form id="f1" method="get" action="${pageContext.request.contextPath}/chatting/room">
	         		<input type="text" name="roomId" value="${l.roomId}">
	         	<button type="submit" id="btn2">입장</button>
	         	</form>
	            	
	         	</c:if>
	         </c:forEach>
	        </ul>
	    </div>
	</div>
	<form id="f2" action="${pageContext.request.contextPath}/chatting/room" method="post">
	    <input type="text" name="name" class="form-control" value="${id}" readonly="readonly">
	    <button type="button" id="btn" class="btn btn-secondary">개설하기</button>
	</form>

	<script>
	$(document).ready(function(){
		
		var roomName = "${roomName.name}";
		
	    if(roomName != "")
	    	$('#f1').submit();
	        //alert(roomName + "방이 개설되었습니다.");
	    
		$("#btn").bind("click", function(e){

		        if($('#check').val() != null) { // 이미 방이 만들어져 있으면
		        	$('#f1').submit();
				} else {
					$('#f2').submit();
					$('#f1').submit();
		        }
		    });
		$("#btn").trigger('click');
	});
			
	</script>
</body>
</html>