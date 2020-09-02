<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="mySpec.PersonBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mgr" class="mySpec.MemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	int memType = Integer.parseInt(request.getParameter("memType"));
	String id = request.getParameter("id");
	if(memType == 0) {
		mgr.deletePerson(id);	// 삭제
		ArrayList<PersonBean> arrPerson = mgr.listPerson();	// 전체 개인회원 가져오기
		JSONArray jarr = new JSONArray();
		for(PersonBean pb : arrPerson) {
			JSONObject obj = new JSONObject();
			obj.put("id", pb.getId());
			obj.put("nick", pb.getNick());
			obj.put("birth", pb.getBirth());
			obj.put("email", pb.getEmail());
			obj.put("phone", pb.getPhone());
			jarr.add(obj);
		}
		out.println(jarr.toString());
	}
%>