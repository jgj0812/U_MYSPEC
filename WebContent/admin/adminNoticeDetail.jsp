<%@page import="mySpec.CommunityReplyBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.CommunityBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="Rmgr" class="mySpec.CommunityReplyMgr" />
<%
	//긃번호
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	//글번호로 게시물 보여주기
	CommunityBean commB = mgr.Community_detailView(comm_num);
	//글번호로 댓글 리스트 보여주기
	ArrayList<CommunityReplyBean> commRe_arr  = Rmgr.Community_reply_list(comm_num);
	
	int num = commB.getComm_num(); //글번호
	String admin = "";
	if(commB.getComm_admin().trim().equals("admin")) admin="관리자";
	
	String str = commB.getComm_date();
	String [] date = str.split(" ");
	String date_1 = date[0];
	
	int hits = commB.getComm_hits();
	String content = commB.getComm_content();
	String title = commB.getComm_title();
%>	
<main>
	<div class="d-flex" id="wrapper">
		
		<%@ include file="/admin/adminSidebar.jsp" %>
		
		<!-- page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar-my navbar-expand-lg navbar-light">
				<button id="menu-toggle" class="btn btn-link d-md-none rounded-circle">
            		<i class="fa fa-bars"></i>
          		</button>
			</nav>
				
			<!-- detailView -->
			<div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<div class="row">
						<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">전체글 보기</div>	
					</div>
				</div>
			</div>
			
				<hr style="height: 2px; background-color: black;">
						<div style="margin-left:20px;">
						<!-- 제목   -->
						<h3><%= title %></h3>
						</div>		
				<hr>
						<div class="row" style="font-size: 0.75rem; color: #999;" >
							<div style="margin-left:40px;"><p><%= admin %></p></div>	<!-- 글쓴이 -->
							<hr class="name_line">
							<div style="margin-left:15px;"><p><%= date_1 %></p></div><!-- 날짜 -->
							<div style="margin-left:10px;"><p>조회수</p></div>
							<div style="margin-left:3px;"><p><%= hits %></p></div><!-- 조회수 -->
						</div>
						<hr>
			<div class="jumbotron jumbotron-fluid" style="background-color:white;">
			  <div class="container" style="white-space:pre;">
			    <%= content %><!-- 내용 -->
			  </div>
			</div>
			
			<!-- 공유   -->
			<div class="form-inline justify-content-end">
				<a href="#"><img src="${pageContext.request.contextPath}/img/icon.png" width="30px" height="30px" style="background-color:#eeeeee; padding: 5px"></a>
			</div>
			<hr>
			
			<div class="form-inline justify-content-end">
					<button type="button" 
							class="btn text-dark" 
							style="background-color:#eeeeee; margin-right:5px; font-size:12px;font-family:Noto Sans KR; font-weight:bolder;"
							onclick="location.href='community.jsp'">목록</button>
					
					<!-- 수정  -->		
					<input type="button" 
							class="btn text-dark"  
							style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR; font-weight:bolder; margin-right:5px;" 
							value="수정"
							onclick="location.href='update.jsp?comm_num=<%=commB.getComm_num()%>'">
							
					<!-- 삭제  -->
					<input type="button" 
							class="btn text-dark"  
							style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR; font-weight:bolder; margin-right:5px;" 
							value="삭제"
							onclick="location.href='deletePro.jsp?comm_num=<%=commB.getComm_num() %>'">
							
					<input type="button" class="btn text-dark"  style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR;
				    font-weight:bolder;" value="다음글">
			</div>
			
			
			<div style="background-color:#eeeeee;">
				
				<!-- 댓글수 -->
				<div class="row" style="font-size:0.75rem; margin-top:23px;" >
					<p style="font-weight:bold; margin-left:40px; margin-top:15px;">댓글</p>
					<p style="font-weight:bold; margin-top:15px; margin-left:5px;">0</p>
				</div>
				
				<hr style="margin-top: 2px">
				<!-- 댓글 보여주는 곳 -->	
		<%
				for(CommunityReplyBean commRB :commRe_arr){
		%>	
			
				<div>
					<div class="row" style="font-size:0.75rem;" >
						<p style="margin-left:40px;"><%=commRB.getRep_person()%></p>
						<p style="margin-left:20px;"><%=commRB.getRep_date()%></p>
					</div>
					<div style="margin-left:25px; font-size:1rem;"><%=commRB.getRep_content()%></div>
					<div style="font-size:0.75rem; float: right;  margin-right: 20px;">수정 삭제 답글쓰기</div>
					
				</div>
				<br>
				<hr>
		<%
				}
		%>				
				<!-- 댓글 입력폼  -->
				<form action="replyPro.jsp" name="comm_reply_form" method="post">
				  	<!-- 글번호를 넘긴다 -->
				  	<input type="hidden" name="comm_num" value="<%= comm_num%>">
				  	
					<div class="form-row">
						 <div class="col-8">
						   <input name="rep_content" style="margin-left:20px; height:60px; font-weight:bolder;" 
						   type="text" class="form-control" placeholder="댓글을 입력해주세요." >
						</div>
						
						<div class="col-2">
							<input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" 
							type="submit" class="form-control" value="등록">
						</div>
					</div>
				</form>
			
		 	</div>
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>