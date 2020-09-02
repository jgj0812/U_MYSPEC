<%@page import="mySpec.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%

	request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>

<%

	request.setCharacterEncoding("UTF-8");

	int re = mgr.Community_insert(bean, id);

	if(re == 1){
		%>
			<script>
				alert("글이 입력되었습니다.");	
			</script>
		<% 
			}else{
		%>
			<script>
				alert("글 입력이 실패하였습니다.");
			</script>
		<%
			}
	
	response.sendRedirect("community.jsp");
%>