<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<main id="myMain" class="container"></main>
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</section>