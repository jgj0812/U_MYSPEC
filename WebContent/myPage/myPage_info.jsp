<%@page import="mySpec.OrgBean"%>
<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="myspec.js"></script>
<jsp:useBean id="igr" class="mySpec.MemberMgr" />
<%
	PersonBean ip = igr.infoPerson(id);
	OrgBean op = igr.infoOrg(id);
	String date[] = ip.getBirth().split(" ");
	String birth = date[0];
%>

<main class="">
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
			
			<
			<div class="container">
				<%if(member == 0) {%>
				<!-- 개인회원 정보수정 -->
				<form action="myPage_infoUpdate.jsp" id="UpdateFrm" method="post">
				<div class="card">
				  <div class="card-header">
				    <h4 class="title">회원정보 변경</h4>
				  </div>
				  <div class="card-body pb-5">
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>ID</label>
				          <input type="text" name="id" class="form-control" value="<%=id%>" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>NickName</label>
				          <input type="text" name="nick" class="form-control" value="<%=ip.getNick()%>"  />
				        </div>
				      </div>
				    </div>
				
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>Birth</label>
				          <input type="text" name="birth" class="form-control" value="<%=birth%>" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="form-group">
				          <label>Phone</label>
				          <input type="text" name="phone" class="form-control" value="<%=ip.getPhone()%>"/>
				        </div>
				      </div>
				    </div>
					<div class="form-group">
					    <label>Email</label>
					    <input type="email" name="email" class="form-control" value="<%=ip.getEmail()%>" />
				    </div>
				    <div class="form-group">
					    <label>old-Password</label>
					    <input type="password" class="form-control pw" name="old_pwd" id="old_pwd" />
				    </div>
					<div class="form-group">
					    <label>Password</label>
					    <input type="password" class="form-control pw" name="pwd" id="password" />
				    </div>
				    <div class="form-group">
					    <label>Password-Check</label>
					    <input type="password" class="form-control pw" name="pwd_check" id="pwd_check" />
				    </div>
				    <input
                        type="button"
                        value="수정"
                        id="UpdateBtn"
                        class="btn btn-cam col-md-4"
                      />
                      &nbsp;
                      <input
                        type="reset"
                        value="취소"
                        class="btn btn-danger col-md-4"
                      />
				  </div>
				 </form>
				</div>
				
				
				<%
				}
				else { %>
				<!-- 단체회원 정보수정 -->
				<form action="myPage_infoUpdate2.jsp" id="UpdateFrm" method="post">
				<div class="card">
				  <div class="card-header">
				    <h4 class="title">회원정보 변경</h4>
				  </div>
				  <div class="card-body pb-5">
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>ID</label>
				          <input type="text" class="form-control" name="id" value="<%=op.getId()%>" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>Manager</label>
				          <input type="text" class="form-control" name="manager" value="<%=op.getManager()%>" />
				        </div>
				      </div>
				    </div>
				
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>OrgName</label>
				          <input type="text" class="form-control" value="<%=op.getName() %>" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>OrgType</label>
				          <input type="text" class="form-control" <%=op.getType() %> readonly />
				        </div>
				      </div>
				    </div>
					<div class="form-group">
					    <label>Phone</label>
					    <input type="text" class="form-control" name="phone" value="<%=op.getPhone() %>" />
					</div>
				    <div class="form-group">
					    <label>Email</label>
					    <input type="email" class="form-control" name="email" value="<%=op.getEmail() %>" />
				    </div>
					  <div class="form-group">
					    <label>old-Password</label>
					    <input type="password" class="form-control pw" name="old_pwd" id="old_pwd" />
				    </div>
					<div class="form-group">
					    <label>Password</label>
					    <input type="password" class="form-control pw" name="pwd" id="password" />
				    </div>
				    <div class="form-group">
					    <label>Password-Check</label>
					    <input type="password" class="form-control pw" name="pwd_check" id="pwd_check" />
				    </div>
				    <input
	                    type="button"
	                    id="UpdateBtn"
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
			  </form>
				<%} %>
			</div>
			
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>

<%@ include file="../footer.jsp" %>