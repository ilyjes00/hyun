<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
 
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, viewport-fit=cover, initial-scale=1.0, minimum-scale=0, maximum-scale=10,user-scalable=yes">

  
  <meta name="csrf-token" content="owc1TwIMxVeu3MKThmYiavKUeZ03OTOtTCGrRhnu">
  <meta property="og:type" content="website">
  
      <link rel="canonical" href="https://skindata.clickn.co.kr/members/login">
  <meta property="og:url" content="https://skindata.clickn.co.kr/members/login">
  
    
  
  
  <meta name="twitter:card" content="summary">

  
      <meta property="og:title" content="Phonecase Shop">
  <meta name="twitter:title" content="Phonecase Shop">
  <title>Phonecase Shop</title>
  
  
  
  
      <link rel="shortcut icon" href="/file/1967448068">
  
  
                  
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&amp;display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/css/lib.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Slick/slick.css">
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Swiper/swiper.min.css"><!-- Swiper js-->
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Datepicker/css/datepicker.css"><!-- datapicker -->

  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Dropzone/css/dropzone.min.css"><!-- Dropzone -->
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/css/animation.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/css/common.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/css/skin_common.css?v=20231204">		

      
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Fontawesome/css/froala.css"><!-- Froala 에 Font Awesome 서비스하기 위함 -->
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Fontawesome/css/all.min.css"><!-- Font Awesome -->
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/vendors/Froala/css/froala_editor.pkgd.css"><!-- Froala -->
  <link rel="stylesheet" type="text/css" href="https://designskin57.clickn.co.kr/css/skin.css?v=20231204">
      

  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_common.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_header.css?v=20231204">
  <!--
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_board.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_boardRecent.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_contents.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_form.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_image.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_layout.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_line.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_map.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_slide.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_text.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_video.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_gallery.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_table.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_footer.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_builderProductA.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_builderProductB.css?v=20231204">
  <link rel="stylesheet" type="text/css" href="https://resource.clickn.co.kr/css/modules/module_builderProductC.css?v=20231204"> -->




  <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&amp;family=Black+Han+Sans&amp;family=Cute+Font&amp;family=Do+Hyeon&amp;family=Dokdo&amp;family=East+Sea+Dokdo&amp;family=Gaegu:wght@400;700&amp;family=Gamja+Flower&amp;family=Gugi&amp;family=Hi+Melody&amp;family=Jua&amp;family=Kirang+Haerang&amp;family=Nanum+Brush+Script&amp;family=Nanum+Gothic:wght@400;700&amp;family=Nanum+Myeongjo:wght@400;700&amp;family=Nanum+Pen+Script&amp;family=Poor+Story&amp;family=Single+Day&amp;family=Song+Myung&amp;family=Stylish&amp;family=Sunflower:wght@300;700&amp;family=Yeon+Sung&amp;display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@400;700&amp;family=Archivo:wght@400;700&amp;family=Exo:wght@200;400;700&amp;family=Fauna+One&amp;family=Fjalla+One&amp;family=Graduate&amp;family=Iceland&amp;family=Inconsolata:wght@300;500;700&amp;family=Italianno&amp;family=Josefin+Sans:wght@200;400;700&amp;family=Lato:wght@100;300;400;700&amp;family=Libre+Baskerville:wght@400;700&amp;family=Montserrat:wght@200;300;400;500;600;700&amp;family=Nixie+One&amp;family=Nunito:wght@200;400;700&amp;family=Oswald:wght@200;400;500;700&amp;family=Playfair+Display:wght@400;500;700&amp;family=Poppins:wght@200;400;700&amp;family=Raleway:wght@200;400;700&amp;family=Roboto:wght@100;300;400;500;700&amp;family=Simonetta:wght@400;900&amp;family=Space+Mono:wght@400;700&amp;family=Special+Elite&amp;family=Stardos+Stencil:wght@400;700&amp;family=Titan+One&amp;family=Titillium+Web:wght@200;400;700&amp;family=Trocchi&amp;family=Ultra&amp;family=Wellfleet&amp;family=Abril+Fatface&amp;family=Bodoni+Moda:wght@400;600;800&amp;family=DM+Serif+Display&amp;family=DM+Serif+Text&amp;family=EB+Garamond:wght@400;500&amp;family=Open+Sans:wght@300;400;700&amp;family=Petit+Formal+Script&amp;family=Quicksand:wght@300;700&amp;family=Cinzel&amp;family=Lobster&amp;family=MonteCarlo&amp;family=Shrikhand&amp;display=swap" rel="stylesheet">


  
<!--
  <script src="https://designskin57.clickn.co.kr/lang/skin_js.js"></script>
  <script src="https://designskin57.clickn.co.kr/lang/common.js?m=front&amp;g=common"></script>
  <script src="https://designskin57.clickn.co.kr/vendors/Jquery/jquery.min.js"></script>
  <script src="https://designskin57.clickn.co.kr/vendors/Twbs-pagination/jquery.twbsPagination.js"></script>
  <script src="https://designskin57.clickn.co.kr/js/common.js?v=20231204"></script>

  <script src="https://designskin57.clickn.co.kr/js/skin_ui_functions.js?v=20231204"></script> 우선 순위 높아야하는 UI Functions -->

  <script>		

  </script> 

    

  
                  <!-- 네이버주문형 유입 스크립트 -->
                <style data-jss="" data-meta="MuiDialog">
@media print {
.MuiDialog-root {
  position: absolute !important;
}
}
.MuiDialog-scrollPaper {
display: flex;
align-items: center;
justify-content: center;
}
.MuiDialog-scrollBody {
overflow-x: hidden;
overflow-y: auto;
text-align: center;
}
.MuiDialog-scrollBody:after {
width: 0;
height: 100%;
content: "";
display: inline-block;
vertical-align: middle;
}
.MuiDialog-container {
height: 100%;
outline: 0;
}
@media print {
.MuiDialog-container {
  height: auto;
}
}
.MuiDialog-paper {
margin: 32px;
position: relative;
overflow-y: auto;
}
@media print {
.MuiDialog-paper {
  box-shadow: none;
  overflow-y: visible;
}
}
.MuiDialog-paperScrollPaper {
display: flex;
max-height: calc(100% - 64px);
flex-direction: column;
}
.MuiDialog-paperScrollBody {
display: inline-block;
text-align: left;
vertical-align: middle;
}
.MuiDialog-paperWidthFalse {
max-width: calc(100% - 64px);
}
.MuiDialog-paperWidthXs {
max-width: 444px;
}
@media (max-width:507.95px) {
.MuiDialog-paperWidthXs.MuiDialog-paperScrollBody {
  max-width: calc(100% - 64px);
}
}
.MuiDialog-paperWidthSm {
max-width: 600px;
}
@media (max-width:663.95px) {
.MuiDialog-paperWidthSm.MuiDialog-paperScrollBody {
  max-width: calc(100% - 64px);
}
}
.MuiDialog-paperWidthMd {
max-width: 960px;
}
@media (max-width:1023.95px) {
.MuiDialog-paperWidthMd.MuiDialog-paperScrollBody {
  max-width: calc(100% - 64px);
}
}
.MuiDialog-paperWidthLg {
max-width: 1280px;
}
@media (max-width:1343.95px) {
.MuiDialog-paperWidthLg.MuiDialog-paperScrollBody {
  max-width: calc(100% - 64px);
}
}
.MuiDialog-paperWidthXl {
max-width: 1920px;
}
@media (max-width:1983.95px) {
.MuiDialog-paperWidthXl.MuiDialog-paperScrollBody {
  max-width: calc(100% - 64px);
}
}
.MuiDialog-paperFullWidth {
width: calc(100% - 64px);
}
.MuiDialog-paperFullScreen {
width: 100%;
height: 100%;
margin: 0;
max-width: 100%;
max-height: none;
border-radius: 0;
}
.MuiDialog-paperFullScreen.MuiDialog-paperScrollBody {
margin: 0;
max-width: 100%;
}
</style></head>


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.101.0">
  <title>Pricing example · Bootstrap v4.6</title>


  

  <!-- Bootstrap core CSS -->
<link href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://getbootstrap.com/docs/4.6/examples/pricing/pricing.css">


  <!-- Favicons -->


  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
  <style>
    .logo_area {
      margin-top: 80px; /* 원하는 여백 크기를 설정하세요 */
      margin-bottom: 20px; /* 원하는 여백 크기를 설정하세요 */
    }
  </style>

  
  <!-- Custom styles for this template -->
  <link rel="stylesheet">
</head>
<body>
  

<div class="header_module __headerModule" data-module-name="header_A006" data-module-parents="header_A001" data-submenu-design="design5" data-submenu-direction="right" style="background-color: rgb(255, 255, 255);"><!-- 헤더 모듈 -->
          <div class="module_wrap">
            <div class="module_container">
              <div class="logo_area"><p><a href="/"><b><img id="headerLogo" src="/image/casetify-logo.png" alt="" onerror="this.src='/image/casetify-logo.png'"></b></a></p></div>
              <div id="gnbUtilArea" class="gnb_area">
                <!-- 쇼핑몰 UTIL 영역 -->
                <div class="util_area">
                  <div class="module_wrap">
                    <div class="module_container">
                      <!-- 상단 셀렉트 메뉴( 다국어 사이트나 패밀리 사이트로 활용 가능 ) -->
                      <!--
                      <div class="select_link_area">
                        <div class="selectLinkMenu select_link_menu">
                          <a class="defaule_text" href="#none"></a>
                          <ul class="link_menu_list">
                          </ul>
                        </div>
                      </div>
                      -->
                      <!-- 로그인 -->
                      <c:if test="${sessionScope.loginStatus == null }">
                      <ul class="login_section">
                        <li class="greeting" style="font-family: Poppins; color: rgb(62, 62, 63);">
                          <span class="before" style="">WELCOME!</span>
                          <span class="after" style="display:none;"><span id="userID"></span><span id="greetingAfter">님 환영합니다!</span></span>
                        </li>
                        <li class="login" style=""><a href="/member/login" style="font-family: Poppins; color: rgb(62, 62, 63);">LOGIN</a></li>
                        <li class="join" style=""><a href="/member/join" style="font-family: Poppins; color: rgb(62, 62, 63);">JOIN</a></li>
                      </ul>
                    </c:if>


                    <c:if test="${sessionScope.loginStatus != null }">
                      <ul class="login_section">
                        <li class="greeting" style="font-family: Poppins; color: rgb(62, 62, 63);">
                          <span class="before" style="">WELCOME!</span>
                          <span class="after" style=""><span id="mbsp_id">${sessionScope.loginStatus.mbsp_id}</span>  님 환영합니다!</span></span>
                        </li>
                      <li class="logout" style=""><a href="/member/logout" style="font-family: Poppins; color: rgb(62, 62, 63);">LOGOUT</a></li>
                        </ul>
                    </c:if>
                    <c:if test="${sessionScope.loginStatus != null }">
                      <!-- 쇼핑몰 유틸메뉴( 다른 링크로도 활용 가능 ) -->
                      <ul class="util_menu_list" style="font-family:Poppins"><li><a href="/member/mypage" target="_self" style="color: rgb(62, 62, 63); font-family: Poppins;">MYPAGE</a></li><li><a href="/user/order/order_info" target="_self" style="color: rgb(62, 62, 63); font-family: Poppins;">ORDER</a></li><li><a href="/user/qna/qna_list" target="_self" style="color: rgb(62, 62, 63); font-family: Poppins;">QnA CENTER</a></li><li></li></ul>
                    </c:if>

                      <!-- [커머스] 장바구니, 검색 -->
                      <ul class="shopping_menu" style="font-family:Poppins">
                        <li class="shopping_my" data-menu-order="my" style="color: rgb(62, 62, 63);">
                          <a class="my_icon" href="/member/mypage" title="마이페이지"></a>
                        </li>
                        <li class="shopping_cart" data-menu-order="cart" style="color: rgb(62, 62, 63);">
                          <a class="cart_icon" href="/user/Cart/cart_list" title="장바구니"><span id="cartNum" class="cart_num">0</span></a>
                        </li>
                        <li class="shopping_search" data-menu-order="search" style="color: rgb(62, 62, 63);">
                          <a href="javascript:void(0)" class="btn_search_open" title="상품 검색">검색창 열기</a>
                          <div class="search_layer">
                            <label class="search_box"><input type="text" name="search_input_text" class="search_input_text" autocomplete="off" placeholder="상품 검색" style="color: rgb(62, 62, 63);"></label>
                            <button type="button" class="btn_search_header">검색</button>
                            <button type="button" class="btn_search_close">닫기</button>
                          </div>
                        </li>
                      </ul>

                    </div>
                  </div>
                </div>
              <ul id="GnbMenu" class="gnb" style="font-family: Poppins;"><li><a href="/pages/about" style="color: rgb(62, 62, 63); font-size: 16px;">IPhone</a><div>                         
                  <button type="button" class="btn_depth2_view __depth2Btn"></button>
                  <div class="navi_depth2_wrap">
                      <div class="navi_depth2_container">
                          <ul class="navi_depth2"><li><a href="/user/product/prod_list?cgt_code=4&cgt_name=아이폰15 Pro">IPhone</a></li><li><a href="/user/product/prod_list?cgt_code=18&cgt_name=에어팟 Pro 2세대">Airpods</a></li><li><a href="/user/product/prod_list?cgt_code=23&cgt_name=아이패드 10.9' (10세대)">IPad</a></li><li><a href="/user/product/prod_list?cgt_code=30&cgt_name=맥북 Air 15인치 (2023)">Macbooks</a></li><li><a href="/user/product/prod_list?cgt_code=41&cgt_name=38 / 40 / 41mm">Applewatch</a></li><li><a href="/user/product/prod_list?cgt_code=45&cgt_name=에어태그 케이스">AppleAccessory</a></li></ul>                    
                      </div>
                  </div>
              </div></li><li><a href="/pages/service" style="color: rgb(62, 62, 63); font-size: 16px;">Galaxy</a><div>                         
                  <button type="button" class="btn_depth2_view __depth2Btn"></button>
                  <div class="navi_depth2_wrap">
                      <div class="navi_depth2_container">
                          <ul class="navi_depth2"><li><a href="/user/product/prod_list?cgt_code=49&cgt_name=갤럭시S23 FE">Galaxy S series</a></li><li><a href="/user/product/prod_list?cgt_code=56&cgt_name=갤럭시 Z 플립5">Galaxy Z series</a></li><li><a href="/user/product/prod_list?cgt_code=63&cgt_name=갤럭시 버즈2 프로">Galaxy Buzz</a></li></ul>                    
                      </div>
                  </div>
              </div></li><li><a href="/user/product/prod_list?cgt_code=69&cgt_name=Pixel 8 Pro" style="color: rgb(62, 62, 63); font-size: 16px;">Goggle</a></li><li><a href="/user/qna/qna_list" style="color: rgb(62, 62, 63); font-size: 16px;">Q&A</a></li></ul></div>

              <!-- Aside open button( 햄거버 ) -->
              <div class="hambuger_area">
                <a id="asideOpenrBtn" href="#none"><strong>Aside open</strong></a>
              </div>
            </div>
          </div>
        </div>

</html>