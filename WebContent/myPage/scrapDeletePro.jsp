<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mgr" class="mySpec.ActivityMgr" />
<%
	request.setCharacterEncoding("utf-8");
	int act_num = Integer.parseInt(request.getParameter("act_num"));
	String scrap_person = request.getParameter("scrap_person");
	int re = mgr.scrapDelete(act_num, scrap_person);
	if(re == 1) {
%>
		<script>
			alert("��ũ���� �����Ͽ����ϴ�.");
			document.location.href="myPage.jsp";
		</script>
<%
	}else {
%>
		<script>
			alert("��ũ�� ���ſ� �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
%>