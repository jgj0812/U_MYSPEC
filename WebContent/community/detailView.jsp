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

@media (max-width:360px) {


}

</style>

<%
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
	
	<div style="margin-left:20px;">
			<!-- 제목   -->
		<h3><%= title %></h3>
	</div>	
			
	<hr>
	
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

	<!-- 댓글영역  -->
	<div style="background-color:#eeeeee;">
		<div class="row" style="font-size:0.75rem; margin-top:23px;" >
			<p style="font-weight:bold; margin-left:40px; margin-top:15px;">댓글</p>
			<p style="font-weight:bold; margin-top:15px; margin-left:5px;"><%=count %></p>	<!-- 댓글수 -->
		</div>
		
		<hr style="margin-top: 2px">
		
		<!-- 댓글 보여주는 곳 -->		
<%
		int i = 0;
		for(CommunityReplyBean commRB :commRe_arr){
      		String repPerson = commRB.getRep_admin() != null ? "관리자" : commRB.getRep_nick();
			int wid=0;
			int h=0;
			int fontwid=0;
			int wid_margin=0;
			i++;
			 
			if(commRB.getRep_level() > 0){
				wid = 25*(commRB.getRep_level());
				fontwid=15;
				h=15;
				wid_margin = 25*(commRB.getRep_level());
			}
%>	

<div class ="reply_div">

		<!-- 댓글 기본 div  -->
		<div id="basic<%=i%>" style="display: block">
		
			<div class="row" style="font-size:0.75rem;" >
				<img src="${pageContext.request.contextPath}/img/level.png" style="margin-left: 16px; width: <%=wid%>px;  height:<%=h%>px;"> <!-- 레벨 -->
				<i class="fas fa-reply" style="margin-left: 5px; font-size:<%=fontwid%>px "></i> <!-- 답글 이모지 -->
				<p style="margin-left:25px;"><%=repPerson%></p> <!-- 닉네임 -->
				<p style="margin-left:20px;"><%=commRB.getRep_date()%></p> <!-- 날짜 -->
			</div>
			
			<div style="margin-left:25px; font-size:1rem;">
				<img src="${pageContext.request.contextPath}/img/level.png" style="margin-left: <%=wid_margin%>px; height:<%=h%>px;"> <!-- 댓글 레벨 -->
				<%=commRB.getRep_content()%> <!-- 댓글내용 -->
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
				 
				<% if(id != null) { %>
				<!-- 답글달기  -->
				<input type="button" style="border: 0px" value="답글달기" onclick="rereply(<%=i%>)"> 
				<%} %>
			</div>
			
		<br>
		<hr> 
	
		</div> <!-- 댓글 기본 div끝  -->

		<!-- 댓글 수정 div -->
		<div id="update<%=i %>" style="display: none">
			<form action ="reply_updatePro.jsp" method="post"> 
				<div style="margin-bottom: 5px">
					<input name="rep_content" style="margin-left:20px; height:70px; width:90%; font-weight:bolder;" type="text" class="form-control" value="<%=commRB.getRep_content()%>"> 
					<input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
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

		<!-- 답글 입력폼  -->	
		<div id="rereply<%=i%>" style="display: none">
			<form action="replyPro.jsp" id="comm_rereply_form" name="comm_rereply_form" method="post">
				<input type="hidden" name="comm_num" value="<%= comm_num%>">
				<input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
				<input type="hidden" name="rep_ref" value="<%=commRB.getRep_ref() %>">
				<input type="hidden" name="rep_step" value="<%=commRB.getRep_step() %>">
				<input type="hidden" name="rep_level" value="<%=commRB.getRep_level() %>">
				
				<div class="form-row">
					 <i class="fas fa-reply" style="margin-left: 20px; font-size:25" ></i> <!-- 답글 이모지  -->
					 
					 <!-- 답글 입력창 -->
					 <div class="col-8" id="rere_content">
					   <input id="rerep_content<%=i%>" name="rep_content" style="margin-left:20px; height:60px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력해주세요." > 
					 </div>
					 
					<!-- 답글 등록버튼 -->
					<div class="col-2" id="rere_content">
						<input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" type="button" onclick="rereply_ok(<%=i%>)" class="form-control" value="등록">
					</div>
				</div>		
			</form>
			<hr style="margin-top: 0px">
		</div>		
</div>

<%
		} if(id != null) {
%>				
	<!-- 댓글 입력폼  -->
	<form action="replyPro.jsp" id="comm_reply_form" name="comm_reply_form" method="post">
	  	<!-- 글번호를 넘긴다 -->
	  	<input type="hidden" name="comm_num" value="<%= comm_num%>">
			  	
		<div class="form-row" >
			 <div class="col-8">
			   <input id="rep_content" name="rep_content" style="margin-left:20px; height:70px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력해주세요." >
			</div>
			
			<div class="col-2">
				<input style="width:75px; margin-left:20px; margin-bottom:40px; height:70px; background-color:#aaaaaa; color:white;" type="button" onclick="reply_ok()" class="form-control" value="등록">
			</div>
			
<%		} else { %>
		<div class="container">
			<p style="margin-left: 20px">댓글을 입력하려면 로그인을 해야합니다.</p>
			<br>
		</div>
		
	</form>
<%	} %>
 	</div>
 	
 	
</section>

<script type="text/javascript">

function rereply_ok(i) {
	var rereply = document.getElementById("rerep_content" + i);
	if(rereply == "") {
		alert("답글 내용을 입력해주세요.");
		rereply.focus();
		return false;
	}
	$("#comm_rereply_form").submit();
}


function rereply(i){
	var rereply = document.getElementById("rereply" + i);
	if(rereply.style.display =='none'){
		rereply.style.display = 'block';
	}else if(rereply.style.display =='block'){
		rereply.style.display = 'none';
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

<%@ include file="../footer.jsp" %>

