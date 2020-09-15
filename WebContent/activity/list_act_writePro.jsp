<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="mySpec.ActivityBean"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Date"%>
<%@page import="java.beans.PropertyEditor"%>
<%@page import="java.beans.PropertyEditorManager"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String upload = "C:\\Jsp\\U_MYSPEC\\WebContent\\upload";
	MultipartRequest multi = new MultipartRequest(request, upload, 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	int act_type = Integer.parseInt(multi.getParameter("act_type"));
	String act_thumb = multi.getFilesystemName("act_thumb");
	String act_post = multi.getFilesystemName("act_post");
	String act_title = multi.getParameter("act_title");
	String act_org = (String) session.getAttribute("orgId");
	String act_target = multi.getParameter("act_target");
	Date act_start = Date.valueOf(multi.getParameter("act_start"));
	Date act_end = Date.valueOf(multi.getParameter("act_end"));
	
	int act_pop = -1;
	int act_reg = -1;
	int[] act_interest = null;
	if(act_type == 1) {
		act_pop = Integer.parseInt(multi.getParameter("act_pop"));
		act_reg = Integer.parseInt(multi.getParameter("act_reg"));
		act_interest = Arrays.stream(multi.getParameterValues("act_interest")).mapToInt(Integer::parseInt).toArray(); 
	}
	
	int act_field = Integer.parseInt(multi.getParameter("act_field"));
	
	int act_award = -1;
	if(act_type == 2) {
		act_award = Integer.parseInt(multi.getParameter("act_award"));
	}
	
	int[] act_reward = Arrays.stream(multi.getParameterValues("act_reward")).mapToInt(Integer::parseInt).toArray();
	String act_home = multi.getParameter("act_home");
	String act_content = multi.getParameter("act_content");
	
	ActivityBean activity = new ActivityBean();
	activity.setAct_type(act_type);
	activity.setAct_thumb(act_thumb);
	activity.setAct_post(act_post);
	activity.setAct_title(act_title);
	activity.setAct_org(act_org);
	activity.setAct_target(act_target);
	activity.setAct_start(act_start);
	activity.setAct_end(act_end);
	
	if(act_type == 1) {
		activity.setAct_pop(act_pop);
		activity.setAct_reg(act_reg);
		activity.setAct_interest(act_interest);
	}
	
	activity.setAct_field(act_field);
	
	if(act_type ==2) {
		activity.setAct_award(act_award);
	}
	
	activity.setAct_reward(act_reward);
	activity.setAct_home(act_home);
	activity.setAct_content(act_content);
	
	ActivityMgr manager = new ActivityMgr();
	manager.insertActivity(activity);
	
	switch(act_type) {
	case 1:
		response.sendRedirect("/activity/list_act.jsp");
		break;
	case 2:
		response.sendRedirect("/contest/list_con.jsp");
		break;
	}
%>