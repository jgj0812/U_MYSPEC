<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="mySpec.ActivityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ActivityMgr manager = new ActivityMgr();
	int act_type = Integer.parseInt(request.getParameter("act_type"));
	ArrayList<ActivityBean> activityList = manager.getActivityList(act_type);
	JSONArray arr = new JSONArray(); 
	for(ActivityBean activity : activityList) {
		JSONObject obj = new JSONObject();
		obj.put("act_num", activity.getAct_num());
		obj.put("act_thumb", activity.getAct_thumb());
		obj.put("act_title", activity.getAct_title());
		obj.put("org_name", activity.getOrg_name());
		obj.put("act_dday", activity.getAct_dday());
		obj.put("act_hits", activity.getAct_hits());
		arr.add(obj);
	}
	out.print(arr);
%>