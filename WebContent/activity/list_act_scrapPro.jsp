<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String person_id = request.getParameter("person_id");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	ActivityMgr manager = new ActivityMgr();
	out.print(manager.act_scrap(person_id, act_num));
%>