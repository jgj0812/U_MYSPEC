<%@page import="mySpec.OrgBean"%>
<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />

<% 
	ArrayList<OrgBean> arrOrg = mgr.listOrg();
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
			
			<!-- Org List -->
			<div class="col-lg-12 bg-light p-4">단체회원</div>
		    <div class="col-lg-12 border border-light">
		       	<div class="table-responsive">
		           	<table class="table table-sm table-hover">
		               	<thead>
		                	<tr>
		                    	<th>ID</th>
		                    	<th>기관명칭</th>
		                    	<th>기관타입</th>
		                    	<th>담당자</th>
		                    	<th>담당자 메일</th>
		                    	<th>담당자 전화번호</th>
		                  	</tr>
		                </thead>
		                <tbody>
		                	<%
		                		for(OrgBean ob : arrOrg) {
		                	%>
		                			<tr>
		                				<td><%=ob.getId() %></td>
		                				<td><%=ob.getName() %></td>
		                				<td><%=ob.getType() %></td>
		                				<td><%=ob.getManager() %></td>
		                				<td><%=ob.getEmail() %></td>
		                				<td><%=ob.getPhone() %></td>
		               				</tr>
		                	<%		
		                		}
		                	%>
		                </tbody>
					</table>
				</div> 
			</div>	
			<!-- /Org List -->
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>