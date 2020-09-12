<%@page import="mySpec.OrgBean"%>
<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />

<%
	request.setCharacterEncoding("utf-8");
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	String keyField = "", keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	ArrayList<OrgBean> arrOrg = mgr.listOrg(startRow, endRow, keyField, keyWord);
	int count = mgr.orgCount(keyField, keyWord);
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
		                	<tr class="text-center">
		                    	<th>ID</th>
		                    	<th>기관명칭</th>
		                    	<th>기관타입</th>
		                    	<th>담당자</th>
		                    	<th>담당자 메일</th>
		                    	<th>담당자 전화번호</th>
		                    	<th>삭제</th>
		                  	</tr>
		                </thead>
		                <tbody>
		                	<%
		                		for(OrgBean ob : arrOrg) {
		                			String type = "";
		                			switch(ob.getType()) {
		                				case 88 :
		                					type = "대기업";
		                					break;
		                				case 89 :
		                					type = "중소기업/스타트업";
		                					break;
		                				case 90 :
		                					type = "공공기관/공기업";
		                					break;
		                				case 91 :
		                					type = "외국계기업";
		                					break;
		                				case 92 :
		                					type = "중견기업";
		                					break;
		                				case 93 :
		                					type = "비영리단체/협회/교육재단";
		                					break;
		                				case 94 :
		                					type = "병원";
		                					break;
		                				case 95 :
		                					type = "동아리/학생자치단체";
		                					break;
		                				case 96 :
		                					type = "기타";
		                					break;
		                			}
		                	%>
		                			<tr class="text-center">
		                				<td><%=ob.getId() %></td>
		                				<td><%=ob.getName() %></td>
		                				<td><%=type %></td>
		                				<td><%=ob.getManager() %></td>
		                				<td><%=ob.getEmail() %></td>
		                				<td><%=ob.getPhone() %></td>
		                				<td><a href="adminDeletePro.jsp?memType=1&id=<%=ob.getId()%>" class="btn btn-danger m-2">삭제</a></td>
		               				</tr>
		                	<%		
		                		}
		                	%>
		                </tbody>
					</table>
				</div>
				<div class="d-flex justify-content-end">
					<a href="adminOrg.jsp" class="btn btn-cam">전체회원보기</a> 
				</div>
			</div>	
			<!-- /Org List -->
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
				      		<a class="page-link" href="adminPerson.jsp?pageNum=<%=startPage - pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Previous">
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
				    		<a class="page-link text-dark" href="adminPerson.jsp?pageNum=<%= i %>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
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
				      		<a class="page-link" href="adminPerson.jsp?pageNum=<%=startPage + pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Next">
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
			<form method="get" id="orgSearchFrm" class="form-inline justify-content-center">
				<input type="hidden" name="pageNum" value="1">
				<select name="keyField" class="form-control" id="search_control">
					<option value="org_id">ID</option>
					<option value="org_name">기관명</option>
				</select>
				
				<div class="input-group">
					<input type="text" id="orgSearch" name="keyWord" class="form-control">
					<div class="input-group-append">
						<button type="button" id="orgSearchBtn" class="btn btn-cam">검색</button>	
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