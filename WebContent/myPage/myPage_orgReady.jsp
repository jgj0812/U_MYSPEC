<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<section>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/myPage/myPage_sidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
                <h2>MY 페이지</h2>
			</nav>
			
			<div class="container py-3">
				<div class="card-header">
              <h4 class="title">대외활동</h4>
            </div>

            <div class="container_search">
              <div class="row">
                <div class="col-6 col-sm-6 col-lg-3" id="col">
                  <a href="list_act_detailView.jsp"
                    ><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"
                  /></a>
                  <br />
                  <div class="list_explain">
                  	<div class="mb-2">
	                    <a href="#" class="list_explain_title"
	                      >대외활동 제목
	                    </a>
                    </div>
                    주최기관<br />
                    D-12 조회12 댓글43 스크랩255
                  </div>
                  <a href="list_act_update.jsp" class="btn btn-secondary btn-block mt-2" class="container">
                    수정하기
                  </a>
                </div>
                <div class="col-6 col-sm-6 col-lg-3" id="col">
                  <a href="#"
                    ><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"
                  /></a>
                  <br />
                  <div class="list_explain">
                    <div class="mb-2">
	                    <a href="#" class="list_explain_title"
	                      >대외활동 제목
	                    </a>
                    </div>
                    주최기관<br />
                    디데이 조회수 댓글수 스크랩수
                  </div>
                  <a href="list_act_update.jsp" class="btn btn-secondary btn-block mt-2" class="container">
                    수정하기
                  </a>
                </div>
                <div class="col-6 col-sm-6 col-lg-3" id="col">
                  <a href="#"
                    ><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"
                  /></a>
                  <br />
                  <div class="list_explain">
                    <div class="mb-2">
	                    <a href="#" class="list_explain_title"
	                      >대외활동 제목
	                    </a>
                    </div>
                    주최기관<br />
                    디데이 조회수 댓글수 스크랩수
                  </div>
                  <a href="list_act_update.jsp" class="btn btn-secondary btn-block mt-2" class="container">
                    수정하기
                  </a>
                </div>
              </div>
             </div>
			</div>
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</section>
<%@ include file="/footer.jsp" %>