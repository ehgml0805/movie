<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyMovie</title>
</head>
<body>
	<h1>영화 수정</h1>
	<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/employee/movie/modifyMovie" method="post">		
		<table border="1">
			<c:forEach var="m" items="${movie}">
				<c:if test="${m.poster eq 'Y'}">	
					<tr>
						<td rowspan="7">
							<c:choose>
								<c:when test="${m.movieCode ne '0'}">
									<img alt="영화이미지" src="${m.fileName}" width="300px" height="500px">
								</c:when>
								<c:otherwise>
									<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${m.fileName}" width="300px" height="500px">			
								</c:otherwise>
							</c:choose>
						</td>
						<td>영화 코드 : </td>
						<td>
							<input type="number" name="movieKey" value="${m.movieKey}" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td>영화 이름 : </td>
						<td>
							<input type="text" name="movieTitle" value="${m.movieTitle}">
						</td>
					</tr>
					<tr>
						<td>영화 정보 : </td>
						<td>
							<textarea name="movieInfo" rows="10" cols="150">${m.movieInfo}</textarea>
						</td>
					</tr>
					<tr>
						<td>영화 줄거리 : </td>
						<td>
							<textarea name="movieSummary" rows="20" cols="150">${m.movieSummary}</textarea>
						</td>
					</tr>
					<tr>
						<td>영화 등급 : </td>
						<td>
							<select name="grade">
								<c:choose>
									<c:when test="${m.grade eq 'ALL'}">
										<option value="ALL">전체관람가</option>
									</c:when>
									<c:when test="${m.grade eq '12'}">
										<option value="12">12세이상관람가</option>
									</c:when>
									<c:when test="${m.grade eq '15'}">
										<option value="15">15세이상관람가</option>
									</c:when>
									<c:when test="${m.grade eq '18'}">
										<option value="18">청소년관람불가</option>
									</c:when>
								</c:choose>
								<c:if test="${m.grade ne 'ALL'}">
									<option value="ALL">전체관람가</option>
								</c:if>
								<c:if test="${m.grade ne '12'}">
									<option value="12">12세이상관람가</option>
								</c:if>
								<c:if test="${m.grade ne '15'}">	
									<option value="15">15세이상관람가</option>
								</c:if>
								<c:if test="${m.grade ne '18'}">
									<option value="18">청소년관람불가</option>
								</c:if>								
							</select>
						</td>
					</tr>
					<tr>
						<td>개봉 일자 : </td>
						<td>
							<input type="date" name="openingdate" value="${m.openingdate}">
						</td>
					</tr>
					<tr>
						<td>활성화 여부 : </td>
						<td>
							<select name="active">
								<c:choose>
									<c:when test="${m.active eq 'Y'}">
										<option value="Y">상영중</option>
									</c:when>
									<c:otherwise>
										<option value="N">비활성화</option>
									</c:otherwise>
								</c:choose>
								<c:if test="${m.active ne 'Y'}">	
									<option value="Y">상영중</option>
								</c:if>
								<c:if test="${m.active ne 'N'}">
									<option value="N">비활성화</option>
								</c:if>									
							</select>
						</td>
					</tr>
				</c:if>
			</c:forEach>
			<c:forEach var="s" items="${stillCuts}">
				<tr>
					<td>
						<c:choose>
							<c:when test="${s.fileSize eq 0}">
								<a href="${pageContext.request.contextPath}/employee/stillCut/stillCutOne?stillCutKey=${s.stillCutKey}">
									<img alt="영화이미지" src="${s.fileName}">
								</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/employee/stillCut/stillCutOne?stillCutKey=${s.stillCutKey}">
									<img alt="영화이미지" src="${pageContext.request.contextPath}/stillCut-upload/${s.fileName}">
								</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>스틸컷 : </td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/stillCut/modifyStillCut?stillCutKey=${s.stillCutKey}">
							수정
						</a>
						&nbsp;
						<a href="${pageContext.request.contextPath}/employee/stillCut/removeStillCut?stillCutKey=${s.stillCutKey}&movieKey=${movieKey}">
							삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<a href="${pageContext.request.contextPath}/employee/stillCut/addStillCut?movieKey=${movieKey}">스틸컷 추가 등록</a>
		<button type="submit">수정</button>
	</form>	
</body>
</html>