<%@page import="java.util.Arrays"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="mySpec.ActivityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//gdg
	ActivityMgr manager = new ActivityMgr();
	int act_type = Integer.parseInt(request.getParameter("act_type"));
	String[] params = null;
	int[] act_field = null;
	int[] interest_num = null;
	int[] reward_num = null;
	int[] act_reg = null;
	String where ="";
	int order = Integer.parseInt(request.getParameter("order"));
	int start = Integer.parseInt(request.getParameter("start"));
	int end = Integer.parseInt(request.getParameter("end"));
	
	if((params = request.getParameterValues("act_field")) != null) {
		act_field = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		where += " (act_field=" + act_field[0];
		for(int i = 1; i < act_field.length; i++) {
			where += " or act_field=" + act_field[i];
		}
		where += ")";
	}
	if((params = request.getParameterValues("interest_num")) != null) {
		interest_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		if(where == "") {
			where += " (interest_num=" + interest_num[0];
		} else {
			where += " and ( interest_num=" + interest_num[0];
		}
		for(int i = 1; i < interest_num.length; i++) {
			where += " or interest_num=" + interest_num[i];
		}
		where += ")";
	}
	if((params = request.getParameterValues("reward_num")) != null) {
		reward_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		if(where == "") {
			where += " (reward_num=" + reward_num[0];
		} else {
			where += " and ( reward_num=" + reward_num[0];
		}
		for(int i = 1; i < reward_num.length; i++) {
			where += " or reward_num=" + reward_num[i];
		}
		where += ")";
	}
	if((params = request.getParameterValues("act_reg")) != null) {
		act_reg = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		if(where == "") {
			where += " (act_reg=" + act_reg[0];
		} else {
			where += " and ( act_reg=" + act_reg[0];
		}
		for(int i = 1; i < act_reg.length; i++) {
			where += " or act_reg=" + act_reg[i];
		}
		where += ")";
	}
	
	ArrayList<ActivityBean> activityList = manager.getActivityList(act_type, where, order, start, end);
	JSONArray arr = new JSONArray(); 
	JSONObject obj = null;
	for(ActivityBean activity : activityList) {
		obj = new JSONObject();
		obj.put("act_num", activity.getAct_num());
		obj.put("act_thumb", activity.getAct_thumb());
		obj.put("act_title", activity.getAct_title());
		obj.put("org_name", activity.getOrg_name());
		obj.put("act_dday", activity.getAct_dday());
		obj.put("act_hits", activity.getAct_hits());
		arr.add(obj);
	}
	obj = new JSONObject();
	obj.put("act_count", manager.getActivityCount(act_type, where));
	arr.add(obj);
	out.print(arr);
%>