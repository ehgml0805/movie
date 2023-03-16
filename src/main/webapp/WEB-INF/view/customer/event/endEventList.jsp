<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<h1>종료된 이벤트 리스트</h1>
	<table border="1">
		<tr>
			<th>이벤트 제목</th>
			<th>이벤트 시작날짜</th>
			<th>이벤트 종료날짜</th>
			<th>당첨자 조회</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>
					<div>
						<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="200" height="200">
					</div>
					<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}&movieKey=${e.movieKey}">${e.eventTitle}</a>
				</td>
				<td>${e.eventStartDate}</td>
				<td>${e.eventEndDate}</td>
				<td><button type="button" id="winnerBtn_${e.eventKey}">당첨자 조회</button></td>
			</tr>
		</c:forEach>
	</table>
	<form method="get" action="${pageContext.request.contextPath}/event/endEventList">
		<input type="text" name="searchWord" value="${param.searchWord}">
		<button type="submit">이벤트 검색</button>
	</form>
	<div>
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
</body>
</html>