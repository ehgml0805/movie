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
	         	</c:if>
	         </c:forEach>
	        </ul>
	    </div>
	</div>
	<form action="${pageContext.request.contextPath}/chatting/room" method="post">
	    <input type="text" name="name" class="form-control" value="${id}" readonly="readonly">
	    <button type="button" id="btn" class="btn btn-secondary">개설하기</button>
	</form>

	<script>
	
	$(document).ready(function(){
	
	    var roomName = "${roomName.name}";
	
	    if(roomName != "")
	        alert(roomName + "방이 개설되었습니다.");

	    $("#btn").on("click", function (e){

	        if($('#check').val() != null) // 이미 방이 만들어져 있으면
	        	alert("채팅방이 생성되어 있습니다.")
	        else 
	            $("form").submit();
	        
	    });
	
	});
	</script>
</body>
</html>