<%@page import="java.util.Arrays"%>
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
	String[] params = null;
	int[] act_field = null;
	int[] act_award = null;
	int[] reward_num = null;
	int[] org_type = null;
	String where ="";
	int order = Integer.parseInt(request.getParameter("order"));
	
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int pageSize = 16;
	int startRow = (pageNum - 1) * pageSize + 1;
	int endRow = pageNum * pageSize;
	
	int count = 0;
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	int pageBlock = 4; // pagePerBlock
	int startPage = (int) ((pageNum - 1) / pageBlock) * pageBlock + 1;
	int endPage = startPage + pageBlock - 1;
	if(endPage > pageCount) {
		endPage = pageCount;
	}
	
	if((params = request.getParameterValues("act_field")) != null) {
		act_field = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		where += " (act_field=" + act_field[0];
		for(int i = 1; i < act_field.length; i++) {
			where += " or act_field=" + act_field[i];
		}
		where += ")";
	}
	if((params = request.getParameterValues("act_award")) != null) {
		act_award = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		if(where == "") {
			where += " (act_award=" + act_award[0];
		} else {
			where += " and ( act_award=" + act_award[0];
		}
		for(int i = 1; i < act_award.length; i++) {
			where += " or act_award=" + act_award[i];
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
	if((params = request.getParameterValues("org_type")) != null) {
		org_type = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		if(where == "") {
			where += " (org_type=" + org_type[0];
		} else {
			where += " and ( org_type=" + org_type[0];
		}
		for(int i = 1; i < org_type.length; i++) {
			where += " or org_type=" + org_type[i];
		}
		where += ")";
	}
	
	count = manager.getActivityCount(act_type, where);
	ArrayList<ActivityBean> activityList = manager.getActivityList(act_type, where, order, startRow, endRow);
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
	obj.put("act_count", count);
	obj.put("act_pageCount", pageCount);
	obj.put("act_startPage", startPage);
	obj.put("act_endPage", endPage);
	arr.add(obj);
	out.print(arr);
%>