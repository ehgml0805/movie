<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources2/images/icons/favicon.png"/>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/fonts/iconic/css/material-design-iconic-font.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/fonts/linearicons-v1.0.0/icon-font.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/vendor/css-hamburgers/hamburgers.min.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/css/util.css">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources2/css/main.css">
<!--===============================================================================================-->
</head>

<style>
   a{
      text-decoration-line : none;
   }
   #event-link:hover {
      cursor: default;
   }
   
   #event-tooltip {
        position: absolute;
        left: 42%;
        cursor: pointer;
        display: none;
        padding-right: 15px;
   }
   #end-event-tooltip {
       position: absolute;
        left: 52%;
        cursor: pointer;
        display: none;
   }
   
   #customer-center-link:hover {
      cursor: default;
   }
   
   #notice-tooltip {
        position: absolute;
        left: 55%;
        cursor: pointer;
        display: none;
          z-index: 1;
          padding-right: 15px;
   }
   #faq-tooltip {
       position: absolute;
        left: 61%;
        cursor: pointer;
        display: none;
        z-index: 1;
        padding-right: 30px;
   }
   #question-tooltip {
       position: absolute;
        left: 64%;
        cursor: pointer;
        display: none;
        z-index: 1;
        padding-right: 10px;
   }
   
</style>
<header class="header-v2">
   <div class="how-shadow1" style="background-color: white">
      <nav class="limiter-menu-desktop container">
         
   
         <!-- Menu desktop -->
         <div class="menu-desktop">
        	 <div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
				<img src="${pageContext.request.contextPath}/img/icons8-hamburger-menu-32.png">
			</div>
            <ul class="main-menu-white">
               <li>
                  <a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
                  
               </li>
               <li>
	                	<a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a>
	                  
	               </li>
   
               <li>
						<a href="${pageContext.request.contextPath}/movie/movieList" style="font-size:18px; ">영화&nbsp;&nbsp;</a>
               </li>
   
               <li>
					<a href="${pageContext.request.contextPath}/ticketing/screenList" style="font-size:18px">예매&nbsp;&nbsp;</a>
				</li>

				<li>
					<a href="${pageContext.request.contextPath}/theater/theaterList" style="font-size:18px">극장&nbsp;&nbsp;</a>
				</li>
   
               <li>
                  <a href="${pageContext.request.contextPath}/home" style="font-size:18px">
                     <!-- Logo desktop -->
                     <img src="${pageContext.request.contextPath}/img/new-e1i6box-white.png" alt="IMG-LOGO" width="140" >
                  </a>
               </li>
              	<li>
					<a href="${pageContext.request.contextPath}/event/eventList" style="font-size:18px">&nbsp;&nbsp;이벤트</a>
					<ul class="sub-menu-white" style="z-index: 999;">
						<li><a href="${pageContext.request.contextPath}/event/eventList">진행중인 이벤트</a></li>
						<li><a href="${pageContext.request.contextPath}/event/endEventList">종료된 이벤트</a></li>
						
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/snack/snackHome" style="font-size:18px">&nbsp;&nbsp;스토어</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/faq/faqList" style="font-size:18px"	>&nbsp;&nbsp;고객센터</a>
					<ul class="sub-menu" style="z-index: 999;">
						<li><a href="${pageContext.request.contextPath}/faq/faqList">자주묻는 질문</a></li>
						<li><a href="${pageContext.request.contextPath}/customer/question/questionList">Q&A</a></li>
						
					</ul>
				</li>
            </ul>
         </div>   
   
         <!-- icon header -->
         			<c:choose>
				
				<c:when test="${not empty loginCustomer}">
					<div class="wrap-icon-header flex-w flex-r-m">
						<a href ="${pageContext.request.contextPath}/customer/mypage" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 ">
							<img src="${pageContext.request.contextPath}/img/icons8-customer-32.png">
						</a>
						<a href="${pageContext.request.contextPath}/customer/order/cartList" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22  ">
							<img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png">
						</a>	
						<a href="${pageContext.request.contextPath}/login/logout" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 " >
							<img src="${pageContext.request.contextPath}/img/icons8-logout-rounded-30.png">
						</a>
						
					</div>
				</c:when>
				
				<c:when test="${not empty loginEmployee}">
					<div class="wrap-icon-header flex-w flex-r-m">
						<a href="${pageContext.request.contextPath}/login/logout" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 " >
							<img src="${pageContext.request.contextPath}/img/icons8-logout-rounded-30.png">
						</a>
					</div>
				</c:when>
				
				
				<c:otherwise>
					<div class="wrap-icon-header flex-w flex-r-m">
						<a href="modal-login-form"  data-bs-toggle="modal" data-bs-target="#modal-login-form">
							<img src="${pageContext.request.contextPath}/img/icons8-customer-32.png">&nbsp;&nbsp;&nbsp;&nbsp;
						</a>
						
						<a href="modal-login-form"  data-bs-toggle="modal" data-bs-target="#modal-login-form">
							<img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png">
						</a>
						
					</div>
				</c:otherwise>
			</c:choose>
      </nav>
   </div>   
</header>

	<!-- Sidebar -->
	<aside class="wrap-sidebar js-sidebar">
		<div class="s-full js-hide-sidebar"></div>

		<div class="sidebar flex-col-l p-t-22 p-b-25">
			<div class="flex-r w-full p-b-30 p-r-27">
				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
				<ul class="sidebar-link w-full">
					<c:choose>
				
						<c:when test="${not empty loginCustomer}">
						
						<li class="bor18 p-b-13 p-t-10">
							<a href="${pageContext.request.contextPath}/movie/movieList" class="stext-102 cl2 hov-cl1 trans-04">
								현재 상영작
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/ticketing/screenList" class="stext-102 cl2 hov-cl1 trans-04">
								빠른 예매하기
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/event/eventList" class="stext-102 cl2 hov-cl1 trans-04">
								진행중인 이벤트
							</a>
						</li>
						
						<li class="bor18 p-b-13 p-t-10">
							<a href="${pageContext.request.contextPath}/snack/snackHome" class="stext-102 cl2 hov-cl1 trans-04">
								스낵 스토어
							</a>
						</li>
						<li class="bor18 p-b-13 p-t-10">
							<a href="${pageContext.request.contextPath}/faq/faqList" class="stext-102 cl2 hov-cl1 trans-04">
								고객센터
							</a>
						</li>
						
						
						</c:when>
						<c:when test="${not empty loginEmployee}">
							
							<c:if test="${empty loginEmployee}">
						<li class="p-b-13">
							<a href="modal-login-form" class="stext-102 cl2 hov-cl1 trans-04"
									data-bs-toggle="modal" data-bs-target="#modal-loginEmployee-form">
								관리자 로그인
							</a>
						</li>
						</c:if>
						<c:if test="${not empty loginEmployee}">
							<li class="p-b-13">
								관리자 모드
							</li>
						</c:if>
						<!-- 영화 관리 -->
						
						<c:if test="$"></c:if>
						<li class="bor18 p-b-13 p-t-10">
							<a href="${pageContext.request.contextPath}/employee/question/questionList" class="stext-102 cl2 hov-cl1 trans-04">
								영화 관리
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/employee/screeningSchedule/screeningScheduleList" class="stext-102 cl2 hov-cl1 trans-04">
								상영스케줄 관리
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/employee/theater/theaterList" class="stext-102 cl2 hov-cl1 trans-04">
								극장 관리
							</a>
						</li>
						
						<li class="bor18 p-b-13 p-t-10">
							<a href="${pageContext.request.contextPath}/employee/coupon/couponList" class="stext-102 cl2 hov-cl1 trans-04">
								쿠폰 관리
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/event/eventList" class="stext-102 cl2 hov-cl1 trans-04">
								이벤트 관리
							</a>
						</li>
						
	
						<!-- 고객 관리 -->
						
						<li class="bor18 p-b-13 p-t-10">
							<a href="${pageContext.request.contextPath}/employee/notice/addNotice" class="stext-102 cl2 hov-cl1 trans-04">
								공지사항 관리
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/employee/question/questionList" class="stext-102 cl2 hov-cl1 trans-04">
								문의사항 관리
							</a>
						</li>
						<li class="p-b-13">
							<a href="${pageContext.request.contextPath}/faq/faqList" class="stext-102 cl2 hov-cl1 trans-04">
								FAQ 관리
							</a>
						</li>
							
							</c:when>
							<c:otherwise>
								<a href="modal-login-form" class="stext-102 cl2 hov-cl1 trans-04"
										data-bs-toggle="modal" data-bs-target="#modal-loginEmployee-form">
									관리자 로그인
								</a>
							
							</c:otherwise>
						</c:choose>	
						
				

				</ul>

				<div class="sidebar-gallery w-full p-tb-30">
					<img src="${pageContext.request.contextPath}/img/github-logo.png" width="100">
					<span class="mtext-101 cl5">
						E1I6BOX
					</span>
					<span class="mtext-101 cl5">
						About Us
					</span>

					

				<div class="sidebar-gallery w-full">
					

					<p class="stext-108 cl6 p-t-27">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur maximus vulputate hendrerit. Praesent faucibus erat vitae rutrum gravida. Vestibulum tempus mi enim, in molestie sem fermentum quis. 
					</p>
				</div>
			</div>
		</div>
	</aside>		



<!-- 로그인 모달 -->
<c:if test="${empty loginCustomer }">
   <%@include file="loginFormModal.jsp"%>
   <%@include file="addCustomerModal.jsp"%>
   <%@include file="loginEmployeeFormModal.jsp" %>
</c:if>

<!--===============================================================================================-->   
   <script src="${pageContext.request.contextPath}/resources2/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/bootstrap/js/popper.js"></script>
   <script src="${pageContext.request.contextPath}/resources2/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/select2/select2.min.js"></script>
   <script>
      $(".js-select2").each(function(){
         $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
         });
      })
   </script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/daterangepicker/moment.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources2/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/slick/slick.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources2/js/slick-custom.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/parallax100/parallax100.js"></script>
   <script>
        $('.parallax100').parallax100();
   </script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
   <script>
      $('.gallery-lb').each(function() { // the containers for all your galleries
         $(this).magnificPopup({
              delegate: 'a', // the selector for gallery item
              type: 'image',
              gallery: {
                 enabled:true
              },
              mainClass: 'mfp-fade'
          });
      });
   </script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/sweetalert/sweetalert.min.js"></script>
   <script>
      $('.js-addwish-b2').on('click', function(e){
         e.preventDefault();
      });

      $('.js-addwish-b2').each(function(){
         var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
         $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
         });
      });

      $('.js-addwish-detail').each(function(){
         var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

         $(this).on('click', function(){
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
         });
      });

      /*---------------------------------------------*/

      $('.js-addcart-detail').each(function(){
         var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
         $(this).on('click', function(){
            swal(nameProduct, "is added to cart !", "success");
         });
      });
   </script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
   <script>
      $('.js-pscroll').each(function(){
         $(this).css('position','relative');
         $(this).css('overflow','hidden');
         var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
         });

         $(window).on('resize', function(){
            ps.update();
         })
      });
   </script>
<!--===============================================================================================-->
   <script src="${pageContext.request.contextPath}/resources2/js/main.js"></script>