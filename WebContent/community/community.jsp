<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section class="container my-3">
	<div class="container py-3 d-flex justify-content-between bg-light">
		<h4 style="margin-top: 8px;">커뮤니티 게시판</h4>
		<a onclick="com_write()" class="h3 d-block d-sm-none"><i class="fas fa-edit"></i></a>
	</div>

<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>

	
<% 
/* 	request.setCharacterEncoding("UTF-8");
	int sorting_num;
	String str ="";
	ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>();
	
	if(str!= null){
		sorting_num = Integer.parseInt(request.getParameter("sorting_num"));
		str = request.getParameter("comm_search"); 
		comm_arr = mgr.Community_list_search(sorting_num,str);
	}
	 */
	 ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>();
		
	//검색안할때 
	comm_arr = mgr.Community_list();
	

%>

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
			String Type =commB.getComm_type()==0?"공지사항":"일반게시판";
			String datestr = commB.getComm_date();
			
			String [] date = datestr.split(" ");
			String date_1 = date[0];
%>	

		 		<tr class="d-flex">	 		
		 			<td class="col-md-1 d-none d-lg-table-cell"> <%=commB.getComm_num() %></td>
		 			<td class="col-md-1 d-none d-lg-table-cell"><%=Type%></td>
		 			<td class="col-md-5">
		 				<a href="detailView.jsp?comm_num=<%=commB.getComm_num()%>" class="h5 text-dark"><%=commB.getComm_title() %></a>
		 				<p class="d-block d-sm-none"><small><%=commB.getComm_person() %> <%=date_1%> <%=commB.getComm_hits() %></small></p>
		 			</td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=commB.getComm_person() %></td>
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
		onclick="comm_write()">글쓰기</button>
	</div>
	
	
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

	<!-- 검색 -->
	<form action="community_search.jsp" method="post" class="form-inline justify-content-center">
	
		<select name="sorting_num" class="form-control" id="search_control">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">닉네임</option>
		</select>
		
		<div class="input-group">
			<input type="text" name="comm_search" class="form-control" placeholder="내용을 입력하세요">
			<div class="input-group-append">
				<button type="submit" class="btn btn-cam">검색</button>	
			</div>
		</div>
		
	</form>
	
</section>

<%@ include file="../footer.jsp"%>