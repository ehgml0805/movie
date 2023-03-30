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

			<span class="stext-109 cl4">
				addQuestion
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
					<div class="p-r-45 p-r-0-lg text-center">
						<!-- Main start -->
						<h2>1:1문의</h2><br><hr>
						
						<ul style="text-align:left;">
							<li style="list-style-type:disc;">
								<small>고객님의 문의에 답변하는 직원은 <span style="color:red">고객 여러분의 가족 중 한 사람일 수 있습니다.</span><br>
								고객의 언어폭력(비하, 욕설, 협박, 성희롱 등)으로부터 직원을 보호하기 위해<br>
								관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.<br>&nbsp;</small>
							</li>
							<li style="list-style-type:disc;">
								<small>문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</small>
							</li>
						</ul><br>
						<div>
							<form method="post" action="${pageContext.request.contextPath}/customer/question/addQuestion">
								<table class="table text-center">
									<tr>
										<td>극장선택</td>
										<td>
											<select name="theaterRegion" id="theaterRegion" class="form-control">
												<option value="1">지역선택</option>
												<option value="서울">서울</option>
												<option value="경기">경기</option>
												<option value="인천">인천</option>
												<option value="대전/충청/세종">대전/충청/세종</option>
												<option value="부산/대구/경상">부산/대구/경상</option>
												<option value="광주/전라">광주/전라</option>
												<option value="강원">강원</option>
											</select>
											<select name="theaterName" id="theaterName" class="form-control">
												<option value="1">극장선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>문의유형</td>
										<td>
											<select name="questionCategoryKey" class="form-control">
												<option>문의유형 선택</option>
												<c:forEach var="c" items="${categoryList}">
													<option value="${c.questionCategoryKey}">${c.questionCategory}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>제목</td>
										<td><input type="text" name="questionTitle" id="questionTitle" class="form-control"></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea rows="5" cols="20" name="questionContent" id="questionContent" class="form-control"></textarea></td>
									</tr>
								</table>
								<button type="submit" class="form-control">등록</button>
							</form>
						</div>
						<!-- Main End -->
					</div>
				</div>
			</div>
		</div>
	</section>	
	
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