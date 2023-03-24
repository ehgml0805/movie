<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
	  $("button[id^='winnerBtn_']").click(function() {
	    var eventKey = $(this).attr('id').split('_')[1];
	    $.get('${pageContext.request.contextPath}/event/eventWinnerList?eventKey=' + eventKey, function(data) {
	      // remove any existing modal before opening a new one
	      $('.modal').remove();
	      
	      var modal = $('<div/>', {
	        class: 'modal',
	        html: data
	      });
	      modal.appendTo($('body'));
	    });
	  });

	  $(document).on('click', '.modal', function() {
	    $(this).remove();
	  });
	});
</script>
<style>
	.modal {
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0, 0, 0, 0.5);
	  display: flex;
	  flex-direction: column-reverse; /* add this line */
	  justify-content: center;
	  align-items: center;
	}

	.modal-content {
	  background-color: #fff;
	  padding: 20px;
	  border-radius: 5px;
	}
	.modal-header {
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-bottom: 10px;
	}
	.modal-header h2 {
		margin: 0;
	}
	.modal-close {
		cursor: pointer;
	}
	.modal-body {
		margin-bottom: 10px;
	}
	.modal-table {
		width: 100%;
		border-collapse: collapse;
	}
	.modal-table th,
	.modal-table td {
		padding: 8px;
		text-align: center;
		border: 1px solid #ddd;
	}
	.modal-table th {
		background-color: #f2f2f2;
		font-weight: bold;
	}
    .events-container {
        display: flex;
        flex-wrap: wrap;
    }

    .event-item {
        width: 24%;
        box-sizing: border-box;
        margin-bottom: 20px;
    }
	.pagination {
		margin-top: 30px;
		justify-content: center;
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
</style>
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<div class="container">		
		<h3>종료된 이벤트</h3>
		<div class="events-container">
			<c:forEach var="e" items="${list}">
				<div class="event-item">
					<div>
						<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="250" height="250">
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}&movieKey=${e.movieKey}">${e.eventTitle}</a>
					</div>			
					<div>${e.eventStartDate} ~ ${e.eventEndDate}</div>
					<button type="button" id="winnerBtn_${e.eventKey}">당첨자 조회</button>
				</div>
			</c:forEach>
		</div>
	</div>		
	<div class="pagination">
		<a href="${pageContext.request.contextPath}/event/endEventList?currentPage=1&searchWord=${searchWord}">처음으로</a>		
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/event/endEventList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<a href="${pageContext.request.contextPath}/event/endEventList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<a href="${pageContext.request.contextPath}/event/endEventList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/event/endEventList?currentPage=${lastPage}&searchWord=${searchWord}">끝으로</a>	
	</div>	
	<div class="search">
		<form method="get" action="${pageContext.request.contextPath}/event/endEventList">
			<input type="text" name="searchWord" value="${param.searchWord}">
			<button type="submit">이벤트 검색</button>
		</form>
	</div>	
</body>
</html>