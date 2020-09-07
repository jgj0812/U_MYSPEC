<%@page import="java.util.ArrayList"%>
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
	request.setCharacterEncoding("UTF-8");

	int sorting_num = Integer.parseInt(request.getParameter("sorting_num"));
	String str = request.getParameter("comm_search"); 
	ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>();

	comm_arr = mgr.Community_list_search(sorting_num,str); 

%>