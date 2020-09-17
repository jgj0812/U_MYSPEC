<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("adminId");
%>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	int re = mgr.insertNotice(bean, id);
	if(re == 1) {
		%>
			<script type="text/javascript">
				alert("공지글을 작성하였습니다.");
				document.location.href="adminNotice.jsp";
			</script>
		<%
	}else {
		%>
			<script>
				alert("공지글 작성에 실패하였습니다.");
				history.go(-1);
			</script>
		<%
	}
%>