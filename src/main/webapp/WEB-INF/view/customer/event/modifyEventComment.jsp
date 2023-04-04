<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
        }
        h2 {
            margin-bottom: 30px;
        }
        button {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>댓글 수정</h2>
    <form method="post" action="${pageContext.request.contextPath}/customer/event/modifyEventComment">
        <input type="hidden" name="movieKey" value="${movieKey}">
        <input type="hidden" name="eventCommentKey" value="${eventCommentKey}">
        <input type="hidden" name="eventKey" value="${eventKey}">
        <div class="form-group">
            <label for="customerId">ID:</label>
            <input type="text" class="form-control" id="customerId" name="customerId" value="${customerId}" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="eventCommentContent">Comment:</label>
            <textarea class="form-control" id="eventCommentContent" rows="5" cols="50" name="eventCommentContent">${eventCommentContent}</textarea>
        </div>
        <button type="submit">수정</button>
    </form>
</div>
</body>
</html>