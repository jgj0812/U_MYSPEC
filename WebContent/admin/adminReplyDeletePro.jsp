<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mgr" class="mySpec.CommunityReplyMgr"  />
<jsp:useBean id="rBean" class="mySpec.CommunityReplyBean" />
<jsp:setProperty property="*" name="rBean"/>
<%
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	int rep_num = Integer.parseInt(request.getParameter("rep_num"));
	
	mgr.Community_reply_delete(rep_num);
	response.sendRedirect("adminComDetail.jsp?comm_num=" + comm_num);
%>