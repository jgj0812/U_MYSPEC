<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<main>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/admin/adminSidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
			
			<!-- NoticeWrite -->
			<div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<div class="row">
						<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">글작성</div>	
					</div>
				</div>
			</div>
	
			<form action="adminNoticeWritePro.jsp" id="comm_form" name="comm_form" method="post">
				<hr style="height: 2px; background-color: black;">
		
				<div class="row">
					<!--  comm_type 공지사항인지 일반글인지 -->
					<input type="hidden" name="comm_type" value="0">
					<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">게시판</div>
				</div>
			
				<hr>
			
				<!--  제목-->
				<div class="row">
					<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">제목</div>
					<input type="text" id="comm_title" name="comm_title" class="form-control col-8" placeholder="내용을 입력하세요" style="margin-left:32px;">
				</div>
			
				<hr>
			
				<textarea id="comm_content" name="comm_content" rows="15"></textarea>
			
				<hr>
			
				<!--  입력, 취소버튼-->
				<div class="form-inline justify-content-end">
					<button type="button" class="btn btn-danger text-white" onclick="location.href='adminNotice.jsp'">취소</button>&nbsp;
					<input type="button" id="comm_write" class="btn btn-com" value="확인">
				</div>
			</form>
			<!-- /Notice Write -->
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>