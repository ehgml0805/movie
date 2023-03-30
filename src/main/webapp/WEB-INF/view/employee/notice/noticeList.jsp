<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
<!-- employeeHead -->
<c:import url="/WEB-INF/inc/employeeHead.jsp"></c:import>
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
	a {
		color : #037B94;
	}
</style>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="${pageContext.request.contextPath}/home" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="${pageContext.request.contextPath}/employeeHome" class="stext-109 cl8 hov-cl1 trans-04">
				Admin Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				noticeList
			</span>
		</div>
	</div>

	<!-- Content page -->
	<section class="bg0 p-t-70 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg text-center">
					<!-- Main start -->
						<h2>공지사항 관리</h2><br>
						<div class="text-right">
							<a href="${pageContext.request.contextPath}/employee/notice/addNotice">공지등록</a>
						</div>
						<table class="table">
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>등록일</td>
							</tr>
							<c:forEach var="l" items="${list}">
								<tr>
									<td>${l.num}</td>
									<td>
										<a href="${pageContext.request.contextPath}/employee/notice/noticeOne?noticeKey=${l.noticeKey}">${l.noticeTitle}</a>
									</td>
									<td>${l.createdate}</td>
								</tr>
							</c:forEach>
						</table>
						<!-- 검색버튼 -->
						<div class="search">
							<form method="get" action="${pageContext.request.contextPath}/employee/notice/noticeList">
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
									<li class="page-item disabled"><a class="page-link" href="#">처음</a></li>
									<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
								</c:if>
								<!-- 첫페이지가 아닐때 -->
								<c:if test="${currentPage > 1}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/notice/noticeList?currentPage=1&searchWord=${searchWord}">처음</a></li>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/notice/noticeList?currentPage=${currentPage-1}&searchWord=${searchWord}"><</a></li>
								</c:if>
								<!-- startPage ~ endPage -->
								<c:forEach var="s" begin="${startPage}" end="${endPage}" step="1">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/notice/noticeList?currentPage=${s}&searchWord=${searchWord}">${s}</a></li>
								</c:forEach>
								<!-- 마지막페이지가 아닐때 -->
								<c:if test="${currentPage < lastPage}">
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/notice/noticeList?currentPage=${currentPage+1}&searchWord=${searchWord}">></a></li>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employee/notice/noticeList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a></li>
								</c:if>
								<!-- 마지막페이지에서 버튼클릭 disabled -->
								<c:if test="${currentPage >= lastPage}">
									<li class="page-item disabled"><a class="page-link" href="#">></a></li>
									<li class="page-item disabled"><a class="page-link" href="#">마지막</a></li>
								</c:if>
							</ul>
						</div>
					<!-- Main End -->
					</div>
				</div>
				
				<!-- 관리자 메뉴 -->
				<c:import url="/WEB-INF/inc/employeeMenu.jsp"></c:import>
				
			</div>
		</div>
	</section>	
	
	<!-- footer -->
	<c:import url="/WEB-INF/inc/employeeFooter.jsp"></c:import>

</body>
</html>