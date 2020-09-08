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

<%
	//글번호 저장
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));

	//글번호로 게시물 보여주기
	CommunityBean commB = mgr.Community_detailView(comm_num);
	
	//글번호로 댓글 리스트 보여주기
	ArrayList<CommunityReplyBean> commRe_arr  = Rmgr.Community_reply_list(comm_num);
	
	//댓글 갯수
	int count = Rmgr.Community_reply_count(comm_num);
	
	int num = commB.getComm_num(); //글번호

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
					<div style="margin-left:15px;"><p><%= date_1 %></p></div><!-- 날짜 -->
					<div style="margin-left:10px;"><p>조회수</p></div>
					<div style="margin-left:3px;"><p><%= hits %></p></div><!-- 조회수 -->
				</div>
				<hr>
	<div class="jumbotron jumbotron-fluid" style="background-color:white;">
	  <div class="container">
	    <pre><p class="lead"><%= content %></p></pre><!-- 내용 -->
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
			<%} %>
			<input type="button" class="btn text-dark"  style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR;
		    font-weight:bolder;" value="다음글">
	</div>
	
	
	<div style="background-color:#eeeeee;">
		
		<!-- 댓글수 -->
		<div class="row" style="font-size:0.75rem; margin-top:23px;" >
			<p style="font-weight:bold; margin-left:40px; margin-top:15px;">댓글</p>
			<p style="font-weight:bold; margin-top:15px; margin-left:5px;"><%=count %></p>
		</div>
		
		<hr style="margin-top: 2px">
		<!-- 댓글 보여주는 곳 -->	
<%
		for(CommunityReplyBean commRB :commRe_arr){
			String repPerson = commRB.getRep_admin() != null ? "관리자" : commRB.getRep_nick();
			
			int wid =0;
			if(commRB.getRep_level()>0){
				wid = 25*(commRB.getRep_level());
			}
%>	
	
		<div>
			<div class="row" style="font-size:0.75rem;" >
				<%-- <img src="${pageContext.request.contextPath}/img/level.png" width=<%=wid%>>
				<i class="fas fa-reply" style="width=<%=wid%>"></i> --%>
				<p style="margin-left:40px;"><%=repPerson%></p>
				<p style="margin-left:20px;"><%=commRB.getRep_date()%></p>
			</div>
			<div style="margin-left:25px; font-size:1rem;"><%=commRB.getRep_content()%></div>
			
			<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex">	
			
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
					<input type="button" style="border: 0px" value="수정" data-toggle="modal" data-target="#myModal" > 
				</form>  
				 
				<!-- 답글달기  -->
				<input type="button" style="border: 0px" value="답글달기" onclick="rereply()"> 
			</div>
		
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			         <h4 class="modal-title" id="myModalLabel">댓글 수정</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			      </div>
			      <div class="modal-body">
			      	<pre><div style="margin-left:25px; font-size:1rem;"><%=commRB.getRep_content()%></div></pre>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>	
 			 </div>
		</div>
		<br>
		<hr>
		
		<!-- 답글 입력폼  -->
		<div id="rereply" style="display: none">
			<form action="replyPro.jsp" name="comm_reply_form" method="post">
			<input type="hidden" name="comm_num" value="<%= comm_num%>">
			
			<input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
			<input type="hidden" name="rep_ref" value="<%=commRB.getRep_ref() %>">
			<input type="hidden" name="rep_step" value="<%=commRB.getRep_step() %>">
			<input type="hidden" name="rep_level" value="<%=commRB.getRep_level() %>">
			
				<div class="form-row">
					 <i class="fas fa-reply" style="margin-left: 20px"></i>
					 
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
			<hr style="margin-top: 0px">
		</div>
<%
		}

		if(id != null) {
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
		</form>
<%		}else { %>
		<div class="container">
			<p>댓글을 입력하려면 로그인을 해야합니다.</p>
		</div>
<%		} %>
 	</div>
</section>
<%@ include file="../footer.jsp" %>

<script>
function rereply(){
	var con = document.getElementById("rereply");
	if(con.style.display =='none'){
		con.style.display = 'block';
	}else if(con.style.display =='block'){
		con.style.display = 'none';
	}
}
</script>
