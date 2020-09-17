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
			alert("스크랩을 제거하였습니다.");
			document.location.href="myPage.jsp";
		</script>
<%
	}else {
%>
		<script>
			alert("스크랩 제거에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>