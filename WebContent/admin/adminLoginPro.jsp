<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("admin_id");
	String pwd = request.getParameter("admin_pwd");
	int re = mgr.adminMemberLogin(id, pwd);
	if(re == 1) {
		session.setAttribute("adminId", id);
		response.sendRedirect("adminIndex.jsp");
	}else {
		%>
			<script type="text/javascript">
				alert("로그인 실패");
				history.go(-1);
			</script>
		<%
	}
%>