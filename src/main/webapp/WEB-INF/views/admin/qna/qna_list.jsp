<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    

    <!-- Bootstrap core CSS -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>
  $( function() {
    $( "#tabs_prod_detail" ).tabs();
  } );
  </script>

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
      body {
	font-family: Arial, Helvetica, sans-serif;
}

table {
	font-size: 1em;
}

.ui-draggable, .ui-droppable {
	background-position: top;
}

/*별점 기본선택자*/
p#star_rv_score a.rv_score {
  font-size: 22px;
  text-decoration: none;
  color: lightgray;
}
/*별점에 마우스 오버했을경우 사용되는 css선택자*/
p#star_rv_score a.rv_score.on {
  color: red;
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

    <!-- Main content -->
    <section class="content container-fluid">

             <div class="row">
              <div class="col-md-12">  		
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Product List</h3>
                    </div>						
                    <div class="col-6">
                      <form action="/admin/qna/qna_list" method="get">
                        <select name="type">
                          <option selected>검색종류선택</option>
                          <option value="N" ${pageMaker.cri.type == 'N'? 'selected': ''}>상품명</option>
                          <option value="C"${pageMaker.cri.type == 'C'? 'selected': ''}>상품코드</option>
                          <option value="P"${pageMaker.cri.type == 'P'? 'selected': ''}>제조사</option>
                          <option value="NP"${pageMaker.cri.type == 'NP'? 'selected': ''}>상품명 or 제조사</option>
                          </select>
                          <input type="text" name="keyword" value="${pageMaker.cri.keyword }" />
                          <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }" />
                          <input type="hidden" name="amount" value="${pageMaker.cri.amount }" />
                          <button type="submit" class="btn btn-dark">검색</button>
                        </form>		
                        </div>
                        <div class="box-body">
                        <table class="table table-bordered">
                        <tbody><tr>
                          <th style="width: 2%"><input type="checkbox" id="checkAll"></th>
                        <th	style="width: 25%">작성자</th>
                        <th	style="width: 10%">제목</th>
                        <th style="width: 20%">글내용</th>
                        <th style="width: 15%">올린날짜</th>
                        <th style="width: 10%">수정된날짜</th>
                        <th style="width: 10%">비고</th>
                        </tr>
                        <c:forEach items="${qnalist}" var="QnaVO">
                          <tr>
                              <td>${QnaVO.qa_num}</td>
                              <td class="left">
                                <c:forEach var="i" begin="1" end="${QnaVO.indent }">
                                  ${i eq QnaVO.indent ? "<img src='img/re.gif' /> 댓글" : "&nbsp;&nbsp;답글" }
                                </c:forEach>
                                <a href="/admin/qna/qna_detail?qa_num=${QnaVO.qa_num }" >${QnaVO.qa_title }</a>
                              </td>
                              <td>${QnaVO.qa_writer}</td>
                              <td>${QnaVO.qa_content}</td>
                              <td>${QnaVO.qa_regdate}</td>
                              <td>${QnaVO.qa_updatedate}</td>
                              <td><button class="btn btn-danger" type="button" name="btn_prod_del">삭제</button></td>
                              <!-- 필요한 속성 추가 -->
                          </tr>
                      </c:forEach>
                        </tbody></table>								
                        </div>
                        
                        <div class="box-footer clearfix">
                          <div class="row">
                            <div class="col-md-4">
                            <!--1)페이지번호 클릭할 때 사용  [이전]  1	2	3	4	5 [다음]  -->
                            <!--2)목록에서 상품이미지 또는 상품명 클릭할 때 사용   -->
                              <form id="actionForm" action="" method="get">
                              <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
                              <input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />

                              
                              </form>
                            </div>
                            <div class="col-md-6 text-center">
                              <nav aria-label="...">
                              <ul class="pagination">
                                <!-- 이전 표시여부 -->
                                <c:if test="${pageMaker.prev }">
                                  <li class="page-item">
                                    <a href="${pageMaker.startPage - 1 }" class="page-link movepage">Previous</a>
                                  </li>
                                </c:if>
                                <!-- 페이지번호 출력 -->
                                <!-- 1	2	3	4	5 6	7	8	9	10  [다음] -->
                                <!-- [이전] 11	12	13	14	15 16	17	18	19	20   -->
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


    </section>
    <!-- /.content -->
  </div>
   <!-- Main Footer -->
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

<!-- REQUIRED JS SCRIPTS -->
<script>
  $(document).ready(function (){
    let actionForm = $("#actionForm");

// <!--[이전] 1 2 3 4 5 [다음] 클릭 이벤트 설정--> <a>태그
$(".movepage").on("click", function(e) {
   e.preventDefault(); //a태그의 링크기능을 제거. href속성에 페이지번호를 숨겨둠

   actionForm.attr("action", "/admin/qna/qna_list");
   actionForm.find("input[name='pageNum']").val($(this).attr("href"));


   actionForm.submit();
});





  });
   $("button[name='btn_prod_del']").on("click", function(){


let prod_name = $(this).parent().parent().find(".prod_name").text();
if(!confirm(prod_name + " 상품을 삭제하시겠습니까?")) return;

let prod_num = $(this).parent().parent().find("input[name='check']").val();

console.log("상품코드", prod_num);


//뒤로가기 클릭후 다시 수정버튼 클릭시 코드 중복되는부분제거
actionForm.find("input[name='prod_num']").remove();

actionForm.append('<input type="hidden" name="prod_num" id="prod_num" value="' + prod_num + '" />');

actionForm.attr("method","post");
actionForm.attr("action","/admin/product/prod_delete");
actionForm.submit();

  });
  //ready 이벤트

</script>
</body>
</html>




