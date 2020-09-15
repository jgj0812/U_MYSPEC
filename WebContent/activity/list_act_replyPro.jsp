<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mgr" class="mySpec.ActivityMgr" />
<jsp:useBean id="bean" class="mySpec.ActivityReplyBean" />

<jsp:setProperty property="*" name="bean"/>

<%
	
	int memberType = (int)session.getAttribute("member");
	int act_num= Integer.parseInt(request.getParameter("act_num"));
	int rep_parent= Integer.parseInt(request.getParameter("rep_parent"));
	int re = 0;

	
	if(memberType == 0) {
		re = mgr.act_reply_insertPerson(bean, id, act_num,rep_parent);
	}else {
		re = mgr.act_reply_insertOrg(bean, id, act_num,rep_parent);
	}
	

	if(re == 1){
		%>
			<script>
				alert("댓글이 입력되었습니다.");	
			</script>
		<% 
			}else{
		%>
			<script>
				alert("댓글 입력이 실패하였습니다.");
			</script>
		<%
			}
	
	response.sendRedirect("list_act_detail.jsp?act_num="+act_num);
%>