<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<%
	int member = (int)session.getAttribute("member");
%>
<main>
	<div class="d-flex" id="wrapper">
		
		<!-- sidebar -->
		<div class="bg-light border-right" id="sidebar-wrapper">
			<%if(member == 0) {%>
			<!-- 개인회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                커뮤니티
              </h3>
			<div class="list-group list-group-flush">
				<a href="myPage_community.jsp" class="list-group-item list-group-item-action bg-light">내가 쓴 글</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">댓글 쓴 글</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                스크랩
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원정보
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">회원정보 변경</a>
				<a href="myPage_delete.jsp" class="list-group-item list-group-item-action bg-light">회원탈퇴</a>
			</div>
			<%}else { %>
			<!-- 단체회원 sidebar -->
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                모집중인 활동
              </h3>
			<div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                승인 대기 중
            </h3>
            <div class="list-group list-group-flush">
				<a href="#" class="list-group-item list-group-item-action bg-light">대외활동</a>
				<a href="#" class="list-group-item list-group-item-action bg-light">공모전</a>
			</div>
			
			<h3
                class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"
              >
                회원정보
            </h3>
            <div class="list-group list-group-flush">
				<a href="myPage_info.jsp" class="list-group-item list-group-item-action bg-light">회원정보 변경</a>
				<a href="myPage_delete.jsp" id="memberDelete" class="list-group-item list-group-item-action bg-light">회원탈퇴</a>
			</div>
			<%} %>
		</div>
		<!-- /sidebar -->
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
                <h2>MY 페이지</h2>
			</nav>
			
			<!-- 내용 -->
			<div class="container">
				<div class="container py-3 d-flex justify-content-between bg-light">
					<h3>커뮤니티 게시판</h3>
					<a href="write.jsp" class="h3 d-block d-sm-none"><i class="fas fa-edit"></i></a>
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
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
					 			<td class="col-md-5">
					 				<a class="h5">MYSPEC 사이트를 오픈하였습니다. 어렵다 ㅋㅋㅋ</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
					 		</tr>
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell"><a href="detailView.jsp" class="text-dark">공지</a></td>
					 			<td class="col-md-1 d-none d-lg-table-cell"><a href="detailView.jsp" class="text-dark">게시판명</a></td>
					 			<td class="col-md-5">
					 				<a href="detailView.jsp" class="h5">제목</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">글쓴이</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">등록일</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">조회수</td>	
					 		</tr>
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
					 			<td class="col-md-5">
					 				<a class="h5">링커리어</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
					 		</tr>
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">번호</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">게시판명</td>
					 			<td class="col-md-5">
					 				<a class="h5">제목</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">글쓴이</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">등록일</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">조회수</td>
					 		</tr>
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
					 			<td class="col-md-5">
					 				<a class="h5">링커리어</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
					 		</tr>
					 		
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
					 			<td class="col-md-5">
					 				<a class="h5">링커리어</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
					 		</tr>
					 		
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
					 			<td class="col-md-5">
					 				<a class="h5">링커리어</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
					 		</tr>
					 		
					 		<tr class="d-flex">
					 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
					 			<td class="col-md-5">
					 				<a class="h5">링커리어</a>
					 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
					 			</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
					 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
					 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
					 		</tr>
				 		</tbody>
					</table>	
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
				
			</div>
			<!-- /내용 -->
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>
<%@ include file="/footer.jsp" %>