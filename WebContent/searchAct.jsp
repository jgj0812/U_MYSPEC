<%@page import="mySpec.ActivityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<jsp:useBean id="actMgr" class="mySpec.ActivityMgr"/>
<%
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	ArrayList<ActivityBean> searchActArr = actMgr.searchActivity(startRow, endRow, keyField1, keyWord);
	int count = actMgr.searchActivityCount(keyField1, keyWord);
%>
	<div class="container">
    	<h2>검색</h2>
     
      	<!-- navbar (card 방식) -->
     	<nav class="navbar  bg-light card-header  ">
        
        	<a class="p-4 col-lg-4 text-center border border-white d-none d-lg-table-cell rounded-left"
        	href="search.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
            	전체
          	</a>
          	<a class="p-4 col-lg-4 text-center border border-white d-none d-lg-table-cell"
          	href="searchAct.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
          		모집중인 활동
           	</a>

           	<a class="p-4 col-lg-4 text-center border border-white d-none d-lg-table-cell rounded-right"
           	href="searchCom.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
            	커뮤니티
          	</a>
          	<!-- navbar mobile -->
            <a class=" col-3 col-xs-4 text-center border border-white d-block d-sm-none rounded-left"
            href="search.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
            	<small>전체</small>
          	</a>
          	<a class=" col-5 col-sm-4 text-center border border-white d-block d-sm-none"
          	href="searchAct.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
          		<small>모집중인 활동 </small>
          	</a>

          	<a class=" col-4 col-xs-4 text-center border border-white d-block d-sm-none rounded-right"
          	href="searchCom.jsp?keyField=<%=keyField %>&keyField1=<%=keyField1 %>&keyWord=<%=keyWord %>">
          		<small>커뮤니티</small>
          	</a>
           	<!-- /navbar mobile -->
      	</nav>
      	<!-- /navbar -->

   	  	<!-- 활동 -->
	</div>
	<div class="container ">
    	<div class="col-lg-12 bg-light p-4">모집중인 활동</div>
        <div class="col-lg-12 border border-light">
        	<div class="table-responsive">
            	<table class="table table-sm table-hover">
              		<tbody>
	              	<%
	              		for(ActivityBean bean : searchActArr) {
	              			String actType = bean.getAct_type() == 1 ? "대외활동" : "공모전";
	              	%>
                	<tr class="d-flex">
                  		<td class="col-md-1 col-4 d-flex align-items-center">
                    		<img class="" width="100%" src="./upload/<%=bean.getAct_thumb() %>"  alt="썸네일" />
                  		</td>
                  		<td class="col-md-1 d-none d-lg-table-cell"><%=actType %></td>
                  		<td class="col-md-5">
                    		<a class="h5  d-none d-lg-table-cell"><%=bean.getAct_title() %></a>
                    		<a href="detailView.jsp" class="d-block d-sm-none text-truncate" style="max-width: 200px;"><%=bean.getAct_title() %></a>
                    		<div class="badge"><span class=" d-block d-sm-none badge badge-secondary rounded-pill"><%=actType %></span></div>
                    		<p class="d-block d-sm-none">
                      			<small> <%=bean.getOrg_name() %> ~<%=bean.getAct_end() %> <%=bean.getAct_hits() %></small>
                    		</p>
                  		</td>
                  		<td class="col-md-2 d-none d-lg-table-cell"><%=bean.getOrg_name() %></td>
                  		<td class="col-md-2 d-none d-lg-table-cell">~<%=bean.getAct_end() %></td>
                  		<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getAct_hits() %></td>
                	</tr>
                	<%} %>
              		</tbody>
				</table>
			</div>
		</div>
	</div>
    <!-- /활동 -->
    
    <!-- 페이징 -->
	<div class="form-inline justify-content-center">		
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
				      		<a class="page-link" href="searchAct.jsp?pageNum=<%=startPage - pageBlock%>&keyWord=<%=keyWord%>&keyField1=<%=keyField1%>" aria-label="Previous">
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
				    		<a class="page-link text-dark" href="searchAct.jsp?pageNum=<%= i %>&keyWord=<%=keyWord%>&keyField1=<%=keyField1%>">
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
				      		<a class="page-link" href="searchAct.jsp?pageNum=<%=startPage + pageBlock%>&keyWord=<%=keyWord%>&keyField1=<%=keyField1%>" aria-label="Next">
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
<%@ include file="/footer.jsp" %>