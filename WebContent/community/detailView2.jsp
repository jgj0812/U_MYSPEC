<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mySpec.*"%>
<%@ include file="../header.jsp" %>

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
	int member = -1;
	if(id != null) {
		member = (int)session.getAttribute("member");
	}

	//글번호 저장
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));

	//글번호로 게시물 보여주기
	CommunityBean commB = mgr.Community_detailView(comm_num);	
	
	//다음글
	int next_comm = mgr.next_community(comm_num);
	int prev_comm = mgr.prev_community(comm_num);
	
	//글번호로 댓글 리스트 보여주기
	ArrayList<CommunityReplyBean> commRe_arr  = Rmgr.Community_reply_list(comm_num);
	
	//댓글 갯수
	int count = Rmgr.Community_reply_count(comm_num);
	
	//글번호
	int num = commB.getComm_num();

	String person = commB.getComm_admin() == null ? commB.getComm_nick() : "관리자";
	int hits = commB.getComm_hits();
	String content = commB.getComm_content();
	String title = commB.getComm_title();
	
	//DATE 날짜만 보여주기
	String str = commB.getComm_date();
	String [] date = str.split(" ");
	String date_1 = date[0];
	
	
%>

<section class="container my-3">

	<div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row">
				<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">전체글 보기</div>	
			</div>
		</div>
	</div>
	
	<hr style="height: 2px; background-color: black;">
	
	<!-- 제목   -->
	<div style="margin-left:20px;">
		<h3><%= title %></h3>
	</div>	
			
	<hr>
	
	<!-- 글 글쓴이, 날짜, 조회수 -->
	<div class="row" style="font-size: 0.75rem; color: #999;" >
		<div style="margin-left:40px;"><p><%= person %></p></div>	<!-- 글쓴이 -->
		<hr class="name_line">
		<div style="margin-left:15px;"><p><%= date_1 %></p></div> <!-- 날짜 -->
		<div style="margin-left:10px;"><p>조회수</p></div>
		<div style="margin-left:3px;"><p><%= hits %></p></div> <!-- 조회수 -->
	</div>
	
	<hr>
				
	<div class="jumbotron jumbotron-fluid" style="background-color:white;">
	  <div class="container">
	    <pre><p class="lead"><%= content %></p></pre><!-- 내용 -->
	  </div>
	</div>
	
	<!-- 공유   -->
	<div class="form-inline justify-content-end">
		<img src="${pageContext.request.contextPath}/img/icon.png" 
			 width="30px" 
			 height="30px" 
			 style="background-color:#eeeeee; padding: 5px" 
			 data-toggle="modal" data-target="#shareModal">
	</div>
	
	<!-- Modal -->
		<div class="modal fade" id="shareModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">공유하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="d-flex flex-row justify-content-around">
						<i class="fab fa-facebook-square" onclick="facebook(<%=comm_num %>)" style="font-size: 50px; color: #3b5998;"></i>	
						<i class="fab fa-twitter-square" onclick="twitter(<%=comm_num %>)" style="font-size: 50px; color: #00acee;"></i>
						<img src="${pageContext.request.contextPath}/img/line.png" onclick="line(<%=comm_num %>)" style="width: 50px; height: 50px;">


					</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	<hr>
	
	<!-- 목록, 수정, 삭제, 다음글  -->
	<div class="form-inline justify-content-end">
		<button type="button" 
				class="btn text-dark" 
				style="background-color:#eeeeee; margin-right:5px; font-size:12px;font-family:Noto Sans KR; font-weight:bolder;"
				onclick="location.href='community.jsp'">목록</button>
			
		<!-- 수정  -->
		<%if(id != null && id.trim().equals(commB.getComm_person())) { %>	
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
		<% } %>
		   		
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

	<!-- --------댓글 보여주는 곳--------- -->	
	<div class="reply" style="background-color:#eeeeee;">
		<div class="row" style="font-size:0.75rem; margin-top:23px;" >
			<p style="font-weight:bold; margin-left:40px; margin-top:15px;">댓글</p>
			<p style="font-weight:bold; margin-top:15px; margin-left:5px;"><%=count %></p>	<!-- 댓글수 -->
		</div>
		
		<hr style="margin-top: 2px">
		
		<%
		int i = 0;
		for(CommunityReplyBean commRB :commRe_arr){
			
      		String repPerson = commRB.getRep_admin() != null ? "관리자" : commRB.getRep_nick();
      		int recount = Rmgr.Community_rereply_count(comm_num, commRB.getRep_num());
      		i++;
	
		%>	
		<!-- --------------------댓글 반복되는 곳-------------------- -->
		<div class="reply_div">
		    <!-- 댓글 기본 div  -->
		    <div id="basic<%=i%>" style="display: block">
		        
		        <!-- 닉네임 날짜 -->
		        <div class="row" style="font-size:0.85rem;" >
		        	<% if(repPerson.equals(commRB.getRep_nick())) {%>
		            <p style="margin-left:40px;"><%=repPerson%></p>
		            <% } else {%>
		            <p style="margin-left:40px; font-style:bold; color:#1dcdff"><%=repPerson%></p> <!-- 닉네임 -->
		            <%} %>
		            
		            <p style="margin-left:20px;"><%=commRB.getRep_date()%></p> <!-- 날짜 -->
		        </div>
		      
		        <!-- 댓글내용 -->
		        <div style="margin-left:30px; font-size:1rem;" id="re_content<%=i %>">
		            <%=commRB.getRep_content()%> <!-- 댓글내용 -->
		        </div> 
		         <input type="button" value="값" onclick="getcontent(<%=i %>)">  
		        <br>
		        <!-- 답글보기 삭제 수정 답글 -->
		        <div>
		            <!-- 답글 리스트 보기  -->
		            <div style="font-size:0.75rem; margin-left:20px; float: left;"> 
		                <input type="button" style="border: 0px" value="답글보기 [<%=recount %>]" onclick="rereplylist(<%=i%>)">
		           
		            </div>
		        
		            <!-- 삭제 수정 답글 -->
		            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> 
		            
		                <% if(id != null && id.trim().equals(commRB.getRep_person())) { %>	
		                <!-- 삭제  -->
		                <form action="reply_deletePro.jsp"> 
		                    <!-- 원래글로 돌아가기위한 글번호  -->
		                    <input type="hidden" name="comm_num" value="<%= comm_num%>">
		                    <input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
		                    <input type="submit" style="border: 0px" value="삭제">  
		                </form>
		                
		                <!-- 수정  -->			
		                <form> 
		                    <input type="hidden" name="comm_num" value="<%= comm_num%>">
		                    <input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
		                    <input type="button" style="border: 0px" value="수정"  onclick="update(<%=i%>)"> 
		                </form>	  
		                <%} %>	 
		                 
		                <!-- 답글달기  -->
		                <% if(id != null && member != 1) { %>
		                <div>
		                    <input type="button" style="border: 0px" value="답글달기" onclick="rereply(<%=i%>)"> 
		                </div>	
		                <%} %>
		            </div>	
		        </div>
		
		    <br>
		    <hr> 
		
		    </div> 
		    <!-- 댓글 기본 div끝  -->
		
		    <!-- 댓글 수정 div -->
		    <div id="update<%=i %>" style="display: none">
		        <form action ="reply_updatePro.jsp" method="post"> 
		            <div style="margin-bottom: 5px">
		                <input name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=commRB.getRep_content()%>"> 
		                <input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
		                <input type="hidden" name="comm_num" value="<%= comm_num%>">
		            </div>
		            
		            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex">			
		                <input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem" value="취소" onclick="updatecancel(<%=i%>)"> 
		                <input type="submit" class="btn btn-danger" style="font-size: 0.75rem" value="수정">  		
		            </div>
		            
		            <br>
		            <hr> 
		        </form>  	
		    </div>
		
		    <!-- 답글 입력폼  -->	
		    <div id="rereply<%=i%>" style="display: none">
		        <form action="replyPro.jsp" id="rereplyFrm<%=i %>" name="comm_rereply_form" method="post">
		            <input type="hidden" name="comm_num" value="<%= comm_num%>">
		            <!-- 부모댓글의 댓글번호를 부모댓글번호로 들고온다 -->
		            <input type="hidden" name="rep_parent" value="<%=commRB.getRep_num() %>">
		            
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
		        int j =0;
		        ArrayList<CommunityReplyBean> commRere_arr  = Rmgr.Community_rereply_list(comm_num, commRB.getRep_num());
		    
		        for(CommunityReplyBean commRB2 :commRere_arr){
		              String repPerson2 = commRB2.getRep_admin() != null ? "관리자" : commRB2.getRep_nick();
		              j++;
		     	 %>
		     	 
		      	<div style="display: block;" id="rereply_repeat<%=i %><%=j %>" >
		       	 <!-- 닉네임 날짜 -->
		            <div class="row" style="font-size:0.85rem;" >
		                <img style="margin-left:50px; width: 15px; height: 20px" src="${pageContext.request.contextPath}/img/rereply.png">
		                
		            <% if(repPerson2.equals(commRB2.getRep_nick())) {%>
		                <p style="margin-left:10px;"><%=repPerson2%></p> <!-- 닉네임 -->
		                <% } else{ %>
		                <p style="margin-left:10px; font-style:bold; color:#1dcdff""><%=repPerson2%></p> <!-- 닉네임 -->
		                <%} %>
		
		                <p style="margin-left:20px;"><%=commRB2.getRep_date()%></p> <!-- 날짜 -->
		            </div>
		         
		         <!-- 댓글내용 -->
	            <div style="margin-left:65px; font-size:1rem;" id="rerecontent">
	               <%=commRB2.getRep_content()%> <!-- 댓글내용 -->
	            </div> 
		       
		        <!-- 답글보기 삭제 수정 답글 -->
            	<div>
               	 	<!-- 삭제 수정 답글 -->
	                <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> 
	                
	                    <% if(id != null && id.trim().equals(commRB2.getRep_person())) { %>	
	                    <!-- 삭제  -->
	                    <form action="reply_deletePro.jsp"> 
	                        <!-- 원래글로 돌아가기위한 글번호  -->
	                        <input type="hidden" name="comm_num" value="<%= comm_num%>">
	                        <input type="hidden" name="rep_num" value="<%=commRB2.getRep_num() %>">
	                        <input type="submit" style="border: 0px" value="삭제">  
	                    </form>
	                    
	                    <!-- 수정  -->			
	                    <form> 
	                        <input type="hidden" name="comm_num" value="<%= comm_num%>">
	                        <input type="hidden" name="rep_num" value="<%=commRB2.getRep_num() %>">
	                        <input type="button" style="border: 0px" value="수정"  onclick="rereupdate(<%=j%>)"> 
	                    </form>	  
	                    <%} %>	 
	                </div>  
            	</div>	
        	
	        	<br>
	        	<hr>
        	</div> <!-- rereply_repeat -->
        	
        	<!-- 답글 수정 div -->
		    <div id="rereupdate<%=i %><%=j %>" style="display: none">
		        <form action ="reply_updatePro.jsp" method="post"> 
		            <div style="margin-bottom: 5px">
		                <input name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=commRB.getRep_content()%>"> 
		                <input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
		                <input type="hidden" name="comm_num" value="<%= comm_num%>">
		            </div>
		            
		            <div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex">			
		                <input type="button" class="btn btn-light" style="margin-right: 5px; font-size: 0.75rem"  value="취소" onclick="rereupdatecancel(<%=j%>)"> 
		                <input type="submit" class="btn btn-danger" style="font-size: 0.75rem" value="수정">  		
		            </div>
		            
		            <br>
		            <hr> 
		        </form>  	
		    </div>
        	<%} %>
		    </div> <!-- rereplylist -->     

			</div> <!-- rereply_div  -->
					
		</div> <!-- reply_div끝  -->
		
		<%}//commRe_arr끝 %>
		
		 <!-- 댓글 입력폼  -->
	    <%
	        if(id != null && member != 1) {
	    %>				
	    <form action="replyPro.jsp" id="replyFrm" name="comm_reply_form" method="post">
	        <!-- 글번호 -->
	        <input type="hidden" name="comm_num" value="<%= comm_num%>">
	        <!-- 부모댓글번호 -->
	        <input type="hidden" name="rep_parent" value="0">
	        
	        <div class="form-row" >
	            <div class="col-8">
	            <input id="rep_content" name="rep_content" style=" margin-left:20px; height:70px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력하세요"> 
	            
	            </div>
	            
	            <div class="col-2">
	                <input style="width:70px; margin-left:20px; margin-bottom:40px; height:70px; background-color:#aaaaaa; color:white;" type="button" onclick="reply_ok()" class="form-control" value="등록">
	            </div>
	            
	    <%		}  else if(member == 1) { %>
	        <div class="container">
	            <p style="margin-left: 20px">단체회원은 댓글 기능을 이용할 수 없습니다.</p>
	            <br>
	        </div>
	        
	    </form>
	
	    <%	}else { %>
	        <div class="container">
	            <p style="margin-left: 20px">댓글을 입력하려면 로그인을 해야합니다.</p>
	            <br>
	        </div>
	    </form>
	
	    <%	} %>
			
	</div><!-- reply끝 -->
	
	

</section>

<%@ include file="../footer.jsp" %>

