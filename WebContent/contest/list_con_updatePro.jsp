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
<!DOCTYPE html>
<%
	String upload = request.getRealPath("upload");
	MultipartRequest multi = new MultipartRequest(request, upload, 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	int act_num = Integer.parseInt(multi.getParameter("act_num"));
	String act_thumb = multi.getFilesystemName("act_thumb");
	String act_post = multi.getFilesystemName("act_post");
	String act_title = multi.getParameter("act_title");
	String act_org = (String) session.getAttribute("id");
	String act_target = multi.getParameter("act_target");
	Date act_start = Date.valueOf(multi.getParameter("act_start"));
	Date act_end = Date.valueOf(multi.getParameter("act_end"));
	int act_field = Integer.parseInt(multi.getParameter("act_field"));
	int	act_award = Integer.parseInt(multi.getParameter("act_award"));
	int[] act_reward = Arrays.stream(multi.getParameterValues("reward_num")).mapToInt(Integer::parseInt).toArray();
	String act_home = multi.getParameter("act_home");
	String act_content = multi.getParameter("act_content");
	
	ActivityBean activity = new ActivityBean();
	activity.setAct_num(act_num);
	activity.setAct_type(2);
	activity.setAct_thumb(act_thumb);
	activity.setAct_post(act_post);
	activity.setAct_title(act_title);
	activity.setAct_target(act_target);
	activity.setAct_start(act_start);
	activity.setAct_end(act_end);
	activity.setAct_field(act_field);
	activity.setAct_award(act_award);
	activity.setAct_reward(act_reward);
	activity.setAct_home(act_home);
	activity.setAct_content(act_content);
	
	ActivityMgr manager = new ActivityMgr();
	manager.updateActivity(activity);
%>