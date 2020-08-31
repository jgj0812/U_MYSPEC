<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<section class="">
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/myPage/myPage_sidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
                <h2>MY 페이지</h2>
			</nav>
			
			<div class="container">
				<%if(member == 0) {%>
				<!-- 개인회원 정보수정 -->
				<div class="card">
				  <div class="card-header">
				    <h4 class="title">회원정보 변경</h4>
				  </div>
				  <div class="card-body pb-5">
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>ID</label>
				          <input type="text" class="form-control" name="" id="" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>NickName</label>
				          <input type="text" class="form-control" name="" id="" />
				        </div>
				      </div>
				    </div>
				
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>Birth</label>
				          <input type="date" class="form-control" name="" id="" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="form-group">
				          <label>Phone</label>
				          <input type="text" class="form-control" name="" id="" />
				        </div>
				      </div>
				    </div>
					<div class="form-group">
					    <label>Email</label>
					    <input type="email" class="form-control" name="" id="" />
				    </div>
					<div class="form-group">
					    <label>Password</label>
					    <input type="text" class="form-control" name="" id="" />
				    </div>
				    <div class="form-group">
					    <label>Password-Check</label>
					    <input type="text" class="form-control" name="" id="" />
				    </div>
				    <input
                        type="button"
                        id=""
                        value="수정"
                        class="btn btn-cam col-md-4"
                      />
                      &nbsp;
                      <input
                        type="reset"
                        value="취소"
                        class="btn btn-danger col-md-4"
                      />
				  </div>
				</div>
				<%}else { %>
				<!-- 단체회원 정보수정 -->
				<div class="card">
				  <div class="card-header">
				    <h4 class="title">회원정보 변경</h4>
				  </div>
				  <div class="body pb-5">
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>ID</label>
				          <input type="text" class="form-control" name="" id="" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>Manager</label>
				          <input type="text" class="form-control" name="" id="" />
				        </div>
				      </div>
				    </div>
				
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>OrgName</label>
				          <input type="text" class="form-control" name="" id="" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>OrgType</label>
				          <input type="text" class="form-control" name="" id="" readonly />
				        </div>
				      </div>
				    </div>
					<div class="form-group">
					    <label>Phone</label>
					    <input type="text" class="form-control" name="" id="" />
					</div>
				    <div class="form-group">
					    <label>Email</label>
					    <input type="email" class="form-control" name="" id="" />
				    </div>
					<div class="form-group">
					    <label>Password</label>
					    <input type="text" class="form-control" name="" id="" />
				    </div>
				    <div class="form-group">
					    <label>Password-Check</label>
					    <input type="text" class="form-control" name="" id="" />
				    </div>
				    <input
	                    type="button"
	                    id=""
	                    value="수정"
	                    class="btn btn-cam col-md-4"
	                  />
	                  &nbsp;
	                  <input
	                    type="reset"
	                    value="취소"
	                    class="btn btn-danger col-md-4"
	                  />
				  </div>
				</div>
				<%} %>
			</div>
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</section>
<%@ include file="/footer.jsp" %>