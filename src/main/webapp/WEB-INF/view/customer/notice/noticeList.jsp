<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="../img/favicon-32x32.png"> 
<style>
	.search {
		margin-top: 10px;
		text-align: center;
	}
	.search input[name="searchWord"],
	.search button[type="submit"] {
  		border: 1px solid #ccc;
	  	border-radius: 6px;
	  	padding: 3px 10px;
	  	display: inline-block;
	  	vertical-align: middle; 
	}
	.page-link {
		color: black;
	}
</style>
</head>
<body class="animsition">
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu-white.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/home" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				noticeList
			</span>
		</div>
	</div>
	
	<!-- Content page -->
	<section class="bg0 p-t-30 p-b-20">
		<div class="container">
			<div class="row">
				<!-- 고객 고객센터 메뉴 -->
				<c:import url="/WEB-INF/inc/customerMenu.jsp"></c:import>
				
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg text-center m-4">
						<!-- Main start -->
						<h2>공지사항</h2><br><br>

						<table class="table table-striped">
							<tr style="border-bottom-width:2px; border-top-width:2px;">
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
							</tr>
							<c:forEach var="l" items="${list}">
								<tr>
									<td>${l.num}</td>
									<td>
										<a href="${pageContext.request.contextPath}/notice/noticeOne?noticeKey=${l.noticeKey}">${l.noticeTitle}</a>
									</td>
									<td>${l.createdate}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 검색버튼 -->
						<div class="search">
							<form method="get" action="${pageContext.request.contextPath}/notice/noticeList">
								<div class="col">	
									<input type="text" name="searchWord" value="${param.searchWord}">
									<button type="submit"><i class="zmdi zmdi-search"></i></button>
								</div> 
							</form>
						</div>
						<!-- 페이징 -->
						<div class="container mt-3">
							<ul class="pagination justify-content-center">
								<!-- 1페이지에서 첫페이지,이전 버튼클릭 disabled -->
								<c:if test="${currentPage <= 1}">
									<li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
								</c:if>
								<!-- 첫페이지가 아닐때 -->
								<c:if test="${currentPage > 1}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=1&searchWord=${searchWord}"><<</a></li>
								</c:if>
								<!-- startPage ~ endPage -->
								<c:forEach var="s" begin="${startPage}" end="${endPage}" step="1">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${s}&searchWord=${searchWord}">${s}</a></li>
								</c:forEach>
								<!-- 마지막페이지가 아닐때 -->
								<c:if test="${currentPage < lastPage}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${lastPage}&searchWord=${searchWord}">>></a></li>
								</c:if>
								<!-- 마지막페이지에서 버튼클릭 disabled -->
								<c:if test="${currentPage >= lastPage}">
									<li class="page-item disabled"><a class="page-link" href="#">>></a></li>
								</c:if>
							</ul>
						</div>
						<!-- Main End -->
					</div>
				</div>
			</div>
		</div>
	</section>	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>
	
</body>
</html>