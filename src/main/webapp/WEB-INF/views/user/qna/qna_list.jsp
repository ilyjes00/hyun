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



<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

  <h1 class="display-4"></h1>
  <p>게시판</p>
</div>

<div class="container">

  <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">글번호</th>
        <th scope="col">작성자 아이디</th>
        <th scope="col">글제목</th>
        <th scope="col">작성일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${qna_list}" var="qnaVO"> 
      <tr>
        <td scope="row"><input type="checkbox" name="qa_num"  value="${qnaVO.qa_num}">체크박스</td>
        
        <td>${qnaVO.qa_num }</td>
        <td>${qnaVO.prod_num }</td>
        <td>${qnaVO.qa_title }</td>
        <td>${qnaVO.qa_regdate }</td>
      </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="10" style="text-align: center">
          <button type="button" id="btn_product" class="btn btn-primary">글작성</button> 
          <button type="button" id="btn_cart_empty" class="btn btn-primary">글수정</button> 
        </td>
      </tr>
    </tfoot>
  </table>
  </div>
  
  
  <div class="box-footer clearfix">
    <div class="row">
       <div class="col-md-8 text-center">
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
<div class="col-6">

  <!-- [이전] 1 	2 	3	4	5	[다음] 페이지 이동목적으로 클릭할 때 사용-->
  <form id="actionForm" action="" method="get">
    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum }" />
    <input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount }" />
    <input type="hidden" name="type" id="type" value="${pageMaker.cri.type }" />
    <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword }" />
  </form>
</div>
</div>

 </div>												
</div>
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

   actionForm.attr("action", "/user/qna/qna_list");
   actionForm.find("input[name='pageNum']").val($(this).attr("href"));


   actionForm.submit();
});
});

</script>

  </body>
</html>
