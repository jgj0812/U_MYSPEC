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
						+ "(select * from "
						+ "(select * from comm_reply where rep_comm = " + rep_comm + ") "
						+ "start with rep_ref = 0 "
						+ "connect by prior rep_num = rep_ref "
						+ "order siblings by rep_num) r "
						+ "left outer join person_user p "
						+ "on r.rep_person = p.person_id";
		
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
				commB.setRep_ref(rs.getInt("rep_ref"));
				commB.setRep_admin(rs.getString("rep_admin"));
				commB.setRep_nick(rs.getString("person_nick"));
				commB.setRep_step(rs.getInt("rep_step"));
				commB.setRep_level(rs.getInt("rep_level"));
				
				commreply_arr.add(commB);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return commreply_arr;
	}
	

	// 개인회원 댓글 등록
	public int Community_reply_insert (CommunityReplyBean CommR, String id, int comm_num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1; 
		int number = 0;
		
		int rep_num = CommR.getRep_num(); //글번호
		int rep_ref= CommR.getRep_ref();
		int rep_step =CommR.getRep_step();
		int rep_level = CommR.getRep_level();
		
		String sql ="";
		
		try {
			con = pool.getConnection();
			//새댓글: ref= rep_num의 최대값+1, re_step=0, re_level=0
			sql="select max(rep_num) from comm_reply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //최대값 구하기
			
			if(rs.next()) {
				number=0;	
			}
			//ref re_step re_level 결정
			
			if(rep_num!=0) { //대댓글
				sql="update comm_reply set rep_step=rep_step+1 where rep_ref=? and rep_step>?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rep_ref);
				pstmt.setInt(2, rep_step);
				pstmt.executeUpdate();
					
				rep_step =rep_step+1; //부모 re_step+1
				rep_level=rep_level+1;//부모 re_level+1
				
			}else {//새댓글
				rep_ref=number;
				rep_step=0;
				rep_level=0;
			}
			
            											//번호                             글번호 아이디  날짜   내용  rep_ref rep_step rep_level
			sql = "insert into comm_reply (rep_num, rep_comm, rep_person, rep_date, rep_content, rep_ref, rep_step, rep_level)"
		                                       + " values(comm_reply_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, comm_num); //글번호
			pstmt.setString(2, id); //아이디
			
			pstmt.setString(3, CommR.getRep_content()); //내용
			pstmt.setInt(4, rep_ref); //rep_ref
			pstmt.setInt(5, rep_step); //rep_step
			pstmt.setInt(6, rep_level); //rep_level

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
	public void Community_reply_delete (int rep_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "delete from comm_reply where rep_num = ?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rep_num);
			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
	
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
		
		String sql = "SELECT COUNT(rep_comm) FROM comm_reply where rep_comm =" + rep_comm;

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
	public int insertAdminReply(CommunityReplyBean bean, String id, int comm_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		int number = 0;
		int rep_num = bean.getRep_num();	// 글번호
		int rep_ref = bean.getRep_ref();
		int rep_step = bean.getRep_step();
		int rep_level = bean.getRep_level();

		try {
			con = pool.getConnection();
			// 새댓글: ref= rep_num의 최대값 + 1, rep_step = 0, rep_level = 0
			sql = "select max(rep_num) from comm_reply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	// 최대값 구하기
			if(rs.next()) {
				number = 0;
			}
			// ref step level 결정
			
			// 대댓글
			if(rep_num != 0) {
				sql = "update comm_reply set rep_step=rep_step+1 where rep_ref=? and rep_step>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rep_ref);
				pstmt.setInt(2, rep_step);
				pstmt.executeUpdate();
				
				rep_step += 1;
				rep_level += 1;
			}else {
				rep_ref = number;
				rep_step = 0;
				rep_level = 0;
			}
			
			sql = "insert into comm_reply (rep_num, rep_comm, rep_admin, rep_date, rep_content, rep_ref, rep_step, rep_level) " 
							+ "values(comm_reply_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comm_num); //글번호
			pstmt.setString(2, id); //아이디
			pstmt.setString(3, bean.getRep_content()); //내용
			pstmt.setInt(4, rep_ref); 
			pstmt.setInt(5, rep_step); 
			pstmt.setInt(6, rep_level);
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
