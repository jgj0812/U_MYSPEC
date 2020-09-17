<%@page import="mySpec.MemberMgr"%>
<% %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	int member = (int)session.getAttribute("member");
	int re = 0;
	MemberMgr mgr = new MemberMgr();
	if(member == 0) {
		re= mgr.deletePerson(id);	// 개인회원 삭제용	
	}else {
		re= mgr.deleteOrg(id);		// 단체회원 삭제용	
	}
	session.invalidate();
	if(re == 1) {
%>
		<script>
			alert("회원 탈퇴하였습니다.");
			document.location.href="../index.jsp";
		</script>
<%
	}else {
%>
		<script>
			alert("회원 탈퇴에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>