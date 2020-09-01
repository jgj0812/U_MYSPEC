<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />
<% 
	ArrayList<PersonBean> arrPerson = mgr.listPerson();
%>
<main>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/admin/adminSidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<!-- toggle 버튼 -->
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
			<!-- /toggle 버튼 -->
			
			<!-- Person List -->
			<div class="col-lg-12 bg-light p-4">개인회원</div>
		    <div class="col-lg-12 border border-light">
		    	<div class="table-responsive">
		        	<table class="table table-sm table-hover">
		            	<thead>
		                	<tr>
		                    	<th>ID</th>
		                    	<th>닉네임</th>
		                    	<th>생년월일</th>
		                    	<th>이메일</th>
		                    	<th>전화번호</th>
		                  	</tr>
		                </thead>
		                <tbody>
		                	<%
		                		for(PersonBean pb : arrPerson) {
		                	%>
		                			<tr>
		                				<td><%=pb.getId() %></td>
		                				<td><%=pb.getNick() %></td>
		                				<td><%=pb.getBirth() %></td>
		                				<td><%=pb.getEmail() %></td>
		                				<td><%=pb.getPhone() %></td>
		               				</tr>
		                	<%		
		                		}
		                	%>
		                </tbody>
					</table>
				</div>
			</div>
			<!-- /Person List -->
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>