<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int memType = Integer.parseInt(request.getParameter("memType"));
%>
<jsp:useBean id="mgr" class="mySpec.MemberMgr" />
<%
	if(memType == 0) {
%>
<jsp:useBean id="pb" class="mySpec.PersonBean" />
<jsp:setProperty property="*" name="pb" />
<%
		int re = mgr.insertPersonMember(pb);
		if(re == 1) {
%>
			<script type="text/javascript">
				alert("회원가입을 축하합니다.");
				document.location.href="login.jsp";
			</script>
<%
		}else {
%>
			<script>
				alert("회원가입에 실패하였습니다.")
				history.go(-1);
			</script>
<%
		}
	}else if(memType == 1) {
%>
<jsp:useBean id="ob" class="mySpec.OrgBean"/>
<jsp:setProperty property="*" name="ob"/>
<%
		int re = mgr.insertOrgMember(ob);
		if(re == 1) {
%>
			<script type="text/javascript">
				alert("회원가입을 축하합니다.");
				document.location.href="login.jsp";
			</script>
<%
		}else {
%>
			<script>
				alert("회원가입에 실패하였습니다.")
				history.go(-1);
			</script>
<%
		}
	}
%>
