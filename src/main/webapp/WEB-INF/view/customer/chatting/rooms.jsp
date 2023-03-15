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
	                    <li><a href="${pageContext.request.contextPath}/chatting/room?roomId=${l.roomId}">[${l.name}]</a></li>
	                </c:forEach>
                </ul>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/chatting/room" method="post">
            <input type="text" name="name" class="form-control">
            <button class="btn btn-secondary">개설하기</button>
        </form>

	<script>
	
	$(document).ready(function(){
	
	    var roomName = "${roomName.name}";
	
	    if(roomName != null)
	        alert(roomName + "방이 개설되었습니다.");
	
	    $(".btn-create").on("click", function (e){
	        e.preventDefault();
	
	        var name = $("input[name='name']").val();
	
	        if(name == "")
	            alert("Please write the name.")
	        else
	            $("form").submit();
	    });
	
	});
	</script>
</body>
</html>