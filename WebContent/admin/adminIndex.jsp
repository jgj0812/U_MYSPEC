<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<main>
	<div class="d-flex" id="wrapper">
		<div class="bg-light border-right" id="sidebar-wrapper">
			<!-- 개인회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원관리
              </h3>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">일반회원</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">단체회원</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                공모전, 대외활동
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동 관리</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전 관리</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                커뮤니티
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">공지글 관리</a>
				<a href="myPage_delete.jsp" class="list-group-item list-group-item-action bg-light">일반글 관리</a>
			</div>
			<div class="container mt-2">
				<a href="adminLogoutPro.jsp" class="btn btn-cam btn-block">로그아웃</a>
			</div>
		</div>
		<!-- /wrapper -->
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
			
			<div class="container"></div>
		</div>
		<!-- /page Content -->
	</div>
</main>
<%@ include file="/admin/adminFooter.jsp" %>