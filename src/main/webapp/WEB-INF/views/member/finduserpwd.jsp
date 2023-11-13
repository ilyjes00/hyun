<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<form action="/member/finduserpwd" method="post">
	<h2>임시 비밀번호 발급</h2>
	아이디<br>
	<input type="text" name="mbsp_id"><br>
	이메일<br>
	<input type="email" name="mbsp_email"><br>
	<input type="button" value="임시비밀번호 발급" id="btn"><br> 
	<a href="/member/login">로그인</a> | <a href="/member/join">회원가입</a>  
</form>
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
</body>

</html>

