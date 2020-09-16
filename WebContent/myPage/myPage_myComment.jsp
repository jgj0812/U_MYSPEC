<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<%
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	keyField = "";
	keyWord = "";
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	int currentPage = Integer.parseInt(pageNum);		// 현재 페이지
	int startRow = (currentPage - 1) * pageSize + 1;	// 페이지 시작
	int endRow = currentPage * pageSize;	// 페이지 끝
	
	ArrayList<CommunityBean> myComArr = mgr.myCommentList(startRow, endRow, keyField, keyWord, id);
	int count = mgr.myCommentCount(keyField, keyWord, id);
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
			
			<!-- 내용 -->
			<div class="container">
				<div class="container py-3 d-flex justify-content-between bg-light">
					<h3>댓글 작성한 글</h3>
				</div>
			
				<!-- 테이블 -->
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
						for(CommunityBean commB : myComArr){
							String person = commB.getComm_admin() != null ? "관리자" : commB.getComm_nick();
							String Type =commB.getComm_type()==0?"공지사항":"일반게시판";
							String datestr = commB.getComm_date();
							String [] date = datestr.split(" ");
							String date_1 = date[0];
%>	

					 		<tr class="d-flex">
					 			<%
					 				if(commB.getComm_type() == 0) {
					 			%>	 		
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<%}else { %>
					 			<td class="col-md-1 d-none d-lg-table-cell"> <%=commB.getComm_num() %></td>
					 			<%} %>
					 			<td class="col-md-1 d-none d-lg-table-cell"><%=Type%></td>
					 			<td class="col-md-5">
					 				<a href="${pageContext.request.contextPath}/community/detailView.jsp?comm_num=<%=commB.getComm_num()%>" class="h5 text-dark"><%=commB.getComm_title() %></a>
					 				<p class="d-block d-sm-none"><small><%=person %> <%=date_1%> 조회 <%=commB.getComm_hits() %></small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell"><%=person %></td>
					 			<td class="col-md-2 d-none d-lg-table-cell"><%=date_1 %></td>
					 			<td class="col-md-1 d-none d-lg-table-cell"><%=commB.getComm_hits() %></td>
					 			
					 		</tr>
<%
						}
%>		
				 		</tbody>
					</table>	
				</div>
				<!-- /테이블 -->
				<!-- 페이징 -->
				<div class="form-inline justify-content-center">		
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<%
							if(count > 0) {	
							// 총 페이지 수 구하기, 전체 글개수 나누기 페이지사이즈(한 화면에 보여지는 수)
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);						
								int pageBlock = 4;	// 이전 다음 나오게 하는것			
								int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1;  
								int endPage = startPage + pageBlock - 1;	// 계산상 마지막 페이지
										
									if(endPage > pageCount) {
											endPage = pageCount;
										}
										
										// 이전
										if(startPage > pageBlock) {
								%>	
							    	<li class="page-item">
							      		<a class="page-link" href="myPage_myComment.jsp?pageNum=<%=startPage - pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Previous">
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
							    		<a class="page-link text-dark" href="myPage_myComment.jsp?pageNum=<%= i %>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
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
							      		<a class="page-link" href="myPage_myComment.jsp?pageNum=<%=startPage + pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Next">
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
				<form method="get" id="commSearchFrm" class="form-inline justify-content-center">
					<input type="hidden" name="pageNum" value="1">
					
					<select name="keyField" class="form-control" id="search_control">
						<option value="comm_title">제목</option>
						<option value="comm_content">내용</option>
						<option value="comm_person">닉네임</option>
					</select>
					
					<div class="input-group">
						<input type="text" id="commSearch" name="keyWord" class="form-control">
						<div class="input-group-append">
							<button type="submit" id="commSearchBtn" class="btn btn-cam">검색</button>	
						</div>
					</div>
				</form>
				<!-- /검색 -->
			</div>
			<!-- /내용 -->
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>
<%@ include file="../footer.jsp" %>