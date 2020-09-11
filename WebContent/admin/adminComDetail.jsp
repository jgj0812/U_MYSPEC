<%@page import="mySpec.CommunityReplyBean"%>
<%@page import="mySpec.CommunityBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/adminHeader.jsp" %>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="Rmgr" class="mySpec.CommunityReplyMgr" />
<%
	// 글번호
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	// 글번호로 게시물 보여주기
	CommunityBean commB = mgr.Community_detailView(comm_num);
	// 글번호로 댓글 리스트 보여주기
	ArrayList<CommunityReplyBean> commRe_arr  = Rmgr.Community_reply_list(comm_num);
	
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
			  <div>
			    <pre><%= content %></pre><!-- 내용 -->
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
				    
				    <!-- 이전, 다음글 -->
					<button type="button"  
					    	class="btn text-dark"  
						    style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR;font-weight:bolder; margin-right:5px;"  
						    onclick="prev(<%=prev_comm%>)">이전글</button>
						      		   
					<button type="button"  
					    	class="btn text-dark"  
						    style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR;font-weight:bolder;"  
						    onclick="next(<%=next_comm%>)">다음글</button>
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
				for(int i = commRe_arr.size() - 1; i >= 0 ; i--) {
					String repPerson = commRe_arr.get(i).getRep_admin() != null ? "관리자" : commRe_arr.get(i).getRep_nick();

					int wid=0;
					int h=0;
					int fontwid=0;
					int wid_margin=0;
					 
					if(commRe_arr.get(i).getRep_level() > 0){

						wid = 25*(commRe_arr.get(i).getRep_level());
						fontwid=15;
						h=15;
						wid_margin = 25*(commRe_arr.get(i).getRep_level());
					}
		%>	
				<!-- 댓글 div -->
				<div class="reply_div">
					<div id="basic<%=i%>" style="display: block">
						<div class="row" style="font-size:0.75rem;" >
							<img src="${pageContext.request.contextPath}/img/level.png" style="margin-left: 16px; width: <%=wid%>px;  height:<%=h%>px;"> <!-- 레벨 -->
							<i class="fas fa-reply" style="margin-left: 5px; font-size:<%=fontwid%>px "></i> <!-- 답글 이모지 -->
							<p style="margin-left:25px;"><%=repPerson%></p> <!-- 닉네임 -->
							<p style="margin-left:20px;"><%=commRe_arr.get(i).getRep_date()%></p> <!-- 날짜 -->
						</div>
						
						<div style="margin-left:25px; font-size:1rem;">
							<img src="${pageContext.request.contextPath}/img/level.png" style="margin-left: <%=wid_margin%>px; height:<%=h%>px;">
							<%=commRe_arr.get(i).getRep_content()%>
						</div> <!-- 댓글 내용 -->
						
						<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> <!-- 삭제 수정 답글 -->
							<!-- 삭제  -->
							<form action="adminReplyDeletePro.jsp"> 
								<!-- 원래글로 돌아가기위한 글번호  -->
								<input type="hidden" name="comm_num" value="<%= comm_num%>">
								<input type="hidden" name="rep_num" value="<%=commRe_arr.get(i).getRep_num() %>">
								<input type="submit" style="border: 0px" value="삭제">  
							</form>
							
							<%if(id != null && id.trim().equals(commRe_arr.get(i).getRep_admin())) { %>
							<!-- 수정  -->			
							<form> 
								<input type="hidden" name="comm_num" value="<%= comm_num%>">
								<input type="hidden" name="rep_num" value="<%=commRe_arr.get(i).getRep_num() %>">
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
					<!-- 댓글 수정 div -->
					<div id="update<%=i %>" style="display: none">
						<form action ="adminReplyUpdatePro.jsp" method="post"> 
							<div style="margin-bottom: 5px">
								<input name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=commRe_arr.get(i).getRep_content()%>"> 
								<input type="hidden" name="rep_num" value="<%=commRe_arr.get(i).getRep_num() %>">
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
					<!-- 답글 입력폼 -->
					<div id="rereply<%=i%>" style="display: none">
						<form action="adminReplyPro.jsp" id="rereplyFrm<%=i %>" name="comm_reply_form" method="post">
							<input type="hidden" name="comm_num" value="<%= comm_num%>">
							<input type="hidden" name="rep_num" value="<%=commRe_arr.get(i).getRep_num() %>">
							<input type="hidden" name="rep_ref" value="<%=commRe_arr.get(i).getRep_num() %>">
							<input type="hidden" name="rep_step" value="<%=commRe_arr.get(i).getRep_step() %>">
							<input type="hidden" name="rep_level" value="<%=commRe_arr.get(i).getRep_level() %>">
							
							<div class="form-row">
								 <i class="fas fa-reply" style="margin-left: 20px; font-size:25" ></i> <!-- 답글 이모지  -->
								 
								 <!-- 답글 입력창 -->
								 <div class="col-8">
								   <input name="rep_content" style="margin-left:20px; height:60px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력해주세요." > 
								 </div>
								 
								<!-- 답글 등록버튼 -->
								<div class="col-2">
									<input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" type="button" onclick="rereply_ok(<%=i %>)" class="form-control" value="등록">
								</div>
							</div>
							
						</form>
						
						<hr style="margin-top: 0px">
					</div>
					<!-- /답글 입력폼 -->
				</div>
				<!-- /댓글 div -->
		<%
				}
		%>				
				<!-- 댓글 입력폼  -->
				<form action="adminReplyPro.jsp" id="replyFrm" name="comm_reply_form" method="post">
				  	<!-- 글번호를 넘긴다 -->
				  	<input type="hidden" name="comm_num" value="<%= comm_num%>">
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
<script type="text/javascript">
	function rereply(i){
		var con = document.getElementById("rereply" + i);
		if(con.style.display =='none'){
			con.style.display = 'block';
		}else if(con.style.display =='block'){
			con.style.display = 'none';
		}
	}
	function update(i){
		var update = document.getElementById("update" + i);
		var basic = document.getElementById("basic" + i);
		
		if(update.style.display =='none'){
			update.style.display = 'block';
			basic.style.display = 'none';
		}else if(update.style.display =='block'){
			update.style.display = 'none';
			basic.style.display = 'block';
		}
	}
	function updatecancel(i){
		var update = document.getElementById("update" + i);
		var basic = document.getElementById("basic" + i);
		if(update.style.display =='block'){
			update.style.display = 'none';
			basic.style.display = 'block';
		}
	}
</script>
<%@ include file="/admin/adminFooter.jsp" %>