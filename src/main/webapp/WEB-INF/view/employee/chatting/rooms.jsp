<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
<style>
*{
	box-sizing:border-box;
}
body{
	background-color:#777777;
	font-family:Arial;
}
#container{
	width:750px;
	height:800px;
	background:#eff3f7;
	margin:0 auto;
	font-size:0;
	border-radius:5px;
	overflow:hidden;
}
aside{
	width:260px;
	height:800px;
	background-color:#3b3e49;
	display:inline-block;
	font-size:15px;
	vertical-align:top;
}
main{
	width:490px;
	height:800px;
	display:inline-block;
	font-size:15px;
	vertical-align:top;
}

aside header{
	padding:30px 20px;
	color:#fff;
}
aside input{
	width:100%;
	height:50px;
	line-height:50px;
	padding:0 50px 0 20px;
	background-color:#5e616a;
	border:none;
	border-radius:3px;
	color:#fff;
	background-image:url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat:no-repeat;
	background-position:170px;
	background-size:40px;
}
aside input::placeholder{
	color:#fff;
}
aside ul{
	padding-left:0;
	margin:0;
	list-style-type:none;
	height:690px;
}
aside li{
	padding:10px 0;
}
aside li:hover{
	background-color:#5e616a;
}
h2,h3{
	margin:0;
}
aside li img{
	border-radius:50%;
	margin-left:20px;
	margin-right:8px;
}
aside li div{
	display:inline-block;
	vertical-align:top;
	margin-top:12px;
}
aside li h2{
	font-size:14px;
	color:#fff;
	font-weight:normal;
	margin-bottom:5px;
}
aside li h3{
	font-size:12px;
	color:#7e818a;
	font-weight:normal;
}

.status{
	width:8px;
	height:8px;
	border-radius:50%;
	display:inline-block;
	margin-right:7px;
}
.green{
	background-color:#58b666;
}
.orange{
	background-color:#ff725d;
}
.blue{
	background-color:#6fbced;
	margin-right:0;
	margin-left:7px;
}

main header{
	height:98px;
	padding:30px 20px 30px 40px;
}
main header > *{
	display:inline-block;
	vertical-align:top;
}
main header img:first-child{
	border-radius:50%;
}
main header img:last-child{
	width:24px;
	margin-top:8px;
}
main header div{
	margin-left:10px;
	margin-right:145px;
}
main header h2{
	font-size:16px;
	margin-bottom:5px;
}
main header h3{
	font-size:14px;
	font-weight:normal;
	color:#7e818a;
}

#chatArea{
	padding-left:0;
	margin:0;
	list-style-type:none;
	overflow-y:scroll;
	height:535px;
	border-top:2px solid #fff;
	border-bottom:2px solid #fff;
}
#chatArea li{
	padding:10px 30px;
}
#chatArea h2,#chatArea h3{
	display:inline-block;
	font-size:13px;
	font-weight:normal;
}
#chatArea h3{
	color:#bbb;
}
#chatArea .entete{
	margin-bottom:5px;
}
#chatArea .msg{
	padding:20px;
	color:#fff;
	line-height:25px;
	max-width:90%;
	display:inline-block;
	text-align:left;
	border-radius:5px;
}
#chatArea .me{
	text-align:right;
}
#chatArea .you .msg{
	background-color:#58b666;
}
#chatArea .me .msg{
	background-color:#6fbced;
}
#chatArea .triangle{
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}
#chatArea .you .triangle{
		border-color: transparent transparent #58b666 transparent;
		margin-left:15px;
}
#chatArea .me .triangle{
		border-color: transparent transparent #6fbced transparent;
		margin-left:375px;
}

main footer{
	height:155px;
	padding:20px 30px 10px 20px;
}
main footer textarea{
	resize:none;
	border:none;
	display:block;
	width:100%;
	height:80px;
	border-radius:3px;
	padding:20px;
	font-size:13px;
	margin-bottom:13px;
}
main footer textarea::placeholder{
	color:#ddd;
}
main footer img{
	height:30px;
	cursor:pointer;
}
main footer button{
	text-decoration:none;
	text-transform:uppercase;
	font-weight:bold;
	border:none;
	color:#6fbced;
	vertical-align:top;
	margin-left:333px;
	margin-top:5px;
	display:inline-block;
}
a
, a:link {
  color: skyblue;
}
skyblue
a:visited
, a:hover {
  color: white;
}


</style>
</head>
<body>
<div id="container">
	<aside>
		<header>
			<h2>문의목록</h2>
		</header><hr>
		<ul>
			<c:if test="${empty list}"><li><h2 style="text-align: center;">채팅요청 없음.</h2></li></c:if>
			<c:forEach var="l" items="${list}">
				<li>
					<img src="" alt="">
					<div>
						<h2><a href="${pageContext.request.contextPath}/chatting/room?roomId=${l.roomId}">${l.name}</a></h2>
					</div>
				</li>
			</c:forEach>
		</ul>
	</aside>
</div>
</body>
</html>