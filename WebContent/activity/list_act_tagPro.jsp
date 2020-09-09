<%@page import="java.util.Arrays"%>
<%@page import="mySpec.ActivityMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String[] params = null;
	int[] act_field = null;
	int[] interest_num = null;
	int[] reward_num = null;
	int[] act_reg = null;
	ActivityMgr manager = new ActivityMgr();
	
	if((params = request.getParameterValues("act_field")) != null) {
		act_field = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("interest_num")) != null) {
		interest_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("reward_num")) != null) {
		reward_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}
	if((params = request.getParameterValues("act_reg")) != null) {
		act_reg = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
	}

	if(act_field != null) {
		for(int tag_num : act_field) {
			out.println("<input type='button' class='choiceButton' onclick='tagRemove(" + tag_num + ")' value='" + manager.getTag(tag_num) + "'>");
		}
	}
	if(interest_num != null) {
		for(int tag_num : interest_num) {
			out.println("<input type='button' class='choiceButton' onclick='tagRemove(" + tag_num + ")' value='" + manager.getTag(tag_num) + "'>");
		}
	}
	if(reward_num != null) {
		for(int tag_num : reward_num) {
			out.println("<input type='button' class='choiceButton' onclick='tagRemove(" + tag_num + ")' value='" + manager.getTag(tag_num) + "'>");
		}
	}
	if(act_reg != null) {
		for(int tag_num : act_reg) {
			out.println("<input type='button' class='choiceButton' onclick='tagRemove(" + tag_num + ")' value='" + manager.getTag(tag_num) + "'>");
		}
	}
%>