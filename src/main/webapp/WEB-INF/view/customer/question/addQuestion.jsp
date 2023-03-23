<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/movie/movieFn.js"></script>
<link rel="stylesheet" href="/resources/css/navbar.css" />
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
	<!-- 네비바 -->
	<c:import url="/WEB-INF/inc/menu.jsp"></c:import>
	<h2>문의사항</h2>
	<ul>
		<li>
			<small>고객님의 문의에 답변하는 직원은 <span style="color:red">고객 여러분의 가족 중 한 사람일 수 있습니다.</span><br>
			고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br>
			관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</small>
		</li>
		<li><small>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</small></li>
	</ul>
	<form method="post" action="${pageContext.request.contextPath}/customer/question/addQuestion">
		<table>
			<tr>
				<td>극장선택</td>
				<td>
					<select name="theaterRegion" id="theaterRegion">
						<option value="1">지역선택</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="대전/충청/세종">대전/충청/세종</option>
						<option value="부산/대구/경상">부산/대구/경상</option>
						<option value="광주/전라">광주/전라</option>
						<option value="강원">강원</option>
					</select>
					<select name="theaterName" id="theaterName">
						<option value="1">극장선택</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>문의유형</td>
				<td>
					<select name="questionCategoryKey">
						<option>문의유형 선택</option>
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.questionCategoryKey}">${c.questionCategory}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="questionTitle" id="questionTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="20" name="questionContent" id="questionContent"></textarea></td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
	<script>
		// 지역선택시
		$("#theaterRegion").on("change", function(){
			var sel = $(this).val(); // 선택한 지역 value
			console.log(sel);
			var str = "";
			var cnt = $("#theaterName option").length; // 현재 option수
			console.log(cnt);
			// 이전 선택 후 받은값 삭제
			if(cnt > 1) {
				console.log("삭제");
				for(var i = 1; i < cnt; i++) {
					$("#theaterName option:last").remove();
					console.log(i);
				}
			}
			
			// 지역을 선택했으면
			if(sel != "1") {
				$.ajax({
					url : "${pageContext.request.contextPath}/question/theaterList"
					, type : "get"
					, data : {theaterRegion : sel}
					, success : function(list) {
						for (var i = 0; i < list.length; i++) {
							str += "<option value=" + list[i].theaterKey + ">" + list[i].theaterName + "</option>";	
						}
						$("#theaterName").append(str); // append - 마지막에 추가
					}
				});
			}
		});
	</script>
</body>
</html>