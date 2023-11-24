<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>                                    
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
<%@include file="/WEB-INF/views/comm/plugin2.jsp" %>

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



<div class="container">
	<div class="text-center">
	<div class="box box-primary">
  <div class="box-header with-border">
	  <br>
  <h1 class="box-title">아이디찾기</h3>
  </div>
   <div class="mb-4"></div>
	<div class="mb-4"></div>
	  <div class="mb-4"></div>
  
  <form commandName="searchVO" id="createForm" action="${path}/member/search_result_id" method="post">
  <div class="box-body">
  <div class="form-group">
  <form>
	<div class="form-group row">
	  <label for="mbsp_id" class="col-sm-2 col-form-label">아이디 확인</label>
	  <div class="col-sm-10">
		<c:choose>                                                                          
            <c:when test="${empty searchVO}">                                                 
                <p>조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <h3>${searchVO.mbsp_id}</h3>                                              
            </c:otherwise>                                                                    
        </c:choose>  
	  </div>
	</div>
	</div>
  </form>
  </form>
  </div>

<%@include file="/WEB-INF/views/comm/footer.jsp" %>


<%@include file="/WEB-INF/views/comm/plugin.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>                                    
                                                                                            
<script>                                                                                                                    
var path = "${pageContext.request.contextPath }";                                                                           
                                                                                            
$(document).ready(function() {                                                                                            
                                                                                            
});                                                                                                                       
                                                                                            
</script> 
    <script src="/js/category_menu.js"></script>
  </body>
</html>
