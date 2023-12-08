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


<form role="form" method="post" action="/user/qna/qna_insert" enctype="multipart/form-data">
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">

      <hr>
      <fieldset class="form-group border p-3">
        <legend class="w-auto px-2">글작성 폼</legend>
      
      <div class="form-group row">
        <label for="mbsp_id" class="col-2">글작성자</label>
        <div class="col-8">
          <input type="text" class="form-control" name="qa_writer" id="qa_writer" value="${loginStatus.mbsp_id}">
        </div>
        <div><br></div>
          <div class="col-8">
          <input type="text" class="form-control" name="qa_title" id="qa_title" value="제목..">
          </div>
          <div class="col-8">
            <input type="text" class="form-control" name="qa_content" id="qa_content" value="글내용..">
            </div>
      </fieldset>
      
      

      
      <div class="form-group row text-center">
        <div class="col-12">
          <button type="submit" class="btn btn-primary" >글등록</button>
        </div>
      </div>
      </form>
      </div>
    </form>

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
