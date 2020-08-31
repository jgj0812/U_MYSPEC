<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<main class="">
	<div class="container py-3">
		<h3>공지사항</h3>
		<div class="table-responsive-sm">
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
		 			<td class="col-md-5 text-truncate">
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
		 			<td class="col-md-5 text-truncate">
		 				<a href="detailView.jsp" class="h5">MYSPEC 사이트를 오픈하였습니다.</a>
		 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
		 			</td>
		 			<td class="col-md-2 d-none d-lg-table-cell">글쓴이</td>
		 			<td class="col-md-2 d-none d-lg-table-cell">등록일</td>
		 			<td class="col-md-1 d-none d-lg-table-cell">조회수</td>	
		 		</tr>
		 		<tr class="d-flex">
		 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
		 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
		 			<td class="col-md-5 text-truncate">
		 				<a class="h5">MYSPEC 사이트를 오픈하였습니다. 어렵다 ㅋㅋㅋ</a>
		 				<p class="d-block d-sm-none"><small>글쓴이 등록일 조회수</small></p>
		 			</td>
		 			<td class="col-md-2 d-none d-lg-table-cell">링커리어~</td>
		 			<td class="col-md-2 d-none d-lg-table-cell">2020.07.15</td>
		 			<td class="col-md-1 d-none d-lg-table-cell">507</td>
		 		</tr>
		    </tbody>
		  </table>
		</div>
	</div>
    <div class="container bg-light my-3">
        <h3>인기 대외활동</h3>
        <div class="row justify-content-end p-3">
          <button type="button" class="left mr-2" id="arrow_button">
            <i class="fas fa-angle-left"></i>
          </button>
          <button type="button" class="right" id="arrow_button">
            <i class="fas fa-angle-right"></i>
          </button>
        </div>
        <div class="your-class">
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">대외활동 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">대외활동 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">대외활동 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">대외활동 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
        </div>
    </div>
    <div class="container bg-light my-3">
        <h3>인기 공모전</h3>
        <div class="row justify-content-end p-3">
          <button type="button" class="left2 mr-2" id="arrow_button">
            <i class="fas fa-angle-left"></i>
          </button>
          <button type="button" class="right2" id="arrow_button">
            <i class="fas fa-angle-right"></i>
          </button>
        </div>
        <div class="your-class2">
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">공모전 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">공모전 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">공모전 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
          <a href="#" class="card mb-2 mr-2">
            <img
              class="card-img-top"
              src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
              alt="Card image cap"
            />
            <div class="card-body">
              <h4 class="card-title">공모전 제목</h4>
              <p class="card-text">
                주최기관<br>
                디데이 조회 댓글 스크랩
              </p>
            </div>
          </a>
        </div>
    </div>
</main>
<%@ include file="/footer.jsp" %>