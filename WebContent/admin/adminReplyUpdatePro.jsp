<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mgr" class="mySpec.CommunityReplyMgr" />
<jsp:useBean id="Rbean" class="mySpec.CommunityReplyBean" />
<jsp:setProperty property="*" name="Rbean"/>
<%
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	int re = mgr.Community_reply_update(Rbean);
	
	if(re == 1) {
%>
		<script>
			alert("댓글이 수정되었습니다.");
		</script>
<%
	}else {
%>
		<script>
			alert("댓글 수정이 실패하였습니다.");
		</script>
<%
	}
	response.sendRedirect("adminComDetail.jsp?comm_num=" + comm_num);
%>