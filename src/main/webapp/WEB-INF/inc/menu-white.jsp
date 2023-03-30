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
         <!-- 로그인 상태 -->
         <c:if test="${not empty loginCustomer}">
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
         </c:if>
         
         <!-- 비 로그인 상태 -->
         <c:if test="${empty loginCustomer}">
            <div class="wrap-icon-header flex-w flex-r-m">
               <a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form">
                  <img src="${pageContext.request.contextPath}/img/icons8-customer-32.png">
               </a>
               <a href="modal-login-form" class="nav-link" data-bs-toggle="modal" data-bs-target="#modal-login-form">
                  <img src="${pageContext.request.contextPath}/img/icons8-shopping-cart-32.png">
               </a>
     
               
            </div>
         </c:if>
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
               <li class="p-b-13">
                  <a href="index.html" class="stext-102 cl2 hov-cl1 trans-04">
                     Home
                  </a>
               </li>

               <li class="p-b-13">
                  <a href="#" class="stext-102 cl2 hov-cl1 trans-04">
                     My Wishlist
                  </a>
               </li>

               <li class="p-b-13">
                  <a href="#" class="stext-102 cl2 hov-cl1 trans-04">
                     My Account
                  </a>
               </li>

               <li class="p-b-13">
                  <a href="#" class="stext-102 cl2 hov-cl1 trans-04">
                     Track Oder
                  </a>
               </li>

               <li class="p-b-13">
                  <a href="#" class="stext-102 cl2 hov-cl1 trans-04">
                     Refunds
                  </a>
               </li>

               <li class="p-b-13">
                  <a href="#" class="stext-102 cl2 hov-cl1 trans-04">
                     Help & FAQs
                  </a>
               </li>
            </ul>

            <div class="sidebar-gallery w-full p-tb-30">
               <span class="mtext-101 cl5">
                  @ CozaStore
               </span>

               <div class="flex-w flex-sb p-t-36 gallery-lb">
                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-01.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-01.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-02.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-02.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-03.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-03.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-04.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-04.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-05.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-05.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-06.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-06.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-07.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-07.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-08.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-08.jpg');"></a>
                  </div>

                  <!-- item gallery sidebar -->
                  <div class="wrap-item-gallery m-b-10">
                     <a class="item-gallery bg-img1" href="images/gallery-09.jpg" data-lightbox="gallery" 
                     style="background-image: url('images/gallery-09.jpg');"></a>
                  </div>
               </div>
            </div>

            <div class="sidebar-gallery w-full">
               <span class="mtext-101 cl5">
                  About Us
               </span>

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