package mySpec;

import java.sql.*;

public class testMgr {
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "1234";
	
	
	// 관리자 등록
	public void admin() {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into admin values(?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			pstmt.setString(2, "admin");
			pstmt.executeUpdate();
			System.out.println("관리자 등록 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 개인회원 16명 등록
	public void personUser() {
		String id[] = {"p100", "p101", "p102", "p103", "p104", "p105", "p106", "p107", "p108", "p109", "p110", "p111", "p112", "p113", "p114", "p115"};
		String pwd = "1234";
		String nickname[] = {"닉네임1", "닉네임2", "닉네임3", "닉네임4", "닉네임5", "닉네임6", "닉네임7", "닉네임8", "닉네임9", "닉네임10", "닉네임11", "닉네임12", "닉네임13","닉네임14", "닉네임15", "닉네임16"};
		String birth[] = {"1990-10-30", "1990-09-30", "1988-08-13", "1995-09-10", "2001-03-04", "2004-04-05", "2001-05-05", "1994-04-07", "2000-10-10", "1999-09-09", "1998-06-10", "1986-10-11", "1991-01-02", "2001-03-15", "2002-06-06", "1999-09-29"};
		String email[] = {"whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com"};
		String phone[] = {"010-0000-0000", "016-0000-0000", "017-0000-0000", "018-0000-0000",
						  "019-0000-0000", "010-1111-1111", "016-1111-1111", "017-1111-1111",
						  "018-1111-1111", "019-1111-1111", "010-2222-2222", "016-2222-2222",
						  "017-2222-2222", "018-2222-2222", "019-2222-2222", "010-3333-3333"};
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into person_user values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			for(int i = 0; i < id.length; i++) {
				pstmt.setString(1, id[i]);
				pstmt.setString(2, pwd);
				pstmt.setString(3, nickname[i]);
				pstmt.setString(4, birth[i]);
				pstmt.setString(5, email[i]);
				pstmt.setString(6, phone[i]);
				pstmt.executeUpdate();
			}
			System.out.println("개인회원 16명 입력 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 단체회원 등록
	public void orgUser() {
		String id[] = {"o100", "0101", "o102", "o103", "o104", "o105", "o106", "0107", "o108", "o109", "o110", "o111", "o112", "o113", "o114", "o115"};
		String pwd = "1234";
		String orgName[] = {"삼성전자", "LG전자", "마미다", "넥슨",
				            "서울특별시", "대한민국청소년의회", "닥터자르트", "한국인터넷소통협회",
				            "부산광역시", "샤플", "디노마드", "스마트도시협회",
				            "오리고", "아이콘스", "(주)오픈놀", "XR Campus"};
		int org_type[] = {88, 88, 89, 88, 90, 93, 92, 93, 90, 89, 93, 93, 89, 89, 89, 96};
		String manager[] = {"삼성매니저", "LG매니저", "마미다매니저", "넥슨매니저",
							"서울시담당자", "대청의매니저", "닥터자르트매니저", "한인소매니저",
							"부산시담당자", "샤플매니저", "디노마드매니저", "스도협매니저",
							"오리고매니저", "아이콘스매니저", "오픈놀매니저", "XR매니저"};
		String email[] = {"whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com", 
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com",
						  "whrlwhd4934@naver.com"};
		String phone[] = {"010-0000-0000", "016-0000-0000", "017-0000-0000", "018-0000-0000",
						  "019-0000-0000", "010-1111-1111", "016-1111-1111", "017-1111-1111",
						  "018-1111-1111", "019-1111-1111", "010-2222-2222", "016-2222-2222",
						  "017-2222-2222", "018-2222-2222", "019-2222-2222", "010-3333-3333"};
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into org_user values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			for(int i = 0; i < id.length; i++) {
				pstmt.setString(1, id[i]);
				pstmt.setString(2, pwd);
				pstmt.setString(3, orgName[i]);
				pstmt.setInt(4, org_type[i]);
				pstmt.setString(5, manager[i]);
				pstmt.setString(6, email[i]);
				pstmt.setString(7, phone[i]);
				pstmt.executeUpdate();
			}
			System.out.println("단체회원 16명 입력 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 대외활동 등록
	public void Activity() {
		int actType = 1;
		String actThumb[] = {"mamida.jpg"};
		String actTitle[] = {"마미다 서포터즈 14기 모집"};
		String actOrg[] = {"o102"};
		String actStart[] = {"2020-09-14"};
		String actEnd[] = {"2020-09-20"};
		int actPop[] = {10};
		int actReg[] = {43};
		int actField[] = {};
		String actHome[] = {"https://blog.naver.com/nabizamcafe/222088888265"};
		String actContent[] = {};
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			sql = "insert into activity(act_num, act_type, act_thumb, act_title, act_org, act_target, act_start, act_end, act_pop, act_reg, act_field, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	}
	
	public static void main(String[] args) {
		testMgr mgr = new testMgr();
		mgr.admin();
		mgr.personUser();
		mgr.orgUser();
		System.out.println("입력 성공");
	}
}
