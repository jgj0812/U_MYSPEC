<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />
<%
	request.setCharacterEncoding("utf-8");
	int totalRecord = 0;	// 총 게시물 수
	int numPerPage = 10;	// 페이지당 레코드 개수
	int pagePerBlock = 15;	// 블럭당 페이지 개수
	int totalPage = 0;		// 총 페이지 개수
	int totalBlock = 0;		// 총 블럭 개수
	int nowPage = 1;		// 현재 페이지
	int nowBlock = 1;		// 현재 블럭
	
	// nowPage 요청
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
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
			<input type="hidden" name="listmemType" value="0">
		    <div class="col-lg-12 border border-light">
		    	<div class="table-responsive">
		        	<table class="table table-sm table-hover">
		            	<thead>
		                	<tr class="text-center">
		                    	<th>ID</th>
		                    	<th>닉네임</th>
		                    	<th>생년월일</th>
		                    	<th>이메일</th>
		                    	<th>전화번호</th>
		                    	<th>삭제</th>
		                  	</tr>
		                </thead>
		                <tbody>
		                	<%
		                		for(PersonBean pb : arrPerson) {
		                	%>
		                			<tr class="text-center">
		                				<td><%=pb.getId() %></td>
		                				<td><%=pb.getNick() %></td>
		                				<td><%=pb.getBirth() %></td>
		                				<td><%=pb.getEmail() %></td>
		                				<td><%=pb.getPhone() %></td>
		                				<td onclick="person_del('<%=pb.getId() %>')"><button class="btn btn-danger m-2">삭제</button></td>
		               				</tr>
		                	<%
		                		}
		                	%>
		                </tbody>
					</table>
				</div>
			</div>
			<!-- /Person List -->
			<!-- 페이징 -->
			<div class="form-inline justify-content-center">		
				<nav aria-label="Page navigation example">
					<ul class="pagination">
				    	<li class="page-item">
				      		<a class="page-link" href="#" aria-label="Previous">
				        		<span aria-hidden="true" class="text-dark" style="font-weight:bolder;">처음</span>
				        		<span class="sr-only">Previous</span>
				      		</a>
				    	</li>
				    	<li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
				    	<li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
				    	<li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
				    	<li class="page-item">
				      		<a class="page-link" href="#" aria-label="Next">
				        		<span aria-hidden="true" class="text-dark" style="font-weight:bolder;">끝</span>
				        		<span class="sr-only">Next</span>
				      		</a>
				    	</li>
				  	</ul>
				</nav>
			</div>
			<!-- /페이징 -->
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>