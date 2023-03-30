<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ LIST</title>
<style>  
	.table-container {
  		display: flex;
  		justify-content: center;
  		align-items: center;
  		width: 70%;
  		margin-left: 15%;
	}
	.centered-table {
 		margin-left: auto;
 		margin-right: auto;
	}
	.content {
		display: none;
		width: 90%;
		padding: 10px;
		margin: 0 auto;
		background-color: #f2f2f2;
		border: 1px solid #ccc;
		border-radius: 5px;
		box-shadow: 0px 2px 2px #ccc;
	}
  	.title:hover {
	    background: silver;
  	}  	
  	
	.pagination {
  		display: flex;
  		justify-content: center;
	}
	
	.pagination {
		margin-top: 30px;
	}
	.pagination a {
		display: inline-block;
		margin: 0 5px;
		padding: 5px 10px;
		background-color: #f2f2f2;
		border: 1px solid #ddd;
		color: black;
		text-decoration: none;
	}
	.pagination a.active {
		background-color: dodgerblue;
		color: white;
	}
	.pagination a.disabled {
		color: #ddd;
		pointer-events: none;
	}
	.search {
		margin-top: 30px;
		text-align: center;
	}
	.search input[name="searchWord"],
	.search button[type="submit"] {
  		border: 1px solid #ccc;
	  	border-radius: 5px;
	  	padding: 5px 10px;
	  	margin: 0 5px; /* add some margin to separate the input and button */
	  	display: inline-block; /* set both elements to display inline-block */
	  	vertical-align: middle; /* vertically center both elements */
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<link rel="icon" type="image/png" href="../resources2/images/icons/favicon.png"/>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/vendor/animate/animate.css">
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="../resources2/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/css/util.css">
<link rel="stylesheet" type="text/css" href="../resources2/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<div style="margin-top: 100px;">
		<a href="${pageContext.request.contextPath}/employee/faq/addFaq">FAQ 등록</a>
		<h3 class="text-center">자주 묻는 질문</h3>			
		<!-- 질문 검색 -->
		<div class="search">
			<form method="get" action="${pageContext.request.contextPath}/faq/faqList">
				<div class="col">	
					<input type="text" name="searchWord" value="${param.searchWord}">
					<button type="submit">질문 검색</button>
				</div> 
			</form>
		</div>
	</div>
	<div class="table-container">
		<table class="table centered-table">
			<tr>
				<th>자주 묻는 질문</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="f" items="${faqList}">
				<tr>
					<td>
						<div class="box">
							<span class="title" style="cursor:pointer;">Q. ${f.faqQuestion}</span>
							<div class="content" style="display:none">A. ${f.faqAnswer}</div>
						</div>
					</td>
					<td><a href="${pageContext.request.contextPath}/employee/faq/modifyFaq?faqKey=${f.faqKey}&faqQuestion=${f.faqQuestion}&faqAnswer=${f.faqAnswer}">수정</a></td>
					<td><a href="${pageContext.request.contextPath}/employee/faq/removeFaq?faqKey=${f.faqKey}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>					
	<script>
		$(document).ready(function() {
			$(".title").click(function(){
				var content = $(this).next('.content');
				if (content.is(":visible")){
					content.hide();
				} else {
					$('.content').not(content).hide();
					content.show();
				}
			});
		});
	</script>
	<!-- 페이징 -->
	<div class="pagination">
		<a href="${pageContext.request.contextPath}/faq/faqList?currentPage=1&searchWord=${searchWord}">처음으로</a>		
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/faq/faqList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/faq/faqList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/faq/faqList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/faq/faqList?currentPage=${lastPage}&searchWord=${searchWord}">끝으로</a>	
	</div>	
</body>
</html>