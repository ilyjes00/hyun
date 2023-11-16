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

    
    <!-- Custom styles for this template -->
    <link rel="stylesheet">
  </head>
  <body>
    

<%@include file="/WEB-INF/views/comm/header.jsp" %>


<%@include file="/WEB-INF/views/comm/slider.jsp" %>



<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

  <h1 class="display-4"></h1>
  <p>2차 카테고리:${cgt_name }</p>
</div>

<div class="container">
  <div class="card-deck mb-3 text-center row">
  <c:forEach items="#{prod_list }" var="productVO"> 
  <div class="col-md-3">
          <div class="card mb-4 shadow-sm">
           <img src="/user/product/imageDisplay?dateFolderName=${productVO.prod_up_folder }&fileName=${productVO.prod_img }" width="100%" height="225">

            <div class="card-body">
              <p class="card-text">${productVO.prod_name }</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" name="btn_cart_add" data-prod_num="${productVO.prod_num }" class="btn btn-sm btn-outline-secondary">Cart</button>
                  <button type="button" name="btn_buy" class="btn btn-sm btn-outline-secondary">Buy</button>
                </div>
                <small class="text-muted">
                <fmt:formatNumber type="currencyt" pattern="₩#, ###"> ${productVO.prod_price } </fmt:formatNumber> </small>
              </div>
            </div>
        </div>
    </div>
    </c:forEach>
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
      <nav aria-label="...">
      <ul class="pagination">
         <!-- 이전 표시여부 -->
         <c:if test="${pageMaker.prev }">
            <li class="page-item">
               <a href="${pageMaker.startPage - 1 }" class="page-link movepage">Previous</a>
            </li>
         </c:if>
         <!-- 페이지번호 출력 -->
         <!-- 1   2   3   4   5 6   7   8   9   10  [다음] -->
         <!-- [이전] 11   12   13   14   15 16   17   18   19   20   -->
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
            <li class='page-item ${pageMaker.cri.pageNum ==  num ? "active":"" }'aria-current="page">
               <a class="page-link movepage" href="${num }" data-page="${num }">${num }</a>
            </li>
         </c:forEach>
         
         <!--  다음 표시여부 -->
         <c:if test="${pageMaker.next }">
            <li class="page-item">
            <a href="${pageMaker.endPage + 1 }" class="page-link movepage" href="#">Next</a>
            </li>
         </c:if>
         
      </ul>
      </nav>
   </div>
</div>
</div>

<%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

<%@include file="/WEB-INF/views/comm/plugin.jsp" %>
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
	console.log($(this).data("prod_num"));


	$.ajax({
    url: '/user/Cart/cart_add',
    type: 'post',
    data: {prod_num : $(this).data("prod_num"), cart_amount : 1 },
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
</script>

  </body>
</html>
