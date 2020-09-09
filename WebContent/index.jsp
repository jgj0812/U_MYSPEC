<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<%	
	ArrayList<CommunityBean> noticeArr = mgr.noticeList(startRow, endRow, keyField, keyWord);
%>
<section class="py-3">
	<div class="container">
		<h3 style="text-align: center; margin-bottom: 20px">MySpec 공지사항</h3>
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
		    	<%for(int i = 0; i < 3; i++) {
		    		String admin = "";
		    		
		    		String date[] = noticeArr.get(i).getComm_date().split(" ");
		    		String date1 = date[0];
		    	%>
		    	<tr class="d-flex">
		 			<td class="col-md-1 d-none d-lg-table-cell">공지</td>
		 			<td class="col-md-1 d-none d-lg-table-cell">공지사항</td>
		 			<td class="col-md-5 text-truncate">
		 				<a href="community/detailView.jsp?comm_num=<%=noticeArr.get(i).getComm_num() %>" class="h5">
		 					<%=noticeArr.get(i).getComm_title() %>
		 				</a>
		 				<p class="d-block d-sm-none"><small><%=admin %> <%=date1 %> 조회 <%=noticeArr.get(i).getComm_hits() %></small></p>
		 			</td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=admin %></td>
		 			<td class="col-md-2 d-none d-lg-table-cell"><%=date1 %></td>
		 			<td class="col-md-1 d-none d-lg-table-cell"><%=noticeArr.get(i).getComm_hits() %></td>
		 		</tr>
		 		<%} %>
		    </tbody>
		  </table>
		</div>
	</div>
    <div class="container bg-light my-3">
		<div style="display: flex; padding-top: 25px">
			<h3 class="c_title" >인기 공모전</h3>

			<div class="row justify-content-end p-3">
				<button type="button" class="left mr-2" id="arrow_button">
					<i class="fas fa-angle-left"></i>
				</button>
				<button type="button" class="right" id="arrow_button">
					<i class="fas fa-angle-right"></i>
				</button>
			</div>
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

		<div style="display: flex; padding-top: 25px">
			<h3 class="c_title" >맞춤 추천 대외활동</h3>

			<div class="row justify-content-end p-3">
				<button type="button" class="left2 mr-2" id="arrow_button">
					<i class="fas fa-angle-left"></i>
				</button>
				<button type="button" class="right2" id="arrow_button">
					<i class="fas fa-angle-right"></i>
				</button>
			</div>
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
</section>
<br>
<%@ include file="/footer.jsp" %>