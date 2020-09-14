<%@page import="mySpec.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
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
			
			<!-- 내용 -->
			<div class="container">
				<div class="card-header">
	              <h4 class="title">대외 활동</h4>
	            </div>
	
	            <div class="container_search">
	              <div class="row">
	                <div class="col-sm-6 col-lg-4" id="col">
	                     <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    D-12 조회12 댓글43 스크랩255
	                  </div>
	                </div>
	                <div class="col-sm-6 col-lg-4" id="col">
	                   <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    디데이 조회수 댓글수 스크랩수
	                  </div>
	                </div>
	               
	                <div class="col-sm-6 col-lg-4" id="col">
	                   <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    디데이 조회수 댓글수 스크랩수
	                  </div>
	                </div>
	              </div>
	              <div class="row">
	                <div class="col-sm-6 col-lg-4" id="col">
	                   <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    디데이 조회수 댓글수 스크랩수
	                  </div>
	                </div>
	                <div class="col-sm-6 col-lg-4" id="col">
	                   <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    디데이 조회수 댓글수 스크랩수
	                  </div>
	                </div>
	                <div class="col-sm-6 col-lg-4" id="col">
	                   <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    디데이 조회수 댓글수 스크랩수
	                  </div>
	                </div>
	                <div class="col-sm-6 col-lg-4" id="col">
	                   <a href="#"><img src="http://ktsmemo.cdn3.cafe24.com/p/0427.jpg"></a>
	                  <br>
	                  <div class="list_explain">
	                   <a href="#"><div class="list_explain_title">대외활동 제목<br></div></a>
	                    주최기관<br>
	                    디데이 조회수 댓글수 스크랩수
	                  </div>
	                </div>
	              </div>
	              
	            </div>
	            <br>
	            <br>
	        
	            <!--  페이징 -->
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
<%@ include file="../footer.jsp" %>