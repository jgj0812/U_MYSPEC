<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />
<%
	request.setCharacterEncoding("euc-kr");
	int memType = Integer.parseInt(request.getParameter("memType"));
	if(memType == 0) {
		String personId = request.getParameter("personid");
		String flag = mgr.personIdCheck(personId);
		out.println(flag);
	}else if(memType == 1) {
		String orgId = request.getParameter("orgid");
		String flag = mgr.OrgIdCheck(orgId);
		out.println(flag);
	}
%>