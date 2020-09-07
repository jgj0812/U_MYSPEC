<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
	<!-- admin Login -->
	<section class="py-5">
		<h1 class="text-center">로그인</h1>
		<div class="container">
			<div class="col-lg-8 mx-auto">
				<div class="card">
					<div class="card-body">
						<form action="adminLoginPro.jsp" method="post">
							<div class="form-group">
								<label for="id">id</label>
								<input type="text" name="admin_id" class="form-control" />
							</div>
							<div class="form-group">
								<label for="id">비밀번호</label>
								<input type="password" name="admin_pwd" class="form-control" />
							</div>
							<input type="submit" value="로그인" class="btn btn-cam btn-block" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /admin Login -->
<%@ include file="/admin/adminFooter.jsp" %>