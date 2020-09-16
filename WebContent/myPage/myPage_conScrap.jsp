<%@page import="mySpec.ActivityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="mgr" class="mySpec.ActivityMgr" />
<%
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	ArrayList<ActivityBean> conScrapArr = mgr.conScrapList(startRow, endRow, id);
	int count = mgr.conScrapCount(id);
%>
<main>
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
				<div class="col-lg-12 bg-light p-4">스크랩한 공모전</div>
		        <div class="col-lg-12 border border-light">
		        	<div class="table-responsive">
		            	<table class="table table-sm table-hover">
		            		<thead>
						 		<tr class="d-flex">
						 			<th class="col-md-1 d-none d-lg-table-cell">썸네일</th>
						 			<th class="col-md-6 d-none d-lg-table-cell">제목</th>
						 			<th class="col-md-2 d-none d-lg-table-cell">주최기관</th>
						 			<th class="col-md-2 d-none d-lg-table-cell">디데이</th>
						 			<th class="col-md-1 d-none d-lg-table-cell">조회수</th>
						 		</tr>
						 	</thead>
		              		<tbody>
			              	<%
			              		for(ActivityBean bean : conScrapArr) {
			              	%>
		                	<tr class="d-flex">
		                  		<td class="col-md-1 col-4">
		                  			<div class="thumbnail">
		                    			<img class="" width="100%" src="../upload/<%=bean.getAct_thumb() %>"  alt="썸네일" />
		                    		</div>
		                  		</td>
		                  		<td class="col-md-6">
		                    		<a href="../contest/list_con_detail.jsp?act_num=<%=bean.getAct_num() %>" class="h5  d-none d-lg-table-cell">
		                    			<%=bean.getAct_title() %>
		                    		</a>
		                    		<a href="../contest/list_con_detail.jsp?act_num=<%=bean.getAct_num() %>" class="d-block d-sm-none text-truncate" style="max-width: 200px;">
		                    			<%=bean.getAct_title() %>
		                    		</a>
		                    		<div class="d-block d-sm-none">
		                      			<small> <%=bean.getOrg_name() %> <p class="badge badge-secondary">D-<%=bean.getAct_dday() %></p> 조회수 <%=bean.getAct_hits() %></small>
		                    		</div>
		                  		</td>
		                  		<td class="col-md-2 d-none d-lg-table-cell"><%=bean.getOrg_name() %></td>
		                  		<td class="col-md-2 d-none d-lg-table-cell">
		                  			<p class="badge badge-secondary">D-<%=bean.getAct_dday() %></p>
		                  		</td>
		                  		<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getAct_hits() %></td>
		                	</tr>
		                	<%} %>
		              		</tbody>
						</table>
					</div>
				</div>
				<!-- 페이징 -->
				<div class="form-inline justify-content-center mt-2">		
					<nav aria-label="Page navigation example">
						<ul class="pagination">
						<%	if(count > 0) { 	
								// 총 페이지 수 구하기, 전체 글개수 나누기 페이지사이즈(한 화면에 보여지는 수)
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	 					
								int pageBlock = 4;	// 이전 다음 나오게 하는것			
								int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1; 
								int endPage = startPage + pageBlock - 1;				
									if(endPage > pageCount) { 
											endPage = pageCount;
										}						
										// 이전
										if(startPage > pageBlock) { %>	
							    	<li class="page-item">
							      		<a class="page-link" href="myPage_conScrap.jsp?pageNum=<%=startPage - pageBlock%>" aria-label="Previous">
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
							    		<a class="page-link text-dark" href="myPage_conScrap.jsp?pageNum=<%= i %>">
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
							      		<a class="page-link" href="myPage_conScrap.jsp?pageNum=<%=startPage + pageBlock%>" aria-label="Next">
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
			</div>
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>
<%@ include file="../footer.jsp" %>