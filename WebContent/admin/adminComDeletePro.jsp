<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	int type = Integer.parseInt(request.getParameter("type"));
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
%>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	if(type == 0) {
		mgr.Community_delete(comm_num);
		response.sendRedirect("adminNotice.jsp");
	}else {
		mgr.Community_delete(comm_num);
		
	}
%>