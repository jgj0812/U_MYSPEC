<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<%
	request.setCharacterEncoding("utf-8");
	int pageSize = 5;	// 한 화면에 보여지는 수
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	String keyField = "", keyWord = "";
	// 검색일때
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	ArrayList<CommunityBean> arrComm = mgr.Community_list(startRow, endRow, keyField, keyWord);
	int count = mgr.community_Count(keyField, keyWord);
%>
<main>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/admin/adminSidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
			
			<!-- comNotice List -->
			<div class="table-responsive">
				<table class="table table-sm table-hover">
					<thead>
		 				<tr class="d-flex">
		 					<th class="col-md-1 d-none d-lg-table-cell">번호</th>
		 					<th class="col-md-5 d-none d-lg-table-cell">제목</th>
		 					<th class="col-md-2 d-none d-lg-table-cell">글쓴이</th>
		 					<th class="col-md-2 d-none d-lg-table-cell">등록일</th>
		 					<th class="col-md-1 d-none d-lg-table-cell">조회수</th>
		 					<th class="col-md-1 d-none d-lg-table-cell">삭제</th>
		 				</tr>
		 			</thead>
		 			<tbody>
<%
						for(CommunityBean bean : arrComm) {
							String date[] = bean.getComm_date().split(" ");
							String date1 = date[0];
%>	
		 				<tr class="d-flex"> 		
		 					<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getComm_num() %></td>
		 					<td class="col-md-5">
		 						<a href="adminComDetail.jsp?comm_num=<%=bean.getComm_num() %>" class="h5 text-dark"><%=bean.getComm_title() %></a>
		 						<p class="d-block d-sm-none"><small><%=bean.getComm_nick() %> <%=date1%> <%=bean.getComm_hits() %></small></p>
		 					</td>
		 					<td class="col-md-2 d-none d-lg-table-cell"><%=bean.getComm_nick() %></td>
		 					<td class="col-md-2 d-none d-lg-table-cell"><%=date1 %></td>
		 					<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getComm_hits() %></td>
		 					<td class="col-md-1 d-none d-lg-table-cell">
		 						<a href="adminComDeletePro.jsp?comm_num=<%=bean.getComm_num() %>&type=1" class="btn btn-danger">
		 							삭제
		 						</a>
		 					</td>
		 				</tr>
<%
						}
%>		
	 				</tbody>
				</table>	
			</div>
			<!-- /comNotice List -->
			<!-- 전체글보기 -->
			<div class="form-inline justify-content-end">
				<a href="adminCom.jsp" class="btn btn-com">전체글보기</a>
			</div>
			<!-- /전체글보기 -->
			<!-- 페이징 -->
			<div class="form-inline justify-content-center">		
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
		      				<a class="page-link" href="adminNotice.jsp?pageNum=<%=startPage - pageBlock %>" aria-label="Previous">
		        				<span aria-hidden="true" class="text-dark" style="font-weight:bolder;">이전</span>
		        				<span class="sr-only">Previous</span>
		      				</a>
		    			</li>
		    		<%
		  					}	// -이전
		  					// 페이지 출력
		  					for (int i = startPage; i <= endPage; i++) {
		  						if(i == currentPage) {
		  					
		    		%>
		    			<li class="page-item active">
				    		<a class="page-link text-dark" href="#">
				    			<%= i %>
				    		</a>
				    	</li>
		    		<%
		  						}else {
		  			%>
		  				<li class="page-item">
				    		<a class="page-link text-dark" href="adminNotice.jsp?pageNum=<%= i %>">
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
		      				<a class="page-link" href="adminNotice.jsp?pageNum=<%=startPage + pageBlock %>" aria-label="Next">
		        				<span aria-hidden="true" class="text-dark" style="font-weight:bolder;">다음</span>
		        				<span class="sr-only">Next</span>
		      				</a>
		    			</li>
		    		<%
		    				}	// - 다음
		  				}	// -if(count > 0)
		    		%>
		  			</ul>
				</nav>
			</div>
			<!-- /페이징 -->
			<!-- 검색 -->
			<form method="post" id="noticeSearchFrm" class="form-inline justify-content-center">
				<select name="keyField" class="form-control" id="search_control">
					<option value="comm_title">제목</option>
					<option value="comm_content">내용</option>
					<option value="person_nick">닉네임</option>
				</select>
				<div class="input-group">
					<input type="text" id="noticeSearch" name="keyWord" class="form-control">
					<div class="input-group-append">
						<button id="noticeSearchBtn" class="btn btn-cam">검색</button>
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