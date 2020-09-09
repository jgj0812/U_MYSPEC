<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<section class="container my-3">
	<div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row">
				<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">글작성</div>	
			</div>
		</div>
	</div>
	
	<form action="writePro.jsp" name="comm_form" method="post">
		<hr style="height: 2px; background-color: black;">
		
		
			<div class="row">
				<!--  comm_type 공지사항인지 일반글인지 -->
				<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">게시판</div>
				<!-- <select name="comm_type" class="form-control col-3" style="margin-left:20px;">
					<option value="0">공지</option>
					<option value="1">자유 게시판</option>
				</select> -->
				<input type="hidden" name="comm_type" value="1">
			</div>
			
			<hr>
			
			<!--  제목-->
			<div class="row">
				<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">제목</div>
				<input type="text" name="comm_title" class="form-control col-8" placeholder="내용을 입력하세요" style="margin-left:32px;">
			</div>
			
			<hr>
			
			<textarea id="comm_content" name="comm_content" rows="15"></textarea>
			
			<hr>
			
			<!--  입력, 취소버튼-->
			<div class="form-inline justify-content-end">
				<button type="button" class="btn btn-danger text-white" onclick="location.href='community.jsp'">취소</button>&nbsp;
				<input type="submit" class="btn btn-com" value="확인">
			</div>
	</form>
</section>
<%@ include file="../footer.jsp" %>