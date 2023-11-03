<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>상품관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/product/prod_insert">상품등록</a></li>
            <li><a href="/admin/product/prod_list">상품목록</a></li>
          </ul>
        </li>

                <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>주문관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">주문리스트</a></li>
            <li><a href="#">입금대기</a></li>
            <li><a href="#">입금완료</a></li>
            <li><a href="#">배송준비</a></li>
            <li><a href="#">배송중</a></li>
            <li><a href="#">배송완료</a></li>
             <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>취소/교환/반품/환불관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
              </a>
           <ul class="treeview-menu">
               <li><a href="#">주문리스트</a></li>
               <li><a href="#">주문리스트</a></li>
          </ul>
          </li>
          </ul>
        </li>
                <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>회원 관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">회원목록</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>고객지원</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">1:1 상담문의</a></li>
            <li><a href="#">회원 탈퇴내역</a></li>
             <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>FAQ관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
              </a>
           <ul class="treeview-menu">
               <li><a href="#">FAQ분류</a></li>
               <li><a href="#">FAQ관리</a></li>
          </ul>
          </li>
          </ul>
        </li>

                <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>카테고리관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#">카테고리관리</a></li>
            <li><a href="#">카테고리순위</a></li>
          </ul>
        </li>
      </ul>


        </ul>
      </li>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>