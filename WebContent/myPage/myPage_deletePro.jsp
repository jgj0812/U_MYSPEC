<%@page import="mySpec.MemberMgr"%>
<% %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");
	int member = (int)session.getAttribute("member");
	MemberMgr mgr = new MemberMgr();
	mgr.deletePerson(id);	// 개인회원 삭제용
	mgr.deleteOrg(id);		// 단체회원 삭제용 	
	session.invalidate();
	response.sendRedirect("../index.jsp");

%>