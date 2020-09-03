<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mySpec.*"%>

<% request.setCharacterEncoding("UTF-8"); %>
	
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>

<%
	int re = mgr.Community_update(bean);
	
	if(re == 1){
		%>
			<script>
				alert("글이 수정되었습니다.");	
			</script>
		<% 
			}else{
		%>
			<script>
				alert("글 수정이 실패하였습니다.");
			</script>
		<%
			}
	
		response.sendRedirect("community.jsp");

%>
    