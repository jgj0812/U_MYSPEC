<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MemberMgr"/>
<%
	request.setCharacterEncoding("euc-kr");
	int memType = Integer.parseInt(request.getParameter("memType"));
	if(memType == 0){
		String personId = request.getParameter("person_id");
		String personPwd = request.getParameter("person_pwd");
		int re = mgr.personMemberLogin(personId, personPwd);
		if(re == 1) {
			session.setAttribute("id", personId);
			session.setAttribute("member", 0);
			response.sendRedirect("index.jsp");
		}else if(re == 0) {
%>
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.go(-1);
			</script>
<%
		}else {
%>
			<script>
				alert("일치하는 아이디가 없습니다.");
				history.go(-1);
			</script>
<%
		}
	}else if(memType == 1) {
		String orgId = request.getParameter("org_id");
		String orgPwd = request.getParameter("org_pwd");
		int re = mgr.orgMemberLogin(orgId, orgPwd);
		if(re == 1) {
			session.setAttribute("id", orgId);
			session.setAttribute("member", 1);
			response.sendRedirect("index.jsp");
		}else if(re == 0) {
%>
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.go(-1);
			</script>
<%
		}else {
%>
			<script>
				alert("일치하는 아이디가 없습니다.");
				history.go(-1);
			</script>
<%
		}
	}
%>