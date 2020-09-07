<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	int pageSize = 5;	// 한 화면에 보여지는 수
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);		// 현재 페이지
	int startRow = (currentPage - 1) * pageSize + 1;	// 페이지 시작
	int endRow = currentPage * pageSize;				// 페이지 끝
	int memType = Integer.parseInt(request.getParameter("memType"));
	String id = request.getParameter("id");
	if(memType == 0) {
		mgr.deletePerson(id);	// 삭제
		response.sendRedirect("adminPerson.jsp");
	}else {
		mgr.deleteOrg(id);
		response.sendRedirect("adminOrg.jsp");
	}
%>