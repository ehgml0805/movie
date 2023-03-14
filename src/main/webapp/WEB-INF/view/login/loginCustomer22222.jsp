<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 아작스 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<!-- 로그인 전 -->
	
	<c:if test="${loginCustomer == null}">
		<h1>고객 로그인</h1>
		<form method="post" action="${pageContext.request.contextPath}/login/loginCustomer">
			<table>
				<tr>
					<th>customerId</th>
					<td>
						<input type ="text" name="customerId">
					</td>
				</tr>
				<tr>	
					<th>customerPw</th>
					<td>
						<input type ="password" name="customerPw">
					</td>	
				</tr>
			</table>
			<button type =submit>로그인</button>
		</form>	
	</c:if>
	
	
	<a id="kakao-login-btn" style="height:60px"></a>
	<div>
		<button class="api-btn" onclick="unlinkApp()">앱 탈퇴하기</button>
	</div>
	
	<!-- 회원정보 -->
	<div id="result"></div>
	
	
	
<script type="text/javascript">
		Kakao.init('354961f41da8a861e9c33f13288fc62f');
		console.log(Kakao.isInitialized());
		 
		  Kakao.Auth.createLoginButton({
		    container: '#kakao-login-btn',
		    success: function(authObj) {
		      Kakao.API.request({
		        url: '/v2/user/me',
		        success: function(result) {
		          $('#result').append(result);
		          id = result.id
		          connected_at = result.connected_at
		          kakao_account = result.kakao_account
		          $('#result').append(kakao_account);
		          resultdiv="<h2>로그인 성공 !!"
		          resultdiv += '<h4>id: '+id+'<h4>'
		          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
		          email ="";
		          gender = "";
		          if(typeof kakao_account != 'undefined'){
		        	  email = kakao_account.email;
		        	  gender = kakao_account.gender;
		          }
		          resultdiv += '<h4>email: '+email+'<h4>'
		          resultdiv += '<h4>gender: '+gender+'<h4>'
		          $('#result').append(resultdiv);
		          
		        },
		        fail: function(error) {
		          alert(
		            'login success, but failed to request user information: ' +
		              JSON.stringify(error)
		          )
		        },
		      })
		    },
		    fail: function(err) {
		      alert('failed to login: ' + JSON.stringify(err))
		    },
		  })
</script>
<script type="text/javascript">
		  function unlinkApp() {
		    Kakao.API.request({
		      url: '/v1/user/unlink',
		      success: function(res) {
		        alert('success: ' + JSON.stringify(res))
		      },
		      fail: function(err) {
		        alert('fail: ' + JSON.stringify(err))
		      },
		    })
		  }
</script>
	
	<a href="${pageContext.request.contextPath}/homeEx">이전</a>
	
	<!-- 로그인되있는 상태라면 -->

	<c:if test="${loginCustomer != null }">
	
		<h1>${loginCustomer.customerName}님 로그인 되어있습니다.</h1>
	
	</c:if>

</body>



</html>