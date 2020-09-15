<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.ActivityMgr" />
<%
	request.setCharacterEncoding("utf-8");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	int act_type = Integer.parseInt(request.getParameter("act_type"));
	int re = 0;
	re = mgr.approveActCon(act_num);
	if(act_type == 1) {
		if(re == 1)	{
%>
			<script>
				alert("승인 했습니다.");
				document.location.href="adminActivity.jsp";
			</script>
<%
		}else {
%>
			<script>
				alert("승인에 실패하였습니다.");
				history.go(-1);
			</script>
<%
		}
	}else {
		if(re == 1) {
%>
			<script>
				alert("승인 했습니다.");
				document.location.href="adminContest.jsp";
			</script>
<%
		}else {
%>
			<script>
				alert("승인에 실패하였습니다.");
				history.go(-1);
			</script>
<%
		}
	}
%>