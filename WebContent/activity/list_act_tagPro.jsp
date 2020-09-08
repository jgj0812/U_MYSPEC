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
	String query="";

	if((params = request.getParameterValues("act_field")) != null) {
		act_field = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		query += "act_field=" + act_field[0];
		for(int i = 1; i < act_field.length; i++) {
			query = "or act_field=" + act_field[i];
		}
	}
	if((params = request.getParameterValues("interest_num")) != null) {
		interest_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		query += "interest_num=" + interest_num[0];
		for(int i = 1; i < act_field.length; i++) {
			query = "or interest_num=" + interest_num[i];
		}
	}
	if((params = request.getParameterValues("reward_num")) != null) {
		reward_num = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		query += "reward_num=" + reward_num[0];
		for(int i = 1; i < act_field.length; i++) {
			query = "or reward_num=" + reward_num[i];
		}
	}
	if((params = request.getParameterValues("act_reg")) != null) {
		act_reg = Arrays.stream(params).mapToInt(Integer::parseInt).toArray();
		query += "act_reg=" + act_reg[0];
		for(int i = 1; i < act_field.length; i++) {
			query = "or act_reg=" + act_reg[i];
		}
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
	if(act_reg != null) {
		for(int tag_num : act_reg) {
			out.println("<button class='choiceButton' onclick='tagRemove(" + tag_num + ")'>" + manager.getTag(tag_num) + "</button>");
		}
	}
	
%>