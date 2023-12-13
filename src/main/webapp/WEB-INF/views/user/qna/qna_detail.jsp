<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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


<tr class="">
  <td colspan="9">
    <table class="table table-sm" id="">
      <thead>
        <tr>
          <th scope="col">주문번호</th>
          <th scope="col">상품코드</th>
          <th scope="col">상품이미지</th>
          <th scope="col">상품명</th>
          <th scope="col">주문수량</th>
          <th scope="col">주문금액</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${qna_DetailList }" var="qna_DetailList">
        <tr>
          <th scope="row">${qna_DetailList.qa_num }</th>
          <td>${qna_DetailList.qa_content }</td>
          <td>${qna_DetailList.qa_writer }</td>
          <td>${qna_DetailList.qa_content }</td>
          <td>${qna_DetailList.qa_regdate }</td>
          <td>${qna_DetailList.qa_updatedate }</td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
  </td>
</tr>

<div class="btnSet">
	<a class="btn-fill" href="list.qna">목록으로</a>

	<!-- 로그인이 된 경우 답글 쓰기 가능 -->
	<core:if test="${!empty login_info }">
		<a class="btn-fill" href="reply.qna?id=${vo.id }">답글 쓰기</a>
	</core:if>
</div>

<%@include file="/WEB-INF/views/comm/footer.jsp" %>
</div>

<%@include file="/WEB-INF/views/comm/plugin.jsp" %>
<script src="/js/category_menu.js"></script>

  <script>

</script>
  <!-- 카테고리 메뉴 자바스크립트 작업소스 -->
  <script src="/js/category_menu.js"></script>
  
  <script>

  </script>  
  
  


  </body>
</html>
