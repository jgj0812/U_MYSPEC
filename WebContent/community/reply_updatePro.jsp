<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="Rmgr" class="mySpec.CommunityReplyMgr" />
<jsp:useBean id="Rbean" class="mySpec.CommunityReplyBean" />

<jsp:setProperty property="*" name="Rbean"/>

<%
/* 	String rep_content = request.getParameter("rep_content");
	int rep_num = Integer.parseInt(request.getParameter("rep_num")); */
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	
	int re = Rmgr.Community_reply_update(Rbean);
	
	if(re == 1){
		%>
			<script>
				alert("댓글이 수정되었습니다.");	
			</script>
		<% 
			}else{
		%>
			<script>
				alert("댓글 수정이 실패하였습니다.");
			</script>
		<%
			}
	
	
	response.sendRedirect("detailView.jsp?comm_num="+comm_num);
%>