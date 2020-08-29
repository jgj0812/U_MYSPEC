<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MailSend"/>
<%
	request.setCharacterEncoding("euc-kr");
	int findType = Integer.parseInt(request.getParameter("findType"));
	int memType = Integer.parseInt(request.getParameter("memType"));
	String msg = "이메일 전송에 실패하였습니다.";
	if(findType == 0) {
		if(memType == 0) {
			String email = request.getParameter("email");
			String birth = request.getParameter("birth");
			String phone = request.getParameter("phone");
			boolean result = mgr.sendPersonId(email, birth, phone);
			if(result) msg = "id가 적힌 이메일을 전송하였습니다.";
		}else if(memType == 1) {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String manager = request.getParameter("manager");
			String phone = request.getParameter("phone");
			boolean result = mgr.sendOrgId(email, name, manager, phone);
			if(result) msg = "id가 적힌 이메일을 전송하였습니다.";
		}
	}else if(findType == 1) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		boolean result = mgr.sendPwd(memType, id, email);
		if(result) msg = "비밀번호가 적힌 이메일을 전송하였습니다.";
	}
%>
<script>
	alert("<%=msg%>");
	location.href="finder.jsp";
</script>