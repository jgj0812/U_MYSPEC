<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mySpec.*"%>
<%@ include file="../header.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<section class="container my-3">
	<div class="card bg-light mt-3">
		<div class="card-header bg-light">
			<div class="row">
				<div class="col-8 text-left" style="font-family:Noto Sans KR; font-weight:bolder;">글수정</div>	
			</div>
		</div>
	</div>
	
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>
<%
	int comm_num= Integer.parseInt(request.getParameter("comm_num"));
	CommunityBean commB = mgr.Community_detailView(comm_num);
	
	int num = commB.getComm_num(); //글번호
	String content = commB.getComm_content();
	String title = commB.getComm_title();
	

%>	

	<form action="updatePro.jsp" name="comm_form" method="post">
		<hr style="height: 2px; background-color: black;">
		<input type="hidden" name="comm_num" value=<%=num %>>
	
			
			<!--  제목-->
			<div class="row">
				<div style="margin-left:20px; font-family:Noto Sans KR; font-weight:bolder;">제목</div>
				<input type="text" name="comm_title" class="form-control col-8" value="<%= title %>"style="margin-left:32px;">
			</div>
			
			<hr>
			
			<textarea class="form-control" name="comm_content" rows="15"><%= content %></textarea>
			
			<hr>
			
			<!--  입력, 취소버튼-->
			<div class="form-inline justify-content-end">
				<button type="button" class="btn btn-danger text-white" onclick="location.href='community.jsp'">취소</button>&nbsp;
				<input type="submit" class="btn btn-com" value="수정">
			</div>
	</form>
</section>
<%@ include file="../footer.jsp" %>