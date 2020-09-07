<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mySpec.*"%>
<%@ include file="../header.jsp" %>

<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>

<%
	int comm_num= Integer.parseInt(request.getParameter("comm_num"));
	CommunityBean commB = mgr.Community_detailView(comm_num);
	
	int num = commB.getComm_num(); //글번호
	String person = commB.getComm_person();
	String date = commB.getComm_date();
	int hits = commB.getComm_hits();
	String content = commB.getComm_content();
	String title = commB.getComm_title();
	

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
					<div style="margin-left:15px;"><p><%= date %></p></div><!-- 날짜 -->
					<div style="margin-left:10px;"><p>조회수</p></div>
					<div style="margin-left:3px;"><p><%= hits %></p></div><!-- 조회수 -->
				</div>
				<hr>
	<div class="jumbotron jumbotron-fluid" style="background-color:white;">
	  <div class="container">
	    <p class="lead"><%= content %></p><!-- 내용 -->
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
					onclick="location.href='updateForm.jsp?comm_num=<%=commB.getComm_num()%>'">
					
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
		<div class="row" style="font-size:0.75rem; margin-top:23px;" >
			<p style="margin-left:40px; margin-top:15px;">댓글</p>
			<p style="margin-top:15px; margin-left:5px;">0</p>
		</div>
		<hr style="margin-top: 2px">
		
		
	 <div class="form-row">
	    <div class="col-8">
	      <input style="margin-left:20px; height:60px; font-weight:bolder;" type="text" class="form-control" placeholder="댓글을 입력해주세요.">
	    </div>
	    <div class="col-2">
	      <input style="width:75px; margin-left:20px; margin-bottom:40px; height:60px; background-color:#aaaaaa; color:white;" type="submit" class="form-control" value="등록">
	    </div>
	  </div>
 </div>
</section>
<%@ include file="../footer.jsp" %>