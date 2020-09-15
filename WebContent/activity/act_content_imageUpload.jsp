<%@page import="java.net.URLEncoder"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String upload = "C:\\Jsp\\U_MYSPEC\\WebContent\\upload";
	upload = request.getRealPath("upload");
	MultipartRequest multi = new MultipartRequest(request, upload, 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	JSONObject obj = new JSONObject();
	obj.put("url", "http://localhost/U_MYSPEC/upload/" + multi.getFilesystemName("uploadFile"));
	response.setContentType("application/json");
	System.out.println(obj);
	out.print(obj);
%>