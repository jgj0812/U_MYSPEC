<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MailSend"/>
<%
	request.setCharacterEncoding("euc-kr");
	int findType = Integer.parseInt(request.getParameter("findType"));
	int memType = Integer.parseInt(request.getParameter("memType"));
	boolean result = false;
	if(findType == 0) {
		if(memType == 0) {
			String email = request.getParameter("email");
			String birth = request.getParameter("birth");
			String phone = request.getParameter("phone");
			result = mgr.sendPersonId(email, birth, phone);
			out.println(result);
		}else if(memType == 1) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String manager = request.getParameter("manager");
			String phone = request.getParameter("phone");
			result = mgr.sendOrgId(email, name, manager, phone);
			out.println(result);
		}
	}else if(findType == 1) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		result = mgr.sendPwd(memType, id, email);
		out.println(result);
	}else {
		out.println(result);
	}
%>