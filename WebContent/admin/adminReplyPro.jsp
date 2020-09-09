<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mgr" class="mySpec.CommunityReplyMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityReplyBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	String id = (String)session.getAttribute("adminId");
	int comm_num = Integer.parseInt(request.getParameter("comm_num"));
	int rep_num = 0, rep_ref = 1, rep_step = 1, rep_level = 0;
	if(request.getParameter("rep_num") != null) {
		rep_num = Integer.parseInt(request.getParameter("rep_num"));
		rep_ref = Integer.parseInt(request.getParameter("rep_ref"));
		rep_step = Integer.parseInt(request.getParameter("rep_step"));
		rep_level = Integer.parseInt(request.getParameter("rep_level"));
	}
	
	int re = mgr.insertAdminReply(bean, id, comm_num);
	
	if(re == 1) {
	%>
		<script type="text/javascript">
			alert("댓글이 입력되었습니다.");
		</script>	
	<%
	}else{
	%>
		<script>
			alert("댓글 입력이 실패하였습니다.");
		</script>
	<%
	}
	response.sendRedirect("adminComDetail.jsp?comm_num="+comm_num);
%>