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
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	int rep_num = Integer.parseInt(request.getParameter("rep_num"));

	Rmgr.Community_reply_delete(rep_num);
	response.sendRedirect("detailView.jsp?comm_num="+comm_num);
%>