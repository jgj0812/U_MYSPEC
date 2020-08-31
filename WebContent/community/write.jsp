<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="container my-3">
<div class="card bg-light mt-3">
	<div class="card-header bg-light">
		<div class="row">
			<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">글작성</div>	
		</div>
	</div>
</div>

<form>
	<hr style="height: 2px; background-color: black;">
		<div class="row">
			<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">게시판</div>
			<select class="form-control  col-3" style="margin-left:20px;">
				<option value="전체">공지</option>
				<option value="전체">자유 게시판</option>
			</select>
		</div>
		<hr>
		<div class="row">
			<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">제목</div>
			<input type="text" name="" class="form-control col-8" placeholder="내용을 입력하세요" style="margin-left:32px;">
		</div>
		<hr>
		<textarea class="form-control" rows="15"></textarea>
		<hr>
		<div class="form-inline justify-content-end">
		<button type="button" class="btn btn-danger text-white" onclick="community()">취소</button>&nbsp;
		<input type="submit" class="btn btn-com" value="확인">
		</div>
</form>
</section>