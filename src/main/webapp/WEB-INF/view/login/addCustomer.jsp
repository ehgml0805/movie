<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 		<meta name="viewport" content="width=device-width, initial-scale=1">
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> 부트스트랩4-->
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> <!-- 부트스트랩 JavaScript 파일 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
   $(document).ready(function() {
      $('#ckBtn').click(function(){
         $.ajax({
            url:'idck'
            , type:'get'
            , data : {customerId:$('#id').val()}
            , success:function(model){ // model : 'YES' / 'NO'
               if(model=='YES') {
                  // 사용가능한 아이디
                  $('#customerId').val($('#id').val());
               } else {
                  // 사용중인 아이디
                  alert($('#id').val()+'는 사용중인 아이디입니다');
               }
            }
         });
      });   
   });
</script>

</head>

<body>
<!-- 네비바 -->
      <c:import url="/WEB-INF/inc/menu.jsp"></c:import> 
   <h1>회원가입</h1>
   <div>
      <input type="text" id="id">
      <button type="button" id="ckBtn">중복검사</button>
   </div>   
   <div>${errorMsg}</div>
   
   <form method ="post" action ="${pageContext.request.contextPath}/login/addCustomer" enctype="multipart/form-data">
      <table>
         <tr>
            <th>프로필 사진</th>
            <td>
               <input type="file" name="customerImgList">
            </td>
         </tr>
         <tr>
            <th>아이디</th>
            <td>
               <input type ="text" id = "customerId" name="customerId">
            </td>
         </tr>
         <tr>   
            <th>이름</th>
            <td>
               <input type ="text" id="customerName" name="customerName">
            </td>
         </tr>
         <tr>   
            <th>비밀번호</th>
            <td>
               <input type ="password" id ="customerPw" name="customerPw">
            </td>
         </tr>
         <tr>   
            <th>주소</th>
            <td>
               <input type ="text" id ="customerAddress" name="customerAddress">
            </td>
         </tr>
         <tr>   
            <th>생일</th>
            <td>
               <input type ="date" id ="customerBirthday" name="customerBirthday">
            </td>
         </tr>
         <tr>   
            <th>성별</th>
            <td>
               <input type ="radio" id ="customerGender" name="customerGender" value="M" checked>남자
               <input type ="radio" id ="customerGender" name="customerGender" value="F" >여자
            </td>
         </tr>
         <tr>   
            <th>휴대폰 번호</th>
            <td>
               <input type ="tel" id ="customerPhone" name="customerPhone"
                  pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
                    required
                    minlength="13"
                  maxlength="13">
            </td>
         </tr>
         <tr>   
            <th>Email</th>
            <td>
               <input type ="email" id ="customerEmail" name="customerEmail" 
                   size="30" required>
            </td>
         </tr>
         
         
      </table>
      <button type ="submit" id="addBtn">회원가입</button>

   
   </form>
</body>
</html>