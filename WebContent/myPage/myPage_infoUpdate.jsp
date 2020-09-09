<%@page import="mySpec.MemberMgr"%>
<%@page import="mySpec.PersonBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pwd = request.getParameter("old_pwd");
 
%>
<jsp:useBean id="pup" class="mySpec.PersonBean"/>
<jsp:setProperty property="*" name="pup"/>
<%
	MemberMgr mgr = new MemberMgr();
	int flag = mgr.updatePerson(pup, pwd);
	if(flag==1) {
		response.sendRedirect("../index.jsp");
	} else {
%>
		<script>
		alert("비밀번호가 맞지 않습니다.");
		history.back();
		</script>		
<%
	}
%> 