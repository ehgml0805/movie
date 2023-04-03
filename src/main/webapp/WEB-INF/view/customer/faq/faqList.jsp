<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEET PLAY SHARE, E1I6</title>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
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
				faqList
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
						<h2>자주 묻는 질문</h2><br><br>
						
						<c:if test="${not empty loginEmployee}">
							<div style="text-align:right;">
								<a href="${pageContext.request.contextPath}/employee/faq/addFaq">FAQ 등록</a>
							</div>
						</c:if>
						<table class="table table-striped">
							<tr style="border-bottom-width:2px; border-top-width:2px;">
								<th>자주 묻는 질문</th>
								<c:if test="${not empty loginEmployee}">
									<th>수정</th>
									<th>삭제</th>
								</c:if>
							</tr>
							<c:forEach var="f" items="${faqList}">
								<tr>
									<td>
										<div class="box">
											<span class="title" style="cursor:pointer;">Q. ${f.faqQuestion}</span>
											<div class="content" style="display:none">A. ${f.faqAnswer}</div>
										</div>
									</td>
									<c:if test="${not empty loginEmployee}">
										<td><a href="${pageContext.request.contextPath}/employee/faq/modifyFaq?faqKey=${f.faqKey}&faqQuestion=${f.faqQuestion}&faqAnswer=${f.faqAnswer}">수정</a></td>
										<td><a href="${pageContext.request.contextPath}/employee/faq/removeFaq?faqKey=${f.faqKey}">삭제</a></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
						<!-- 질문 검색 -->
						<div class="search">
							<form method="get" action="${pageContext.request.contextPath}/faq/faqList">
								<div class="col">	
									<input type="text" name="searchWord" value="${param.searchWord}">
									<button type="submit">질문 검색</button>
								</div> 
							</form>
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
						<!-- Main End -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 채팅 아이콘 -->
	<c:import url="/WEB-INF/inc/chat.jsp"></c:import>
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/inc/footer.jsp"></c:import> 
	</div>

</body>
</html>