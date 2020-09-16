<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mySpec.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DBConnection pool = DBConnection.getInstance();
	Connection con = pool.getConnection();
	String sql = "insert into community(comm_num, comm_type, comm_title, comm_person, comm_date, comm_hits, comm_content) values(community_seq.nextval, 1, 'ㅂㅇ', 'kim123', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 0, 'gd')";
	PreparedStatement pstmt = con.prepareStatement(sql);
	for(int i = 0; i < 10; i++) {
		pstmt.executeUpdate();
	}
	pstmt.close();
	con.close();
	out.print("성공");
%>