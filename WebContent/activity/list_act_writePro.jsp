<%@page import="mySpec.ActivityBean"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Date"%>
<%@page import="java.beans.PropertyEditor"%>
<%@page import="java.beans.PropertyEditorManager"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int act_type = Integer.parseInt(request.getParameter("act_type"));
	String act_thumb = request.getParameter("act_thumb");
	String act_post = request.getParameter("act_post");
	String act_title = request.getParameter("act_title");
	String act_org = (String) session.getAttribute("id");
	String act_target = request.getParameter("act_target");
	Date act_start = Date.valueOf(request.getParameter("act_start"));
	Date act_end = Date.valueOf(request.getParameter("act_end"));
	int act_pop = Integer.parseInt(request.getParameter("act_pop"));
	int act_reg = Integer.parseInt(request.getParameter("act_reg"));
	int[] act_interest = Arrays.stream(request.getParameterValues("act_interest")).mapToInt(Integer::parseInt).toArray();
	int act_field = Integer.parseInt(request.getParameter("act_field"));
	int[] act_reward = Arrays.stream(request.getParameterValues("act_reward")).mapToInt(Integer::parseInt).toArray();
	String act_home = request.getParameter("act_home");
	String act_content = request.getParameter("act_content");
	ActivityBean activity = new ActivityBean();
	
	activity.setAct_type(act_type);
	activity.setAct_thumb(act_thumb);
	activity.setAct_post(act_post);
	activity.setAct_title(act_title);
	activity.setAct_org(act_org);
	activity.setAct_target(act_target);
	activity.setAct_start(act_start);
	activity.setAct_end(act_end);
	activity.setAct_pop(act_pop);
	activity.setAct_reg(act_reg);
	activity.setAct_interest(act_interest);
	activity.setAct_field(act_field);
	activity.setAct_reward(act_reward);
	activity.setAct_home(act_home);
	activity.setAct_content(act_content);
	
	ActivityMgr manager = new ActivityMgr();
	manager.insertActivity(activity);
%>