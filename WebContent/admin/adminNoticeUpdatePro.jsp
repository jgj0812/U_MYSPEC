<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
	
<jsp:useBean id="mgr" class="mySpec.CommunityMgr" />
<jsp:useBean id="bean" class="mySpec.CommunityBean" />

<jsp:setProperty property="*" name="bean"/>

<%
	int re = mgr.Community_update(bean);
	
	if(re == 1){
		%>
			<script>
				alert("���� �����Ǿ����ϴ�.");	
			</script>
		<% 
			}else{
		%>
			<script>
				alert("�� ������ �����Ͽ����ϴ�.");
			</script>
		<%
			}
		response.sendRedirect("adminNotice.jsp");
%>