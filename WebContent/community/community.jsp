<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />


<% 
	request.setCharacterEncoding("utf-8");	
	ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>();
	
	//페이징, 검색
	pageSize = 10;	// 한 화면에 보여지는 수
	
	pageNum = request.getParameter("pageNum");
	
	if(pageNum == null) {
		pageNum = "1";
	}
	
	keyField = "";
	keyWord = "";	
	
	// 검색에 필요한 변수
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	currentPage = Integer.parseInt(pageNum);		// 현재 페이지
	startRow = (currentPage - 1) * pageSize + 1;	// 페이지 시작
	endRow = currentPage * pageSize;	// 페이지 끝
	
	comm_arr = mgr.Community_list(startRow, endRow, keyField, keyWord);
	int count = mgr.community_Count(keyField, keyWord);	

%>

<section class="container my-3">
	<div class="container py-3 d-flex justify-content-between bg-light">
		<h4 style="margin-top: 8px;">커뮤니티 게시판</h4>
		<a onclick="com_write()" class="h3 d-block d-sm-none"><i class="fas fa-edit"></i></a>
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
		for(CommunityBean commB :comm_arr){
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
		 				<a href="detailView.jsp?comm_num=<%=commB.getComm_num()%>" class="h5 text-dark"><%=commB.getComm_title() %></a>
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
	
	<!-- 글쓰기 -->
	<div class="form-inline justify-content-end">
		<button type="button" class="btn btn-com d-none d-md-block"  
		onclick="comm_write('<%=id%>')">글쓰기</button>
	</div>
	
	
	<!-- 페이징 -->
	<div class="form-inline justify-content-center">		
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<%
				//COUNT 26개 가정
				if(count > 0) { //26	
				// 총 페이지 수 구하기, 전체 글개수 나누기 페이지사이즈(한 화면에 보여지는 수)
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	 // 26/5 + (26%5) => 6					
					int pageBlock = 4;	// 이전 다음 나오게 하는것			
					int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1; //1-1(0)/4 =0 * 4 =0 +1 
					int endPage = startPage + pageBlock - 1;	// 계산상 마지막 페이지 1+4-1 =4
							
						if(endPage > pageCount) { //엔드페이지가 4보다 작으면 그 작은 수가 엔드페이지
								endPage = pageCount;
							}
							
							// 이전
							if(startPage > pageBlock) {
					%>	
				    	<li class="page-item">
				      		<a class="page-link" href="community.jsp?pageNum=<%=startPage - pageBlock%>" aria-label="Previous">
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
				    		<a class="page-link text-dark" href="community.jsp?pageNum=<%= i %>">
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
				      		<a class="page-link" href="community.jsp?pageNum=<%=startPage + pageBlock%>" aria-label="Next">
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
	<form method="post" id="commSearchFrm" class="form-inline justify-content-center">
		<input type="hidden" name="pageNum" value="1">
		
		<select name="keyField" class="form-control" id="search_control">
			<option value="comm_title">제목</option>
			<option value="comm_content">내용</option>
			<option value="comm_person">닉네임</option>
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

<script type="text/javascript">

$("#commSearchBtn").click(function(){
	if($("#commSearch").val() == "") {
		alert("검색어를 입력하세요");
		$("#commSearch").focus();
		return false;
	}
	$("#commSearchFrm").submit();
});

</script>