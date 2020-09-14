<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="Rmgr" class="mySpec.ActivityMgr" />
<jsp:useBean id="Rbean" class="mySpec.ActivityReplyBean" />

<jsp:setProperty property="*" name="Rbean"/>

<%

	int act_num = Integer.parseInt(request.getParameter("act_num"));
	
	int re = Rmgr.act_reply_update(Rbean);
	
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
	
	
	response.sendRedirect("list_act_detail.jsp?act_num="+act_num);
%>