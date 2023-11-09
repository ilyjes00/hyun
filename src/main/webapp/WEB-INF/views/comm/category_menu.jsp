<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<div id="category_menu">
<ul class="nav justify-content-center">
	<c:forEach items="${oneCategoryList }" var="category">
  		<li class="nav-item">
    		<a class="nav-link" href="#" data-cgt_code="${category.cgt_code }">${category.cgt_name }</a>
  		</li>
  	</c:forEach>
</ul>
</div>
