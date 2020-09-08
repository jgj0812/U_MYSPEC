<%@page import="java.util.Arrays"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String[] params = null;
	int[] act_field = null;
	int[] interest_num = null;
	int[] reward_num = null;
	int[] act_dday = null;
	int[] act_reg = null;

	if((params = request.getParameterValues("act_field")) != null) {
		act_field = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("interest_num")) != null) {
		interest_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("reward_num")) != null) {
		reward_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("act_dday")) != null) {
		act_dday = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("act_reg")) != null) {
		act_reg = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	
	ActivityMgr manager = new ActivityMgr();
	if(act_field != null) {
		for(int tag_num : act_field) {
			out.println("<button class='choiceButton' onclick='tagRemove(" + tag_num + ")'>" + manager.getTag(tag_num) + "</button>");
		}
	}
	if(interest_num != null) {
		for(int tag_num : interest_num) {
			out.println("<button class='choiceButton' onclick='tagRemove(" + tag_num + ")'>" + manager.getTag(tag_num) + "</button>");
		}
	}
	if(reward_num != null) {
		for(int tag_num : reward_num) {
			out.println("<button class='choiceButton' onclick='tagRemove(" + tag_num + ")'>" + manager.getTag(tag_num) + "</button>");
		}
	}
	if(act_dday != null) {
		for(int tag_num : act_dday) {
			out.println("<button class='choiceButton' onclick='tagRemove(" + tag_num + ")'>" + manager.getTag(tag_num) + "</button>");
		}
	}
	if(act_reg != null) {
		for(int tag_num : act_reg) {
			out.println("<button class='choiceButton' onclick='tagRemove(" + tag_num + ")'>" + manager.getTag(tag_num) + "</button>");
		}
	}
	
	
%>