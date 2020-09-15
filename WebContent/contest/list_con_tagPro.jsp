<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Arrays"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String[] params = null;
	int[] act_field = null;
	int[] act_award = null;
	int[] reward_num = null;
	int[] org_type = null;
	ActivityMgr manager = new ActivityMgr();
	
	if((params = request.getParameterValues("act_field")) != null) {
		act_field = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("act_award")) != null) {
		act_award = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("reward_num")) != null) {
		reward_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("org_type")) != null) {
		org_type = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	
	JSONArray arr = new JSONArray();
	
	if(act_field != null) {
		for(int tag_num : act_field) {
			JSONObject obj = new JSONObject();
			obj.put("tag_num", tag_num);
			obj.put("tag", manager.getTag(tag_num));
			arr.add(obj);
		}
	}
	if(act_award != null) {
		for(int tag_num : act_award) {
			JSONObject obj = new JSONObject();
			obj.put("tag_num", tag_num);
			obj.put("tag", manager.getTag(tag_num));
			arr.add(obj);
		}
	}
	if(reward_num != null) {
		for(int tag_num : reward_num) {
			JSONObject obj = new JSONObject();
			obj.put("tag_num", tag_num);
			obj.put("tag", manager.getTag(tag_num));
			arr.add(obj);
		}
	}
	if(org_type != null) {
		for(int tag_num : org_type) {
			JSONObject obj = new JSONObject();
			obj.put("tag_num", tag_num);
			obj.put("tag", manager.getTag(tag_num));
			arr.add(obj);
		}
	}
	
	out.print(arr);
%>