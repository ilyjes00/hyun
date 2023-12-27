<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
  <script>

</script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
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
            <div class="row">
              <div class="col-md-6">
                  <h3 class="box-title">회원목록</h3>
              </div>
              <div class="col-md-6 text-right">
                  <button class="btn btn-primary" type="button" name="btn_excel_down">엑셀다운로드</button>
              </div>
					</div>

					<div class="box-body">
						<div>
							<form action="/admin/member/list" method="get" >
							</form>
						</div>
						<table class="table table-bordered" id="order_info_tbl">
							<tbody><tr>
                <th style="width: 10%">아이디</th>
								<th style="width: 8%">이름</th>
								<th style="width: 10%">이메일</th>
								<th style="width: 10%">우편번호</th>
								<th style="width: 15%">주소</th>
								<th style="width: 15%">상세주소</th>
								<th style="width: 10%">전화번호</th>
								<th style="width: 10%">포인트</th>
								<th style="width: 10%">비고</th>
							</tr>
							<c:forEach items="${list }" var="vo">
                <input type="hidden" name="mbsp_id" value="${vo.mbsp_id }" />
							<tr>
                <td>${vo.mbsp_id}</td>
								<td>${vo.mbsp_name}</td>
								<td>${vo.mbsp_email}</td>
                <td>${vo.mbsp_zipcode}</td>
                <td>${vo.mbsp_addr}</td>
                <td>${vo.mbsp_deaddr}</td>
                <td>${vo.mbsp_phone}</td>
                <td>${vo.mbsp_point}</td>
                <td><button class="btn btn-primary" type="button" name="btn_mem_mod" data-mbspid="${vo.mbsp_id}">수정</button>
                <button class="btn btn-danger" type="button" name="btn_mem_del" data-mbspid="${vo.mbsp_id}">삭제</button></td>
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
								<input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
								<input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
								
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
			   </div>
    		</div>
    	</div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>

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
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

<script>
  $(document).ready(function() {

    let actionForm = $("#actionForm");

    // [이전] 1 2 3 4 5 [다음] 클릭 이벤트 설정. <a>태그
    $(".movepage").on("click", function(e) {
      e.preventDefault(); // a태그의 href 링크기능을 제거. href속성에 페이지번호를 숨겨둠.

      actionForm.attr("action", "/admin/member/list");
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));

       actionForm.submit();
    });


                  // non-ajax
$("button[name='btn_mem_del']").on("click" , function() {

if(!confirm("삭제하시겠습니까?")) return;

let mbsp_id = $(this).data("mbspid");
location.href = "/admin/member/delete?mbsp_id=" + mbsp_id;
});

$("button[name='btn_mem_mod']").on("click" , function() {

if(!confirm("수정하시겠습니까?")) return;

let mbsp_id = $(this).data("mbspid");
location.href = "/admin/member/modify?mbsp_id=" + mbsp_id;
});

$("button[name='btn_excel_down']").on("click" , function() {

  if(!confirm("회원정보 엑셀을 다운로드하시겠습니까??")) return;

  location.href = "/admin/member/list/excelDown.do";
});




    
  // 주문상세 방법1 이벤트

  function getOrderDetailInfo(url,cur_tr) {
    $.getJSON(url, function(data) {

      // data : 주문상세정보
      //console.log("상세정보", data[0].ord_code);

      printOrderDetailList(data, cur_tr, $("#orderDetailTemplate"))


    });
  }

  let printOrderDetailList = function(orderDetailData, target, template) {
      let templateObj = Handlebars.compile(template.html());
      let orderDetailHtml = templateObj(orderDetailData);

        //상품후기목록 위치를 참조하여, 추가
        // target.children().remove(); 
        target.parent().find(".tr_detail_info").remove();
        target.after(orderDetailHtml);
  }
  //주문상세에서 개별삭제
  $("table#order_info_tbl").on("click", "button[name='btn_order_delete']", function() {

            if(!confirm("상품코드" + pro_num + "번을 삭제하시겠습니까?")) return;
    //console.log("삭제");

    //주문상세테이블은 primary key가 2개컬럼을 대상으로 복합키 설정이 되어있다.
    let ord_code = $(this).data("ord_code");
    let prod_num  = $(this).data("prod_num");

    if(!confirm("상품코드" + prod_num + "번을 삭제하시겠습니까?")) return;

    //<input type='hidden' name='ord_code' value=''>

    actionForm.append("<input type='hidden' name='ord_code' value='" + ord_code + "'>");
    actionForm.append("<input type='hidden' name='prod_num' value='" + prod_num + "'>");

    actionForm.attr("action", "/admin/order/order_product_delete");
    actionForm.submit();

  });

  


}); // ready 이벤트
</script>
</body>
</html>