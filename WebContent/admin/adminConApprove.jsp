<%@page import="mySpec.OrgBean"%>
<%@page import="mySpec.ActivityBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.ActivityMgr" />
<%
	request.setCharacterEncoding("utf-8");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	ActivityBean bean = mgr.getActivity(act_num);
	OrgBean org = mgr.getOrg(act_num);
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
	
			<!-- Approve -->
			<section class="container py-5">
		    	<div class="section">
		        	<div>
		          		<p class="badge badge-secondary">D-<%=bean.getAct_dday() %></p>
		        	</div>
		        	<div class="d-flex">
		          		<h3><%=bean.getAct_title() %></h3>
		          		<div class="ml-auto">
		          			<%if(bean.getAct_approve() == 0) {%>
		            		<a href="adminActConApprovePro.jsp?act_num=<%=act_num %>&act_type=<%=bean.getAct_type() %>" class="btn btn-cam" >
		            			승인
		            		</a>
		            		<%} %>
		            		<a href="adminActConDeletePro.jsp?act_num=<%=act_num %>&act_type=<%=bean.getAct_type() %>" class="btn btn-danger" >
		            			삭제
		            		</a>
		          		</div>
		        	</div>
		        <hr />
				</div>
		      	<div class="section">
		        	<div class="row">
		          		<div class="col-md-4">
		            		<img src="../upload/<%=bean.getAct_thumb() %>" width="100%" />
		          		</div>
		          		<div class="col-md-8">
		            		<div class="row">
		              			<div class="col-md-12">
		                			<h5><%=org.getName() %></h5>
		              			</div>
		            		</div>
		            		<div class="row">
		              			<div class="col-md-2">
		                			<p>기관형태</p>
		              			</div>
		              			<div class="col-md-4">
		                			<p><%=mgr.getTag(org.getType()) %></p>
		              			</div>
		              			<div class="col-md-2">
		                			<p>참여대상</p>
		              			</div>
		              			<div class="col-md-4">
		                			<p><%=bean.getAct_target() %></p>
		              			</div>
		            		</div>
		            		<div class="row">
		              			<div class="col-md-2">
		                			<p>접수기간</p>
		              			</div>
		              			<div class="col-md-4">
		                			<p><%=bean.getAct_start() %> - <%=bean.getAct_end() %></p>
		              			</div>
		              			<div class="col-md-2">
		                			<p>시상규모</p>
		              			</div>
		              			<div class="col-md-4">
		                			<p><%=bean.getAct_award() %></p>
		              			</div>
		            		</div>
		            		<div class="row">
		              			<div class="col-md-2">
		                			<p>활동혜택</p>
		              			</div>
		              			<div class="col-md-4">
		                			<p>
		                				<%
		                					for(int act_reward : bean.getAct_reward()) {
		                						out.println(mgr.getTag(act_reward) + " ");
		                					}
		                				%>
		                			</p>
		              			</div>
		              			<div class="col-md-2">
		                			<p>공모분야</p>
		              			</div>
		              			<div class="col-md-4">
		                			<p><%=mgr.getTag(bean.getAct_field()) %></p>
		              			</div>
		            		</div>
		            		<div class="row">
		              			<div class="col-md-2">
		                			<p>홈페이지</p>
		              			</div>
		              			<div class="col-md-4 text-truncate">
		                			<a href="<%=bean.getAct_home()%>"><%=bean.getAct_home() %></a>
		              			</div>
		            		</div>
		          		</div>
		        	</div>
				</div>
		      	<br />
		
		      	<div class="section">
		        	<h5>상세내용</h5>
		        	<img src="../upload/<%=bean.getAct_post() %>" width="100%" />
		        	<%=bean.getAct_content() %>
		      	</div>
		      	<br />
		
		      	<div class="section">
		        	<div class="row">
		          		<div class="col-md-12">
		            		<h5>담당자 정보</h5>
		          		</div>
		        	</div>
			       	<div class="row">
			        	<div class="col-md-4">
			            	<p>담당자</p>
			          	</div>
			          	<div class="col-md-8">
			          		<%=org.getManager() %>
			          	</div>
			        </div>
			        <div class="row">
			        	<div class="col-md-4">
			            	<p>연락처</p>
			          	</div>
			          	<div class="col-md-8">
			          		<%=org.getPhone() %>
			          	</div>
			        </div>
			        <div class="row">
			        	<div class="col-md-4">
			            	<p>이메일</p>
			          	</div>
			          	<div class="col-md-8">
			          		<%=org.getEmail() %>
			          	</div>
			        </div>
		      	</div>
			</section>
			<!-- /Approve -->
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>