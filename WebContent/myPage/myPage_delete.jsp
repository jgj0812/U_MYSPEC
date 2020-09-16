<%@page import="mySpec.MemberMgr"%>
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
			
			<div class="container">
				<div class="content">
					<div class="card">
						<div class="card-header">
							<h4 class="title">회원탈퇴</h4>
						</div>
						<div class="card-body text-center">
							<p>MYSPEC! 회원탈퇴 하시겠습니까?</p>
							<a class="btn btn-danger col-md-4"
		                       href="myPage_deletePro.jsp?id=<%=id%>">
		                      네
		                    </a>
		                      &nbsp;
		                      <a
		                        class="btn btn-cam col-md-4"
		                        href="myPage.jsp">
		                        아니오
		                      </a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page Content -->
	</div>
	<!-- /#wrapper -->
</main>
<%@ include file="../footer.jsp" %>