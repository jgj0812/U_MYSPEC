<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<jsp:useBean id="comMgr" class="mySpec.CommunityMgr" />
<%
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	ArrayList<CommunityBean> searchComArr = comMgr.Community_list(startRow, endRow, keyField, keyWord);
	int count = comMgr.community_Count(keyField, keyWord);
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
	
	<!-- 커뮤니티 -->
	<div class="container mt-5">
		<div class="col-lg-12 bg-light p-4">커뮤니티<button class="d-flex ml-auto btn btn-secondary btn-sm">더보기</button></div>
        	<div class="col-lg-12 border border-light">
        		<div class="table-responsive">
            		<table class="table table-sm table-hover">
              			<thead>
                			<tr class="d-flex">
                  				<th class="col-md-1 d-none d-lg-table-cell">번호</th>
                  				<th class="col-md-1 d-none d-lg-table-cell">게시판명</th>
				                <th class="col-md-5 d-none d-lg-table-cell">제목</th>
				                <th class="col-md-2 d-none d-lg-table-cell">글쓴이</th>
				                <th class="col-md-2 d-none d-lg-table-cell">등록일</th>
				                <th class="col-md-1 d-none d-lg-table-cell">조회수</th>
                			</tr>
              			</thead>
              			<tbody>
              			<%
              				for(CommunityBean bean : searchComArr) {
              					String person = bean.getComm_admin() != null ? "관리자" : bean.getComm_nick();
            					String Type =bean.getComm_type()==0?"공지사항":"일반게시판";
            					String datestr = bean.getComm_date();
            					String [] date = datestr.split(" ");
            					String date_1 = date[0];
              			%>
                			<tr class="d-flex">
                				<%if(bean.getComm_type() == 0) {%>	 
                  				<td class="col-md-1 d-none d-lg-table-cell">공지</td>
                  				<%}else { %>
		 						<td class="col-md-1 d-none d-lg-table-cell"> <%=bean.getComm_num() %></td>
		 						<%} %>
                  				<td class="col-md-1 d-none d-lg-table-cell"><%=Type %></td>
                  				<td class="col-md-5">
                    				<a class="h5 d-none d-lg-table-cell">
                    					<%=bean.getComm_title() %>
                    				</a>
                    				<a class="d-block d-sm-none text-truncate" style="max-width: 300px;"><%=bean.getComm_title() %></a>
                    				<p class="d-block d-sm-none">
                      					<small><%=person %> <%=date_1%> 조회 <%=bean.getComm_hits() %></small>
                    				</p>
                  				</td>
                  				<td class="col-md-2 d-none d-lg-table-cell"><%=person %></td>
                  				<td class="col-md-2 d-none d-lg-table-cell"><%=date_1 %></td>
                  				<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getComm_hits() %></td>
                			</tr>
                		<%	} %>
              		</tbody>
            	</table>
          	</div>
		</div>
	</div>
    <!-- /커뮤니티 -->
    
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
				      		<a class="page-link" href="searchCom.jsp?pageNum=<%=startPage - pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Previous">
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
				    		<a class="page-link text-dark" href="searchCom.jsp?pageNum=<%= i %>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
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
				      		<a class="page-link" href="searchCom.jsp?pageNum=<%=startPage + pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Next">
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