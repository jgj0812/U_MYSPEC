<%@page import="mySpec.CommunityReplyBean"%>
<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>

<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="Rmgr" class="mySpec.CommunityReplyMgr" />

<jsp:useBean id="bean" class="mySpec.CommunityBean" />
<jsp:useBean id="Rbean" class="mySpec.CommunityReplyBean" />

<jsp:setProperty property="*" name="bean"/>
<jsp:setProperty property="*" name="Rbean"/>

<style>
 .recontent{
 	width: 800px; 
 	margin-left:20px; 
 	height:60px; 
 	font-weight:bolder;
 }
 .rebtn{
 	width:75px; 
 	margin-left:10px; 
 	margin-bottom:40px; 
 	height:60px; 
 	background-color:#aaaaaa; 
 	color:white;
 }
 
@media (max-width:360px) {
	.recontent{
		width: 200px;
		height:55px;
	 }
	 .rebtn{
	 	width:60px; 	
	 	height:55px; 
	
	 }
 
}

</style>

<%
	// 글번호
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	// 글번호로 게시물 보여주기
	CommunityBean commB = mgr.Community_detailView(comm_num);
	// 글번호로 댓글 리스트 보여주기
	ArrayList<CommunityReplyBean> commRe_arr  = Rmgr.Community_reply_list(comm_num);
	int count = Rmgr.Community_reply_count(comm_num);
	
	int num = commB.getComm_num(); //글번호
	// 글 종류 0이면 공지, 1이면 일반글
	int type = commB.getComm_type();
	// 관리자가 쓴 글이면 관리자, 아니면 글쓴 유저 닉네임
	String person = commB.getComm_admin() == null ? commB.getComm_nick() : "관리자";
	
	// 다음글, 이전글
	int next_comm = mgr.next_community(comm_num);
	int prev_comm = mgr.prev_community(comm_num);
	
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
				
			<!-- detailView admin -->
			<div class="card bg-light mt-3">
				<div class="card-header bg-light">
					<div class="row">
						<%if(type == 0) {%>
						<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">공지글</div>	
						<%}else { %>
						<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">일반글</div>
						<%} %>
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
							<div style="margin-left:40px;"><p><%= person %></p></div>	<!-- 글쓴이 -->
							<hr class="name_line">
							<div style="margin-left:15px;"><p><%= date_1 %></p></div><!-- 날짜 -->
							<div style="margin-left:10px;"><p>조회수</p></div>
							<div style="margin-left:3px;"><p><%= hits %></p></div><!-- 조회수 -->
						</div>
						
						<hr>
				
					<div class="jumbotron jumbotron-fluid" style="background-color:white;">
					  <div style="margin-left: 40px">
					    <pre><p class="lead"><%= content %></p></pre><!-- 내용 -->
					  </div>
					</div>
					
			
			<div class="form-inline justify-content-end">
					<button type="button" 
							class="btn text-dark" 
							style="background-color:#eeeeee; margin-right:5px; font-size:12px;font-family:Noto Sans KR; font-weight:bolder;"
							onclick="location.href='adminNotice.jsp'">목록</button>
					
					<%if(type == 0) { %>
					<!-- 수정  -->		
					<input type="button" 
							class="btn text-dark"  
							style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR; font-weight:bolder; margin-right:5px;" 
							value="수정"
							onclick="location.href='adminNoticeUpdate.jsp?comm_num=<%=commB.getComm_num()%>'">
					<%} %>		
					<!-- 삭제  -->
					<input type="button" 
							class="btn text-dark"  
							style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR; font-weight:bolder; margin-right:5px;" 
							value="삭제"
							onclick="location.href='adminComDeletePro.jsp?comm_num=<%=commB.getComm_num() %>&type=0'">
			</div>
			
			
<!-- --------댓글 보여주는 곳--------- -->	
	<div class="reply" style="background-color:#eeeeee;">
		<div class="row" style="font-size:0.75rem; margin-top:23px;" >
			<p style="font-weight:bold; margin-left:40px; margin-top:15px;">댓글</p>
			<p style="font-weight:bold; margin-top:15px; margin-left:5px;"><%=count %></p>	<!-- 댓글수 -->
		</div>
		
		<hr style="margin-top: 2px">
<%
		int i = 0;
		for(int j = 0; j< commRe_arr.size() ; j++) {
			
      		String repPerson = commRe_arr.get(i).getRep_admin() != null ? "관리자" : commRe_arr.get(i).getRep_nick();
      		int recount = Rmgr.Community_rereply_count(comm_num, commRe_arr.get(i).getRep_num());
      		i++;
	
%>	

<!-- -----------------------------------------댓글 반복되는 div------------------------------------------  -->
<div class ="reply_div">
		<!-- 댓글 기본 div -->
		<div id="basic<%=i%>" style="display: block">
			
			<!-- 닉네임 날짜 -->
			<div class="row" style="font-size:0.85rem;" >
			
				<% if(repPerson.equals("관리자")) {%>
	            <p style="margin-left:40px; font-weight: 800"><%=repPerson%></p>
	            <% } else {%>
	            <p style="margin-left:40px;"><%=repPerson%></p> <!-- 닉네임 -->
	            <%} %>
            
				<p style="margin-left:20px;"><%=commRe_arr.get(j).getRep_date()%></p> <!-- 날짜 -->
			</div>
			
			<!-- 댓글내용 -->
			<div style="margin-left:30px; font-size:1rem;">
				<%=commRe_arr.get(j).getRep_content()%> <!-- 댓글내용 -->
			</div> 
						
			<br>
			
			<!-- 답글보기 삭제 수정 답글 -->
			<div>
				<!-- 답글 리스트 보기  -->
				<div style="font-size:0.75rem; margin-left:20px; float: left;"> 
					<input type="button" style="border: 0px" value="답글보기 [<%=recount %>]" onclick="rereplylist(<%=i%>)">  
				</div>	
				
				<!-- 삭제 수정 답글 -->
				<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> 
					<!-- 삭제  -->
					<form action="adminReplyDeletePro.jsp"> 
						<!-- 원래글로 돌아가기위한 글번호  -->
						<input type="hidden" name="comm_num" value="<%= comm_num%>">
						<input type="hidden" name="rep_num" value="<%=commRe_arr.get(j).getRep_num() %>">
						<input type="hidden" name="rep_parent" value="<%=commRe_arr.get(j).getRep_parent() %>">
						<input type="submit" style="border: 0px" value="삭제">  
					</form>
					
					<%if(id != null && id.trim().equals(commRe_arr.get(j).getRep_admin())) { %>
					<!-- 수정  -->			
					<form> 
						<input type="hidden" name="comm_num" value="<%= comm_num%>">
						<input type="hidden" name="rep_num" value="<%=commRe_arr.get(j).getRep_num() %>">
						<input type="button" style="border: 0px" value="수정"  onclick="update(<%=i%>)"> 
					</form>  
					<%} %>
					<!-- 답글달기  -->
					<div>
						<input type="button" style="border: 0px" value="답글달기" onclick="rereply(<%=i%>)"> 
					</div>	
				</div>

				<br>
				<hr> 
			</div>
		</div>	
		
		<!-- 댓글 수정 div -->
		<div id="update<%=i %>" style="display: none">
				<form action ="adminReplyUpdatePro.jsp" method="post"> 
					<div style="margin-bottom: 5px">
						<input name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=commRe_arr.get(j).getRep_content()%>"> 
						<input type="hidden" name="rep_num" value="<%=commRe_arr.get(j).getRep_num() %>">
						<input type="hidden" name="comm_num" value="<%= comm_num%>">
					</div>
					
					<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> <!-- 삭제 수정 답글 -->			
						<input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem"  value="취소" onclick="updatecancel(<%=i%>)"> 
						<input type="submit" class="btn btn-danger" style="font-size: 0.75rem" value="수정">  
						
					</div>
					<br>
					<hr> 
				</form>  	
			</div>
		<!-- /댓글 수정 div -->
		
		<!-- 답글 입력폼  -->	
		<div id="rereply<%=i%>" style="display: none">
			<form action="adminReplyPro.jsp" id="rereplyFrm<%=i %>" name="comm_rereply_form" method="post">
				<input type="hidden" name="comm_num" value="<%= comm_num%>">
				<!-- 부모댓글의 댓글번호를 부모댓글번호로 들고온다 -->
				<input type="hidden" name="rep_parent" value="<%=commRe_arr.get(j).getRep_num() %>">
				
				<div class="form-row">
					 <img style="margin-left:30px; width: 15px; height: 20px" src="${pageContext.request.contextPath}/img/rereply.png">
					 
					 <!-- 답글 입력창 -->
					 <div id="rere_content">
					   <input "id="rerep_content<%=i%>" name="rep_content"  type="text" class="form-control recontent" placeholder="답글을 입력해주세요." > 
					 </div>
					 
					<!-- 답글 등록버튼 -->
					<div id="rere_content">
						<input  
						type="button" onclick="rereply_ok(<%=i%>)" class="form-control rebtn" value="등록">
					</div>
				</div>		
			</form>
			<hr style="margin-top: 0px">
		</div>	
			
		<!-- 답글 시작 -->	
		<div class="rereply_div">
	
		  <div id="rereplylist<%=i %>" style="display: none">
		<% 
		
			ArrayList<CommunityReplyBean> commRere_arr  = Rmgr.Community_rereply_list(comm_num, commRe_arr.get(j).getRep_num());
		
			for(int k =0; k< commRere_arr.size(); k++){
      			String repPerson2 = commRere_arr.get(k).getRep_admin() != null ? "관리자" : commRere_arr.get(k).getRep_nick();
      		%>
      		
      		<div id="rereply_repeat<%=commRere_arr.get(k).getRep_num() %>" >
			<!-- 닉네임 날짜 -->
			<div class="row" style="font-size:0.85rem;" >
				<img style="margin-left:50px; width: 15px; height: 20px" src="${pageContext.request.contextPath}/img/rereply.png">
				 
				 <% if(repPerson2.equals(commRere_arr.get(k).getRep_nick())) {%>
	            <p style="margin-left:10px;"><%=repPerson2%></p> <!-- 닉네임 -->
				<% } else{ %>
				 <p style="margin-left:10px;  font-weight: 800"><%=repPerson2%></p> <!-- 닉네임 -->
				<%} %>      				
				<p style="margin-left:20px;"><%=commRere_arr.get(k).getRep_date()%></p> <!-- 날짜 -->
			</div>
			
			<!-- 댓글내용 -->
			<div style="margin-left:65px; font-size:1rem;">
				<%=commRere_arr.get(k).getRep_content()%> <!-- 댓글내용 -->
			</div> 
	
			<!-- 답글보기 삭제 수정 답글 -->
			<div>
			
				<!-- 삭제 수정 답글 -->
				<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> 
				
					<!-- 삭제  -->
					<form action="adminReplyDeletePro.jsp"> 
						<!-- 원래글로 돌아가기위한 글번호  -->
						<input type="hidden" name="comm_num" value="<%= comm_num%>">
						<input type="hidden" name="rep_num" value="<%=commRere_arr.get(k).getRep_num() %>">
						<input type="hidden" name="rep_parent" value="<%=commRere_arr.get(k).getRep_parent() %>">
						<input type="submit" style="border: 0px" value="삭제">  
					</form>
					<% if(id != null && id.trim().equals(commRere_arr.get(k).getRep_admin())) { %>					
					<!-- 수정  -->			
					<form> 
						<input type="hidden" name="comm_num" value="<%= comm_num%>">
						<input type="hidden" name="rep_num" value="<%=commRere_arr.get(k).getRep_num() %>">
						<input type="button" style="border: 0px" value="수정"  onclick="rereupdate(<%=commRere_arr.get(k).getRep_num()%>)"> 
					</form>	  
					 <%} %>	 
				</div>
			
				</div>	
			<br>
			<hr>
			
			</div> <!-- rereply_repeat -->
			
	      	<!-- 답글 수정 div -->
			    <div id="rereupdate<%=commRere_arr.get(k).getRep_num() %>" style="display: none">
			        <form action ="reply_updatePro.jsp" method="post"> 
			            <div style="margin-bottom: 5px">
			                <input id="rere_upcontent" name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=commRere_arr.get(k).getRep_content()%>"> 
			                <input type="hidden" name="rep_num" value="<%=commRere_arr.get(k).getRep_num() %>">
			                <input type="hidden" name="comm_num" value="<%= comm_num%>">
			            </div>
			            
			            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex">			
			                <input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem"  value="취소" onclick="rereupdatecancel(<%=commRere_arr.get(k).getRep_num() %>)"> 
			                <input type="submit" class="btn btn-danger" style="font-size: 0.75rem" value="수정">  		
			            </div>
			            
			            <br>
			            <hr> 
			        </form>  	
			    </div>
			</div>											
			
		<%
				}
		%>		
		  </div> <!-- rereplylist -->     

			</div> <!-- rereply_div  -->
					
		</div> <!-- reply_div끝  -->
			
		<%
				}
		%>	
				
				<!-- 댓글 입력폼  -->
				<form action="adminReplyPro.jsp" id="replyFrm" name="comm_reply_form" method="post">
				  	<!-- 글번호를 넘긴다 -->
				  	<input type="hidden" name="comm_num" value="<%=comm_num%>">
				  	 <!-- 부모댓글번호 -->
        			<input type="hidden" name="rep_parent" value="0">
					<div class="form-row">
						 <div class="col-8">
						   <input name="rep_content" style="margin-left:20px; height:60px; font-weight:bolder;" 
						   type="text" class="form-control" placeholder="댓글을 입력해주세요." >
						</div>
						
						<div class="col-2">
							<input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" 
							type="button" onclick="reply_ok()" class="form-control" value="등록">
						</div>
					</div>
				</form>
				<!-- /댓글 입력 폼 -->
		 	</div>
		</div>
		<!-- /page Content -->
	</div>
	<!-- /wrapper -->
</main>
<%@ include file="/admin/adminFooter.jsp" %>