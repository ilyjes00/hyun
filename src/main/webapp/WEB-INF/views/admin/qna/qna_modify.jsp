<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!doctype html>
    <html>
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>AdminLTE 23 | Starter</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      <%@ include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
    </head>
    



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
    

    <body class="hold-transition skin-blue sidebar-mini">
      <div class="wrapper">
      
        <!-- Main Header -->
        <%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
        <!-- Left side column. contains the logo and sidebar -->
          <%@ include file="/WEB-INF/views/admin/include/nav.jsp" %>
      
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
          <!-- Content Header (Page header) -->
          <section class="content-header">
            <h1>
              Page Header
              <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
              <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
              <li class="active">Here</li>
            </ol>
          </section>


<form role="form" method="post" action="/admin/qna/qna_modify" enctype="multipart/form-data">
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">





    <article>
      <div class="container" role="main">
        <h2>게시물 수정</h2>

        <c:forEach items="${vo }" var="vo">
          <div class="mb-3"> <label for="title">제목</label>
             <input type="text" class="form-control" name="qa_title" id="qa_title" value="${vo.qa_title}"> 
          </div>

          <div class="mb-3"> <label for="qa_writer">작성자</label> 
            <input type="text" class="form-control" name="qa_writer" id="qa_writer" value="${vo.qa_writer}">
          </div>

          <div class="mb-3"> <label for="qa_content">내용</label> 
            <textarea class="form-control" rows="5"name="qa_content" id="qa_content">${vo.qa_content}</textarea> 
            </div>
          </c:forEach>
        </form>
    </article>
  </body>

</html>

      
      <div class="form-group row text-center">
        <div class="col-12">
          <button type="submit" class="btn btn-primary" >글등록</button>
        </div>
      </div>
      </form>
      </div>
    </form>
  

    <%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Create the tabs -->
      <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
      </ul>
      <!-- Tab panes -->
      <div class="tab-content">
        <!-- Home tab content -->
        <div class="tab-pane active" id="control-sidebar-home-tab">
          <h3 class="control-sidebar-heading">Recent Activity</h3>
          <ul class="control-sidebar-menu">
            <li>
              <a href="javascript:;">
                <i class="menu-icon fa fa-birthday-cake bg-red"></i>
  
                <div class="menu-info">
                  <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
  
                  <p>Will be 23 on April 24th</p>
                </div>
              </a>
            </li>
          </ul>
          <!-- /.control-sidebar-menu -->
  
          <h3 class="control-sidebar-heading">Tasks Progress</h3>
          <ul class="control-sidebar-menu">
            <li>
              <a href="javascript:;">
                <h4 class="control-sidebar-subheading">
                  Custom Template Design
                  <span class="pull-right-container">
                      <span class="label label-danger pull-right">70%</span>
                    </span>
                </h4>
  
                <div class="progress progress-xxs">
                  <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                </div>
              </a>
            </li>
          </ul>
          <!-- /.control-sidebar-menu -->
  
        </div>
        <!-- /.tab-pane -->
        <!-- Stats tab content -->
        <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
        <!-- /.tab-pane -->
        <!-- Settings tab content -->
        <div class="tab-pane" id="control-sidebar-settings-tab">
          <form method="post">
            <h3 class="control-sidebar-heading">General Settings</h3>
  
            <div class="form-group">
              <label class="control-sidebar-subheading">
                Report panel usage
                <input type="checkbox" class="pull-right" checked>
              </label>
  
              <p>
                Some information about this general settings option
              </p>
            </div>
            <!-- /.form-group -->
          </form>
        </div>
        <!-- /.tab-pane -->
      </div>
    </aside>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
    immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
  </div>
  <!-- ./wrapper -->
  
  <!-- REQUIRED JS SCRIPTS -->
  <%@ include file="/WEB-INF/views/admin/include/plugin2.jsp" %>
 <!-- ./wrapper -->

  <script>

</script>
  <!-- 카테고리 메뉴 자바스크립트 작업소스 -->
  <script src="/js/category_menu.js"></script>
  <script type="text/javascript" src="js/need_check.js?v=<%=new java.util.Date().getTime() %>"></script>
  
  <script>

  </script>  
  
  


  </body>
</html>
