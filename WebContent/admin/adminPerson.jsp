<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />
<%
	request.setCharacterEncoding("utf-8");
	int pageSize = 5;	// 한 화면에 보여지는 수
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	String keyField = "", keyWord = "";					// 검색에 필요한 변수
	// 검색일때
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	int currentPage = Integer.parseInt(pageNum);		// 현재 페이지
	int startRow = (currentPage - 1) * pageSize + 1;	// 페이지 시작
	int endRow = currentPage * pageSize;				// 페이지 끝
	ArrayList<PersonBean> arrPerson = mgr.listPerson(startRow, endRow, keyField, keyWord);
	int count = mgr.personCount(keyField, keyWord);		// 전체 개인회원 수
	int number = count - (currentPage - 1) * pageSize;
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
		                			String birth[] = pb.getBirth().split(" ");
		                			String birth1 = birth[0];
		                	%>
		                			<tr class="text-center">
		                				<td><%=pb.getId() %></td>
		                				<td><%=pb.getNick() %></td>
		                				<td><%=birth1 %></td>
		                				<td><%=pb.getEmail() %></td>
		                				<td><%=pb.getPhone() %></td>
		                				<td><a href="adminDeletePro.jsp?memType=0&id=<%=pb.getId() %>" class="btn btn-danger m-2">삭제</a></td>
		               				</tr>
		                	<%
		                		}
		                	%>
		                </tbody>
					</table>
				</div>
				<div class="d-flex justify-content-end">
					<a href="adminPerson.jsp" class="btn btn-cam">전체회원보기</a> 
				</div>
			</div>
			<!-- /Person List -->
			<!-- 페이징 -->
			<div class="form-inline justify-content-center mt-2">	
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					<%
						if(count > 0) {
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	// 총 페이지 수 구하기
							int pageBlock = 2;	// 이전 다음 나오게 하는것
							int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;	// 계산상 마지막 페이지
							if(endPage > pageCount) {
								endPage = pageCount;
							}
							// 이전
							if(startPage > pageBlock) {
					%>	
				    	<li class="page-item">
				      		<a class="page-link" href="adminPerson.jsp?pageNum=<%=startPage - pageBlock%>" aria-label="Previous">
				        		<span aria-hidden="true" class="text-dark" style="font-weight:bolder;">이전</span>
				        		<span class="sr-only">Previous</span>
				      		</a>
				    	</li>
				   	<%
							}
						
						// 페이지 출력
							for(int i = startPage; i <= endPage; i++) {
								if(i == currentPage) {
				   	%>
				    	<li class="page-item active">
				    		<a class="page-link text-dark" href="#">
				    			<%= i %>
				    		</a>
				    	</li>
				    <%
								} else {
				    %>
				    	<li class="page-item">
				    		<a class="page-link text-dark" href="adminPerson.jsp?pageNum=<%= i %>">
				    			<%= i %>
				    		</a>
				    	</li>
				    <%
								}
							}	// -for
						
							// 다음
							if(endPage < pageCount) {
				    %>
				    	<li class="page-item">
				      		<a class="page-link" href="adminPerson.jsp?pageNum=<%=startPage + pageBlock%>" aria-label="Next">
				        		<span aria-hidden="true" class="text-dark" style="font-weight:bolder;">다음</span>
				        		<span class="sr-only">Next</span>
				      		</a>
				    	</li>
				    <%
							}	// -다음
						}	// if(count > 0)
				    %>
				  	</ul>
				</nav>
			</div>
			<!-- /페이징 -->
			<!-- 검색 -->
			<form method="post" id="personSearchFrm" class="form-inline justify-content-center">
				<input type="hidden" name="pageNum" value="1">
				<select name="keyField" class="form-control" id="search_control">
					<option value="person_id">ID</option>
					<option value="person_nick">닉네임</option>
				</select>
				
				<div class="input-group">
					<input type="text" id="personSearch" name="keyWord" class="form-control">
					<div class="input-group-append">
						<button type="button" id="personSearchBtn" class="btn btn-cam">검색</button>	
					</div>
				</div>
			</form>
			<!-- /검색 -->
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>