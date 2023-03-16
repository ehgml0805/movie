<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ LIST</title>
<style>
  .title:hover {
    background: silver;
  }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1>자주 묻는 질문</h1>
	<a href="${pageContext.request.contextPath}/employee/faq/addFaq">FAQ 등록</a>
	<!-- 질문 검색 -->
	<form method="get" action="${pageContext.request.contextPath}/faq/faqList">
		<input type="text" name="searchWord" value="${param.searchWord}">
		<button type="submit">질문 검색</button>
	</form>
	<table border="1">
		<tr>
			<th>No</th>
			<th>자주 묻는 질문</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="f" items="${faqList}">
			<tr>
				<td>${f.faqKey}</td>
				<td>
					<div class="box">
						<li class="title" style="cursor:pointer;">
							${f.faqQuestion}
							<ul class="content" style="display:none">
								<li>${f.faqAnswer}</li>
							</ul>
						</li>						
					</div>
				</td>
				<td><a href="${pageContext.request.contextPath}/employee/faq/modifyFaq?faqKey=${f.faqKey}&faqQuestion=${f.faqQuestion}&faqAnswer=${f.faqAnswer}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/employee/faq/removeFaq?faqKey=${f.faqKey}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
    <script>
    	$(".title").click(function(){
        	if($(".content").is(":visible")){
            	$(".content").css("display","none");
          	}
          	else{
              	$(".content").css("display","block");
          	}
      	})
   </script>
	<!-- 페이징 -->
	<div>
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