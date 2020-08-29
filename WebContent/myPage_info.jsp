<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<%
	int member = (int)session.getAttribute("member");
%>
<main class="">
	<div class="d-flex" id="wrapper">
		
		<!-- sidebar -->
		<div class="bg-light" id="sidebar-wrapper">
			<%if(member == 0) {%>
			<!-- 개인회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                커뮤니티
              </h3>
			<div class="list-group list-group-flush">
				<a href="myPage_community.jsp" class="list-group-item list-group-item-action bg-light">내가 쓴 글</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">댓글 쓴 글</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                스크랩
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원정보
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">회원정보 변경</a>
				<a href="myPage_delete.jsp" class="list-group-item list-group-item-action bg-light">회원탈퇴</a>
			</div>
			<%}else { %>
			<!-- 단체회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                모집중인 활동
              </h3>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                승인 대기 중
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원정보
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">회원정보 변경</a>
				<a href="myPage_delete.jsp" class="list-group-item list-group-item-action bg-light">회원탈퇴</a>
			</div>
			<%} %>
		</div>
		<!-- /sidebar -->
		
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
</main>
<%@ include file="/footer.jsp" %>