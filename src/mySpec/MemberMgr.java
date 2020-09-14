package mySpec;

import java.sql.*;
import java.util.ArrayList;

import jdk.nashorn.internal.ir.SetSplitState;

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
		String sql = "select admin_pwd from admin where admin_id=?";
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
	
	// 개인회원 리스트(admin)
	public ArrayList<PersonBean> listPerson(int startRow, int endRow, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PersonBean> arrPerson = new ArrayList<PersonBean>();
		String sql = null; 
		
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select * from person_user) aa)"
						+ " where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				// 검색인 경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select * from person_user where " + keyField + " like ?) aa)"
						+ " where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PersonBean person = new PersonBean();
				person.setId(rs.getString("person_id"));
				person.setNick(rs.getString("person_nick"));
				person.setBirth(rs.getString("person_birth"));
				person.setEmail(rs.getString("person_email"));
				person.setPhone(rs.getString("person_phone"));
				
				arrPerson.add(person);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return arrPerson;
	}
	
	// 개인회원 수
	public int personCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null; 
		int count = 0;

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select count(*) from person_user";
				pstmt = con.prepareStatement(sql);
			}else {
				// 검색인 경우
				sql = "select count(*) from person_user where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	// 개인회원 탈퇴, 삭제
	public int deletePerson(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from person_user where person_id=?";
		int re = -1;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	// 단체회원 탈퇴, 삭제
		public int deleteOrg(String id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = "delete from org_user where org_id=?";
			int re = -1;

			try {
				con = pool.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				re = 1;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.closeConnection(con, pstmt);
			}
			return re;
		}
	
	// 단체회원 리스트(admin)
	public ArrayList<OrgBean> listOrg(int startRow, int endRow, String keyField, String keyWord) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<OrgBean> arrOrg = new ArrayList<OrgBean>();
		String sql; 
		
		
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select * from org_user) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				// 검색인 경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select * from org_user where " + keyField + " like ?) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrgBean org = new OrgBean();
				org.setId(rs.getString("org_id"));
				org.setName(rs.getString("org_name"));
				org.setType(rs.getInt("org_type"));
				org.setManager(rs.getString("org_manager"));
				org.setEmail(rs.getString("org_email"));
				org.setPhone(rs.getString("org_phone"));
				
				arrOrg.add(org);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		
		return arrOrg;
	}
	
//	MyPage 정보 보기(개인)
	public PersonBean infoPerson(String id) {
		Connection con  = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PersonBean person = null;
		String sql = "select * from person_user where person_id=?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				person = new PersonBean();
				person.setId(rs.getString("person_id"));
				person.setNick(rs.getString("person_nick"));
				person.setBirth(rs.getString("person_birth"));
				person.setEmail(rs.getString("person_email"));
				person.setPhone(rs.getString("person_phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return person;
	}
	
//	MyPage 정보 보기(단체)
	public OrgBean infoOrg(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrgBean org = null;
		String sql = "select * from org_user where org_id=?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				org = new OrgBean();
				org.setId(rs.getString("org_id"));
				org.setName(rs.getString("org_name"));
				org.setType(rs.getInt("org_type"));
				org.setManager(rs.getString("org_manager"));
				org.setEmail(rs.getString("org_email"));
				org.setPhone(rs.getString("org_phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return org;
	}
	
//	MyPage (단체) 활동 보기
	public ActivityBean actlist_Org(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ActivityBean alorg = null;
		String sql = "select * from activity where act_num=?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				alorg = new ActivityBean();
				
				alorg.setAct_num(rs.getInt("act_num"));
				alorg.setAct_type(rs.getInt("act_type"));
				alorg.setAct_title(rs.getString("act_title"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return alorg;
	}
	
	
//	MyPage 수정(개인)
	public int updatePerson(PersonBean pup, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int flag = 0;
		
		try {
			con = pool.getConnection();
			sql = "select person_pwd from person_user where person_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pup.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("person_pwd").equals(pwd)) { 
					sql = "update person_user set person_nick=?, person_phone=?, "
							+ " person_email=?, person_pwd=? where person_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, pup.getNick());
						pstmt.setString(2, pup.getPhone());
						pstmt.setString(3, pup.getEmail());
						pstmt.setString(4, pup.getPwd());
						pstmt.setString(5, pup.getId());
						flag = pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}

		return flag;
		
	}
	
//	MyPage 수정(단체)
	public int updateOrg(OrgBean oup, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int flag = 0;
		
		try {
			con = pool.getConnection();
			sql = "select org_pwd from org_user where org_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, oup.getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("org_pwd").equals(pwd)) { 
					sql = "update org_user set org_manager=?, org_phone=?, "
							+ " org_email=?, org_pwd=? where org_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, oup.getManager());
						pstmt.setString(2, oup.getPhone());
						pstmt.setString(3, oup.getEmail());
						pstmt.setString(4, oup.getPwd());
						pstmt.setString(5, oup.getId());
						flag = pstmt.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 단체회원 수
		public int orgCount(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			int count = 0;

			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("") || keyWord == null) {
					sql = "select count(*) from org_user";
					pstmt = con.prepareStatement(sql);
				}else {
					sql = "select count(*) from org_user where " + keyField + " like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + keyWord + "%");
				}
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.closeConnection(con, pstmt, rs);
			}
			return count;
		}
}