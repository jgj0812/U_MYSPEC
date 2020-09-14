<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="Remgr" class="mySpec.CommunityReplyMgr" />

<% 
	request.setCharacterEncoding("utf-8");
	int member = -1;
	if(id != null) {
		member = (int)session.getAttribute("member");
	}
	
	ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>(); //일반글 arraylist
	
	//페이징
	pageSize = 8;	// 한 화면에 보여지는 게시글 수
	pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}		
	//검색
	keyField = "";
	keyWord = "";	
	
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
		
	}
	
	currentPage = Integer.parseInt(pageNum);		// 현재 페이지
	startRow = (currentPage - 1) * pageSize + 1;	// 페이지 시작
	endRow = currentPage * pageSize;	// 페이지 끝
	
	comm_arr = mgr.Community_list(startRow, endRow, keyField, keyWord); //일반글 받아오기
	int count = mgr.community_Count(keyField, keyWord); //게시글 갯수
	
	ArrayList<CommunityBean> noticeArr = mgr.noticeList(1, 5, "", "");
	
	
%>

<section class="container my-3">
	<div class="container py-3 d-flex justify-content-between bg-light">
		<h4 style="margin-top: 8px;">커뮤니티 게시판</h4>
		<a onclick="comm_write('<%=id%>', '<%=member%>')" class="h3 d-block d-sm-none"><i class="fas fa-edit"></i></a>
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
		 	
<!-- 공지 --> 		 	
<%
		for(CommunityBean bean : noticeArr) {
			String person = bean.getComm_admin() != null ? "관리자" : bean.getComm_nick();
			String datestr = bean.getComm_date();
			String [] date = datestr.split(" ");
			String date_1 = date[0];
			
%>
				<tr class="d-flex" style="background: #f2faff;">	 		
		 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
		 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
		 			<td class="col-md-5">
		 				<a href="detailView.jsp?comm_num=<%=bean.getComm_num()%>" class="h5 text-dark">
		 					<span class="badge badge-secondary rounded-pill d-sm-none">공지</span>
		 					<%=bean.getComm_title() %>
		 				</a>
		 				<p class="d-block d-sm-none"><small><%=person %> <%=date_1%> 조회 <%=bean.getComm_hits() %></small></p>
		 			</td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=person %></td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=date_1 %></td>
		 			<td class="col-md-1 d-none d-lg-table-cell"><%=bean.getComm_hits() %></td>
		 			
		 		</tr>
<%
		}
		if(comm_arr.isEmpty()) {	%>
			<tr>
				<td style="text-align: center;"> <h5> 결과가 없습니다.</h5></td>	 			
			</tr>			
		
	<% } else {
		
		for(CommunityBean commB :comm_arr){
			
			String person = commB.getComm_admin() != null ? "관리자" : commB.getComm_nick();
			String datestr = commB.getComm_date();
			String [] date = datestr.split(" ");
			String date_1 = date[0];
			int comm_num = commB.getComm_num();
			int recount = Remgr.Community_reply_count(comm_num);
%>	
			<!-- 일반글 -->
		 		<tr class="d-flex">
		 			<td class="col-md-1 d-none d-lg-table-cell"> <%=commB.getComm_num() %></td>
		 			<td class="col-md-1 d-none d-lg-table-cell">일반게시판</td>
		 			<td class="col-md-5">
		 				<a href="detailView.jsp?comm_num=<%=comm_num%>" class="h5 text-dark">
			 				<%=commB.getComm_title() %> 
			 				<span style="color: #ff6f6f; font-size: 14px">[<%=recount %>]</span>
		 				</a>
		 				<p class="d-block d-sm-none"><small><%=person %> <%=date_1%> 조회 <%=commB.getComm_hits() %></small></p>
		 			</td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=person %></td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=date_1 %></td>
		 			<td class="col-md-1 d-none d-lg-table-cell"><%=commB.getComm_hits() %></td>	 			
		 		</tr>
<%
	}
		}
%>		
	 		</tbody>
		</table>	
	</div>
	
	<!-- 글쓰기 -->
	<div class="form-inline justify-content-end">
		<a href="community.jsp" class="btn btn-com">전체글보기</a>&nbsp;
		<button type="button" class="btn btn-com d-none d-md-block"  
		onclick="comm_write('<%=id%>',<%=member%>)">글쓰기</button>
	</div>
	
	
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
				      		<a class="page-link" href="community.jsp?pageNum=<%=startPage - pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Previous">
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
				    		<a class="page-link text-dark" href="community.jsp?pageNum=<%= i %>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
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
				      		<a class="page-link" href="community.jsp?pageNum=<%=startPage + pageBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>" aria-label="Next">
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

	<!-- 검색 -->
	<form method="get" id="commSearchFrm" class="form-inline justify-content-center">
	<input type="hidden" name="pageNum" value="1">
		<select name="keyField" class="form-control" id="search_control">
			<option value="comm_title">제목</option>
			<option value="comm_content">내용</option>
			<option value="person_nick">닉네임</option>
		</select>
		
		<div class="input-group">
			<input type="text" id="commSearch" name="keyWord" class="form-control" placeholder="내용을 입력하세요">
			<div class="input-group-append">
				<button type="submit" id="commSearchBtn" class="btn btn-cam">검색</button>	
			</div>
		</div>
	</form>
	
</section>

<%@ include file="../footer.jsp"%>