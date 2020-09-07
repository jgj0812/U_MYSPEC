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
	int currentPage = Integer.parseInt(pageNum);		// 현재 페이지
	int startRow = (currentPage - 1) * pageSize + 1;	// 페이지 시작
	int endRow = currentPage * pageSize;				// 페이지 끝
	ArrayList<PersonBean> arrPerson = mgr.listPerson(startRow, endRow);
	int count = mgr.personCount();	// 전체 개인회원 수
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
			<div class="col-lg-12 bg-light p-4">대외활동</div>
			<input type="hidden" name="listmemType" value="0">
		    <div class="col-lg-12 border border-light">
		    	<div class="table-responsive">
		        	<table class="table table-sm table-hover">
		            	<thead>
		                	<tr class="text-center d-flex">
		                    	<th class="col-md-1">글번호</th>
		                    	<th class="col-5">제목</th>
		                    	<th class="col-md-2">작성자</th>
		                    	<th class="col-md-2">등록일</th>
		                    	<th class="col-md-1">조회수</th>
		                    	<th class="col-md-1">수정/삭제</th>
		                  	</tr>
		                </thead>
		                <!-- 예시 -->
		                <tbody>
			             	<tr class="text-center d-flex">
			                  <td class="col-md-1 ">
			                    10110
			                  </td>
			                  <td class="col-md-5 text-truncate" >
			                  	<span class="badge badge-secondary rounded-pill">공지</span>
			                    관리자 페이지에 나온 공지글 제목입니다.
			                  </td>
			                  <td class="col-md-2">MYSPEC!관리자</td>
			                  <td class="col-md-2">2020.01.01</td>
			                  <td class="col-md-1">1244</td>
			                  <td class="col-md-1">수정/삭제</td>
              			    </tr>
		                
		                </tbody>
					</table>
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
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>