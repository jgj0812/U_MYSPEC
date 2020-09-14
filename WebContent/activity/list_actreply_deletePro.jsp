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
	int rep_num = Integer.parseInt(request.getParameter("rep_num"));

	Rmgr.act_reply_delete(rep_num);
	response.sendRedirect("list_act_detail.jsp?act_num="+act_num);
%>