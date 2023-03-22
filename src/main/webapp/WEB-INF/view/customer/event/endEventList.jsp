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
	    .events-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .event-item {
        width: 24%;
        box-sizing: border-box;
        margin-bottom: 20px;
    }

    .event-item img {
        max-width: 100%;
        height: auto;
    }
</style>
</head>
<body>
	<h1>종료된 이벤트</h1>
	<div class="events-container">
		<c:forEach var="e" items="${list}">
			<div class="event-item">
				<div>
					<img src="${pageContext.request.contextPath}/event-upload/${e.fileName}" width="200" height="200">
				</div>
				<a href="${pageContext.request.contextPath}/event/eventOne?eventKey=${e.eventKey}&movieKey=${e.movieKey}">${e.eventTitle}</a>
				${e.eventStartDate} ~ ${e.eventEndDate}
				<button type="button" id="winnerBtn_${e.eventKey}">당첨자 조회</button>
			</div>
		</c:forEach>
	</div>	
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