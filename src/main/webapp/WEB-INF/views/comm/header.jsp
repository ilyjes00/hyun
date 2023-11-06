<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/navbar.css">
</head>
<html>

<body>
  <nav>
    <div class="navbar" style="z-index: 1;">
      <div class="container nav-container">
          <input class="checkbox" type="checkbox" name="" id="" />
          <div class="hamburger-lines">
            <span class="line line1"></span>
            <span class="line line2"></span>
            <span class="line line3"></span>
          </div>  
        <div class="logo">
          <h1>Navbar</h1>
        </div>
        <div class="menu-items">
          <li><a href="#">Home</a></li>
          <li><a href="#">about</a></li>
          <li><a href="#">blogs</a></li>
          <li><a href="#">portfolio</a></li>
          <li><a href="#">contact</a></li>
        </div>
      </div>
    </div>
  </nav>
  <nav>
    <c:if test="${sessionScope.loginStatus == null }">
    <a class="p-2 text-white" href="/member/login">로그인</a>
    <a class="p-2 text-white" href="/member/join">회원가입</a>
    </c:if>
    <!-- 로그인 이후 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
    <a class="p-2 text-white " href="/member/logout">로그아웃</a>
    <a class="p-2 text-white" href="/member/confirmPw">회원정보수정</a>
    
    </c:if> 

        <c:if test="${sessionScope.loginStatus != null }">
    <a class="p-2 text-white" href="/member/mypage">마이페이지</a>
        </c:if> 
    <a class="p-2 text-white" href="#">검색</a>
    <a class="p-2 text-white" href="#">장바구니</a>
  </nav>
</nav>


  <%--a class="btn btn-outline-primary" href="#">Sign up</a> --%>
</div>

</body>
</html>