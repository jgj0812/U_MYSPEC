<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<h3 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            	회원관리
            </h3>
			<div class="list-group list-group-flush">
				<a href="adminPerson.jsp" class="list-group-item list-group-item-action bg-light">개인회원</a>
				<a href="adminOrg.jsp" class="list-group-item list-group-item-action bg-light">단체회원</a>
			</div>
			
			<h3 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            	공모전, 대외활동
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동 관리</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전 관리</a>
			</div>
			
			<h3 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            	커뮤니티
            </h3>
            <div class="list-group list-group-flush">
				<a href="adminNotice.jsp" class="list-group-item list-group-item-action bg-light">공지글 관리</a>
				<a href="myPage_delete.jsp" class="list-group-item list-group-item-action bg-light">일반글 관리</a>
			</div>
			<div class="container mt-2">
				<a href="adminLogoutPro.jsp" class="btn btn-cam btn-block">로그아웃</a>
			</div>
		</div>
		<!-- /sidebar -->