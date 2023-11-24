<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<h1 class="box-title">임시 비밀번호 발급</h3>
</div>
 <div class="mb-4"></div>
  <div class="mb-4"></div>
    <div class="mb-4"></div>

<form role="form" id="joinForm" method="post" action="/member/join">
<div class="box-body">
<div class="form-group">
<form>
  <div class="form-group row">
    <label for="mbsp_id" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="mbsp_id" name="mbsp_id" placeholder="Enter ID">
    </div>
  </div>
      <div class="form-group row">
    <label for="mbsp_password" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="mbsp_email" name="mbsp_email" placeholder="Enter Email">
    </div>
  </div>
</form>
<div class="box-footer">
	<button type="button" class="btn btn-primary" id="btn">임시비밀번호 발급</button>
	</div>
</form>
</div>

  </div>
  </div>

<%@include file="/WEB-INF/views/comm/footer.jsp" %>


<%@include file="/WEB-INF/views/comm/plugin.jsp" %>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			let mbsp_id = $("input[name='mbsp_id']").val();
			let mbsp_email = $("input[name='mbsp_email']").val();
			$.ajax({
				url:"/member/finduserpwd",
				type: 'post',
				dataType:'text',
				data:{mbsp_id:mbsp_id,mbsp_email:mbsp_email},
				success:function(data){
					if(data==true){
						alert("임시 비밀번호가 발급되었습니다.메일함을 확인해 주세요");
						console.log(data);
					}else{
						alert("아이디 또는 이메일을 정확하게 입력해 주세요");
						console.log(data);
				}
		   	}
		});
	});
});
</script>
    <script src="/js/category_menu.js"></script>
  </body>
</html>
