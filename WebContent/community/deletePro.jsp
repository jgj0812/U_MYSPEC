<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>

<%
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	request.setCharacterEncoding("UTF-8");

	mgr.Community_delete(comm_num);

	response.sendRedirect("community.jsp");
%>