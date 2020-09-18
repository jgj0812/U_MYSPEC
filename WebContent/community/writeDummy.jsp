<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mySpec.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DBConnection pool = DBConnection.getInstance();
	Connection con = pool.getConnection();
	String sql = "insert into community(comm_num, comm_type, comm_title, comm_person, comm_date, comm_hits, comm_content) values(community_seq.nextval, 1, '반가워요', 'aaaa', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 0, '방가방가')";
	PreparedStatement pstmt = con.prepareStatement(sql);
	for(int i = 0; i < 500; i++) {
		pstmt.executeUpdate();
	}
	pstmt.close();
	con.close();
	out.print("성공");
%>