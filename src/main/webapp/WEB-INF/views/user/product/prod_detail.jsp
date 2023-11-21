<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="en">
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#tabs_prod_detail" ).tabs();
  } );
  </script>

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
      body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}
    </style>

    
    <!-- Custom styles for this template -->
    <link rel="stylesheet">
  </head>
  <body>
    

<%@include file="/WEB-INF/views/comm/header.jsp" %>

<%@include file="/WEB-INF/views/comm/category_menu.jsp" %>




<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

  <h1 class="display-4"></h1>
  <p>2차 카테고리: ${cgt_name }</p>
</div>

<div class="container">
  <di class="card-deck mb-3 text-center row">
    <div class="col-md-6">
      <img class="btn_prod_img" data-prod_num="${productVO.prod_num }" src="/user/product/imageDisplay?dateFolderName=${productVO.prod_up_folder }&fileName=${productVO.prod_img }" width="100%" height="225">
    </div>
    <di class="col-md-6">
      <div class="row text-left">
        <div class="col">
          ${productVO.prod_name }
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
          가격 : <span id="unit_price">${productVO.prod_price }</span>
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
        수량 <input type="number" id="btn_quantity" value="1" style="width: 80px;">
        </div>
      </div>
      <div class="row text-left">
        <div class="col">
          총상품금액: <span id="tot_price">${productVO.prod_price }</span>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
          <button type="button" class="btn btn-primary" name="btn_order" data-prod_num="${productVO.prod_num }">구매하기</button>
      </div>
        <div class="col-md-6">
          <button type="button" class="btn btn-primary" name="btn_cart_add" data-prod_num="${productVO.prod_num }">장바구니</button>
        </div>
      </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div id="tabs_prod_detail">
        <ul>
          <li><a href="#tabs-prodetail">상품설명</a></li>
          <li><a href="#tabs-proreview">상품후기</a></li>
        </ul>
        <div id="tabs-prodetail">
          <p>${productVO.prod_content }</p>
        </div>
        <div id="tabs-proreview">
          <p>상품후기</p>
        </div>
      </div>
    </div>
  </div>

  <div class="container">
     <div class="row justify-content-end">
        <div class="col-md-7 text-center">
   <!--1)페이지번호 클릭할 때 사용  [이전]  1   2   3   4   5 [다음]  -->
   <!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
     <form id="actionForm" action="" method="get">
      <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
      <input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
      <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
      <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
      
            <input type="hidden" name="cgt_code" id="cgt_code" value="${cgt_code }" />
            <input type="hidden" name="cgt_name" id="cgt_name" value="${cgt_name }" />
     </form>

   </div>
</div>
</div>

<%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

<%-- <%@include file="/WEB-INF/views/comm/plugin.jsp" %>  css파일부분 작동안함 jquery-3.6.0.js // 3.5.0버전과 충돌--%> 
<script src="/js/category_menu.js"></script>

<script>
$(document).ready(function (){

    let actionForm = $("#actionForm");

   // <!--[이전] 1 2 3 4 5 [다음] 클릭 이벤트 설정--> <a>태그
   $(".movepage").on("click", function(e) {
      e.preventDefault(); //a태그의 링크기능을 제거. href속성에 페이지번호를 숨겨둠

      actionForm.attr("action", "/user/product/prod_list");
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));


      actionForm.submit();
   });
});

//장바구니 추가
$("button[name='btn_cart_add']").on("click", function() {
	//console.log("장바구니");

	$.ajax({
    url: '/user/Cart/cart_add',
    type: 'post',
    data: {prod_num : $(this).data("prod_num"), cart_amount :  $("#btn_quantity").val()},
    dataType: 'text',
    success: function(result) {
      if(result === "success"){
        alert("장바구니에 추가됨");
        if(confirm("장바구니로 이동하겠습니까?")) {
          location.href = "/user/Cart/cart_list";
        }
      }
    }
  });
});

  //구매하기(주문)
$("button[name='btn_order']").on("click" , function(){

let url = "/user/order/order_ready?prod_num=" + $(this).data("prod_num") + "&cart_amount=" + $("#btn_quantity").val();
location.href = url;
});



    $(".btn_prod_img").on("click" , function() {

      let actionForm = $("#actionForm");
      console.log("상품상세설명");

      actionForm.attr("action", "/user/product/prod_detail");

      let prod_num = $(this).data("prod_num");

      actionForm.find("input[name='prod_num']").remove();
      // <input type='hidden' name='prod_num' value='상품코드'
      actionForm.append("<input type='hidden' name='prod_num' value='" + prod_num + "'>");
      actionForm.submit();

    });

    //수량변경시
    $("#btn_quantity").on("change", function() {
      let tot_price = parseFloat($("#unit_price").text()) * parseFloat($("#btn_quantity").val());


      //총상품금액 표시
      $("#tot_price").text(tot_price);
    }); 
    //ready event end

</script>


  </body>
</html>
