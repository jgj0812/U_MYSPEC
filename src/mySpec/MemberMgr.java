package mySpec;

import java.sql.*;

public class MemberMgr {
private DBConnection pool;
	
	// DB연결
	public MemberMgr() {
		pool = DBConnection.getInstance();
	}
	
	// 개인회원 가입
	public int insertPersonMember(PersonBean person) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "insert into person_user values(?, ?, ?, ?, ?, ?)";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, person.getId());
			pstmt.setString(2, person.getPwd());
			pstmt.setString(3, person.getNick());
			pstmt.setString(4, person.getBirth());
			pstmt.setString(5, person.getEmail());
			pstmt.setString(6, person.getPhone());
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	// 단체회원 가입
	public int insertOrgMember(OrgBean org) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into org_user values(?, ?, ?, ?, ?, ?, ?)";
		int re = -1;
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, org.getId());
			pstmt.setString(2, org.getPwd());
			pstmt.setString(3, org.getName());
			pstmt.setInt(4, org.getType());
			pstmt.setString(5, org.getManager());
			pstmt.setString(6, org.getEmail());
			pstmt.setString(7, org.getPhone());
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	// 개인회원 id 중복체크
	public String personIdCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from person_user where person_id=?";
		String flag = "yes";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 단체회원 id 중복체크
	public String OrgIdCheck(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from org_user where org_id=?";
		String flag = "yes";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = "no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 개인회원 로그인
	public int personMemberLogin(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		String db_person_pwd;
		String sql = "select person_pwd from person_user where person_id=?";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				db_person_pwd = rs.getString("person_pwd");
				if(db_person_pwd.equals(pwd)) re = 1;
				else re = 0;
			}else {
				re = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return re;
	}
	
	// 단체회원 로그인
	public int orgMemberLogin(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		String db_org_pwd;
		String sql = "select org_pwd from org_user where org_id=?";

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				db_org_pwd = rs.getString("org_pwd");
				if(db_org_pwd.equals(pwd)) re = 1;
				else re = 0;
			}else {
				re = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return re;
	}
	
	// admin 로그인
	public int adminMemberLogin(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select admin_pwd from admin_user where admin_id=?";
		int re = -1;
		String db_admin_pwd;
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				db_admin_pwd = rs.getString("admin_pwd");
				if(db_admin_pwd.equals(pwd)) re = 1;
				else re = 0;
			}else {
				re = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return re;
	}
	
	// 개인회원 id찾기
	public String findPersonId(String email, String birth, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select person_id from person_user where person_email=? and person_birth=? and person_phone=?";
		String id = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, birth);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) id = rs.getString("person_id");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return id;
	}
	
	// pwd찾기
	public String findPwd(int mem, String id, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		if(mem == 0) {
			sql = "select person_pwd from person_user where person_id=? and person_email=?";
		}else if(mem == 1) {
			sql = "select org_pwd from org_user where org_id=? and org_email=?";
		}
		String pwd = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(mem == 0) {
				if(rs.next()) pwd = rs.getString("person_pwd");
			}else if(mem == 1) {
				if(rs.next()) pwd = rs.getString("org_pwd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return pwd;
	}
	
	// 단체회원 id찾기
	public String findOrgId(String email, String name, String manager, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select org_id from org_user where org_email=? and org_name=? and org_manager=? and org_phone=?";
		String id = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, manager);
			pstmt.setString(4, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) id = rs.getString("org_id");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return id;
	}
}
