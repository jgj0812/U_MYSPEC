package mySpec;

import java.sql.*;
import java.util.ArrayList;

public class CommunityReplyMgr {
private DBConnection pool;
	
	// DB 연결
	public CommunityReplyMgr() {
		pool = DBConnection.getInstance();
	}
	

	//댓글 리스트
	public ArrayList<CommunityReplyBean> Community_reply_list(int rep_comm) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select r.*, p.person_nick from "
						+ "comm_reply r left outer join person_user p "
						+ "on r.rep_person = p.person_id "
						+ "where rep_parent = 0 and rep_comm = "+ rep_comm 
						+ "order by rep_date";
		ArrayList<CommunityReplyBean> commreply_arr = new ArrayList<CommunityReplyBean>();
		
		try {
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				CommunityReplyBean  commB = new CommunityReplyBean();
				commB.setRep_num(rs.getInt("rep_num"));
				commB.setRep_comm(rs.getInt("rep_comm"));
				commB.setRep_person(rs.getString("rep_person"));
				commB.setRep_content(rs.getString("rep_content"));
				commB.setRep_date(rs.getString("rep_date"));
				commB.setRep_parent(rs.getInt("rep_parent"));
				commB.setRep_admin(rs.getString("rep_admin"));
				commB.setRep_nick(rs.getString("person_nick"));
				
				commreply_arr.add(commB);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return commreply_arr;
	}
	
	//답글 리스트
	public ArrayList<CommunityReplyBean> Community_rereply_list(int rep_comm, int rep_parent) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select r.*, p.person_nick from "
						+ "comm_reply r left outer join person_user p "
						+ "on r.rep_person = p.person_id "
						+ "where rep_parent =" + rep_parent  + "and rep_comm = "+ rep_comm
						+ "order by rep_date";
		
		ArrayList<CommunityReplyBean> commrereply_arr = new ArrayList<CommunityReplyBean>();
		
		try {
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				CommunityReplyBean  commB = new CommunityReplyBean();
				commB.setRep_num(rs.getInt("rep_num"));
				commB.setRep_comm(rs.getInt("rep_comm"));
				commB.setRep_person(rs.getString("rep_person"));
				commB.setRep_content(rs.getString("rep_content"));
				commB.setRep_date(rs.getString("rep_date"));
				commB.setRep_parent(rs.getInt("rep_parent"));
				commB.setRep_admin(rs.getString("rep_admin"));
				commB.setRep_nick(rs.getString("person_nick"));
				
				commrereply_arr.add(commB);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return commrereply_arr;
	}
	

	// 개인회원 댓글 등록
	public int Community_reply_insert (CommunityReplyBean CommR, String id, int comm_num, int rep_parent) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1; 	
		String sql="";
		
		try {        				
			//댓글
			con = pool.getConnection();
			
			sql = "insert into comm_reply "
					+ "(rep_num, rep_comm, rep_person,  rep_date, rep_content, rep_parent)"
					+ " values(comm_reply_seq.nextval, ?, ?, sysdate,  ?, ?)";
		
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, comm_num); //글번호
			pstmt.setString(2, id); //아이디
			pstmt.setString(3, CommR.getRep_content()); //내용
			pstmt.setInt(4, rep_parent); //rep_parent

			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return re;
	}
	
	//댓글 삭제
	public int Community_reply_delete (int rep_num, int rep_parent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		
		String sql = "delete from comm_reply where rep_num = ?";
		
		try {
			con = pool.getConnection();
			if(rep_parent == 0) {
				//부모댓글 삭제
				sql="delete from comm_reply where rep_num=? or rep_parent = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rep_num);
				pstmt.setInt(2, rep_num);
				pstmt.executeUpdate();
				
			}else {
				sql="delete from comm_reply where rep_num=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rep_num);
				pstmt.executeUpdate();
				
			}
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	//湲�����
	public int Community_reply_update (CommunityReplyBean CommRB) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "update comm_reply set rep_content=? where rep_num = ?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, CommRB.getRep_content());
			pstmt.setInt(2, CommRB.getRep_num());
			
			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	
	}
	
	//댓글갯수
	public int Community_reply_count (int rep_comm){
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM comm_reply where rep_comm =" + rep_comm;

		try {
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st , rs);
		}
		
		return count;
	}

	//답글갯수
	public int Community_rereply_count (int rep_comm, int rep_parent){
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM comm_reply where rep_parent = " + rep_parent + "and rep_comm =" + rep_comm;
		
			try {
				con = pool.getConnection();
				st = con.prepareStatement(sql);
				rs = st.executeQuery(sql);
				
				while (rs.next()) {
					count=rs.getInt(1);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				pool.closeConnection(con, st , rs);
			}
			
			return count;
		}

	// 관리자 댓글 등록
	public int insertAdminReply (CommunityReplyBean bean, String id, int comm_num, int rep_parent) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1; 	
		String sql="";
		
		try {        				
			//댓글
			con = pool.getConnection();
			
			sql = "insert into comm_reply "
							+ "(rep_num, rep_comm, rep_admin,  rep_date, rep_content, rep_parent)"
							+ " values(comm_reply_seq.nextval, ?, ?, sysdate,  ?, ?)";
		
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, comm_num); //글번호
			pstmt.setString(2, id); //아이디
			pstmt.setString(3, bean.getRep_content()); //내용
			pstmt.setInt(4, rep_parent); //rep_parent

			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return re;
	}
		
	
}
