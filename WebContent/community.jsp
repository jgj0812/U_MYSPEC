<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<section class="container my-3">
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
	
	<!-- 글쓰기 -->
	<div class="form-inline justify-content-end">
		<button type="button" class="btn bg-light d-none d-md-block"  
		onclick="location.href='write.jsp'">글쓰기</button>
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
	<form class="form-inline justify-content-center">
		<select class="form-control mr-1">
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">닉네임</option>
		</select>
		<div class="input-group">
			<input type="text" name="com-search" class="form-control" placeholder="내용을 입력하세요">
			<div class="input-group-append">
				<button type="submit" class="btn btn-cam">검색</button>	
			</div>
		</div>
	</form>
</section>
<%@ include file="/footer.jsp"%>