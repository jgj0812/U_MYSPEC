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
	
	//다음글
	int next_comm = mgr.next_community(comm_num);
	
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
		   		   
		    <button type="button"  
		    		class="btn text-dark"  
				    style="background-color:#eeeeee; font-size: 12px; font-family:Noto Sans KR;font-weight:bolder;"  
				    onclick="next(<%=next_comm%>)">다음글</button>
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

		<!-- 댓글 div  -->
		<div id="basic<%=i%>" style="display: block">
			<div class="row" style="font-size:0.75rem;" >
				<img src="${pageContext.request.contextPath}/img/level.png" style="margin-left: 16px; width: <%=wid%>px;  height:<%=h%>px;"> <!-- 레벨 -->
				<i class="fas fa-reply" style="margin-left: 5px; font-size:<%=fontwid%>px "></i> <!-- 답글 이모지 -->
				<p style="margin-left:25px;"><%=commRB.getRep_person()%></p> <!-- 닉네임 -->
				<p style="margin-left:20px;"><%=commRB.getRep_date()%></p> <!-- 날짜 -->
			</div>
			
			<div style="margin-left:25px; font-size:1rem;">
				<img src="${pageContext.request.contextPath}/img/level.png" style="margin-left: <%=wid_margin%>px; height:<%=h%>px;">
				<%=commRB.getRep_content()%>
			</div> <!-- 댓글 내용 -->
			
			<div style="font-size:0.75rem; float: right;  margin-right: 20px; display: flex"> <!-- 삭제 수정 답글 -->
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
				 
				<!-- 답글달기  -->
				<input type="button" style="border: 0px" value="답글달기" onclick="rereply(<%=i%>)"> 
			</div>
			<br>
		<hr> 
		</div>
		
		<!-- 구분선 -->

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
			<form action="replyPro.jsp" name="comm_reply_form" method="post">
				<input type="hidden" name="comm_num" value="<%= comm_num%>">
				<input type="hidden" name="rep_num" value="<%=commRB.getRep_num() %>">
				<input type="hidden" name="rep_ref" value="<%=commRB.getRep_ref() %>">
				<input type="hidden" name="rep_step" value="<%=commRB.getRep_step() %>">
				<input type="hidden" name="rep_level" value="<%=commRB.getRep_level() %>">
				
				<div class="form-row">
					 <i class="fas fa-reply" style="margin-left: 20px; font-size:25" ></i> <!-- 답글 이모지  -->
					 
					 <!-- 답글 입력창 -->
					 <div class="col-8">
					   <input name="rep_content" style="margin-left:20px; height:60px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력해주세요." > 
					 </div>
					 
					<!-- 답글 등록버튼 -->
					<div class="col-2">
						<input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" type="submit" class="form-control" value="등록">
					</div>
				</div>
				
			</form>
			
			<hr style="margin-top: 0px">
		</div>
		
		
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
			   <input name="rep_content" style="margin-left:20px; height:70px; font-weight:bolder;" 
			   type="text" class="form-control" placeholder="댓글을 입력해주세요." >
			</div>
			
			<div class="col-2">
				<input style="width:75px; margin-left:20px; margin-bottom:40px; height:70px; background-color:#aaaaaa; color:white;" 
				type="submit" class="form-control" value="등록">
			</div>
<%		}else { %>
		<div class="container">
			<p>댓글을 입력하려면 로그인을 해야합니다.</p>
			<br>
		</div>
	</form>
<%		} %>
 	</div>
</section>

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


function next(next_comm){
 	if(next_comm == 0){
		alert("다음 글이 없습니다.");
	}else{
		window.location = "detailView.jsp?comm_num=<%=next_comm %>";
	}
}

</script>




<%@ include file="../footer.jsp" %>


