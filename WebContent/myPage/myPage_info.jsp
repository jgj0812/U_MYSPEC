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
	String orgType = "";
	switch(op.getType()) {
		case 88 :
			orgType="대기업";
			break;
		case 89 :
			orgType="중소기업/스타트업";
			break;
		case 90 :
			orgType="공공기관/공기업";
			break;
		case 91 :
			orgType="외국계기업";
			break;
		case 92 :
			orgType="중견기업";
			break;
		case 93 :
			orgType="비영리단체/협회/교육재단";
			break;
		case 94 :
			orgType="병원";
			break;
		case 95 :
			orgType="동아리/학생자치단체";
			break;
		case 96 :
			orgType="기타";
			break;
	}
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
			</nav>
			
			
			<div class="container">
				<%if(member == 0) {
					String date[] = ip.getBirth().split(" ");
					String birth = date[0];
				%>
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
				          <input type="text" name="id" class="form-control" value="<%=id%>" style="margin-bottom: 13px" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>닉네임</label>
				          <input type="text" name="nick" id="nick_check" class="form-control" value="<%=ip.getNick()%>" style="margin-bottom: 13px" />
				        </div>
				      </div>
				    </div>
				
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>생년월일</label>
				          <input type="text" name="birth" class="form-control" value="<%=birth%>" style="margin-bottom: 13px" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="form-group">
				          <label>연락처</label>
				          <input type="text" name="phone" id="phone_check" class="form-control" value="<%=ip.getPhone()%>" style="margin-bottom: 13px"/>
				        </div>
				      </div>
				    </div>
				    
					<div class="form-group">
					    <label>Email</label>
					    <input type="email" name="email" id="email_check" class="form-control" value="<%=ip.getEmail()%>" />
				    </div>
				    <div class="form-group">
					    <label>기존 비밀번호</label>
					    <input type="password" class="form-control pw" name="old_pwd" id="old_pwd" />
				    </div>
					<div class="form-group">
					    <label>새로운 비밀번호</label>
					    <input type="password" class="form-control pw" name="pwd" id="password" />
				    </div>
				    <div class="form-group">
					    <label>새로운 비밀번호 확인</label>
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
				          <label>담당자</label>
				          <input type="text" class="form-control" id="manager_check" name="manager" value="<%=op.getManager()%>" />
				        </div>
				      </div>
				    </div>
				
				    <div class="row">
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>기관명</label>
				          <input type="text" class="form-control" value="<%=op.getName() %>" readonly />
				        </div>
				      </div>
				      <div class="col-md-6 col-sm-12">
				        <div class="from-group">
				          <label>기관타입</label>
				          <input type="text" class="form-control" value="<%=orgType%>" readonly />
				        </div>
				      </div>
				    </div>
					<div class="form-group">
					    <label>연락처</label>
					    <input type="text" class="form-control" id="phone_check" name="phone" value="<%=op.getPhone() %>" />
					</div>
				    <div class="form-group">
					    <label>Email</label>
					    <input type="email" class="form-control" id="email_check" name="email" value="<%=op.getEmail() %>" />
				    </div>
					  <div class="form-group">
					    <label>기존 비밀번호</label>
					    <input type="password" class="form-control pw" name="old_pwd" id="old_pwd" />
				    </div>
					<div class="form-group">
					    <label>새로운 비밀번호</label>
					    <input type="password" class="form-control pw" name="pwd" id="password" />
				    </div>
				    <div class="form-group">
					    <label>새로운 비밀번호 확인</label>
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