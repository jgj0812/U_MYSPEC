package mySpec;

import java.sql.*;
import java.util.ArrayList;

public class CommunityReplyMgr {
private DBConnection pool;
	
	// DB?占쎄껐
	public CommunityReplyMgr() {
		pool = DBConnection.getInstance();
	}
	
	//湲�由ъ�ㅽ��
	public ArrayList<CommunityReplyBean> Community_reply_list(int rep_comm) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select * from comm_reply where rep_comm = "+ rep_comm;
		
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
				commB.setRep_pos(rs.getInt("rep_pos"));
				commB.setRep_ref(rs.getInt("rep_ref"));
				commB.setRep_depth(rs.getInt("rep_depth"));
				commB.setRep_admin(rs.getString("rep_admin"));
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
	public int Community_reply_insert (CommunityReplyBean Comm, String id, int comm_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1; 
		                                       
		String sql = "insert into comm_reply (rep_num, rep_comm, rep_person, rep_date, rep_content, rep_pos, rep_ref, rep_depth)" 
													// 번호 글번호 아이디  날짜      내용 pos ref depth
		                                       + " values(?, ?, ?, sysdate, ?, ?, ?, ?)";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Comm.getRep_num()); //번호
			pstmt.setInt(2, comm_num); //글번호
			pstmt.setString(3, id); //아이디
			pstmt.setString(4, Comm.getRep_content()); //내용
			pstmt.setInt(5, Comm.getRep_pos()); //pos
			pstmt.setInt(6, Comm.getRep_ref()); //ref
			pstmt.setInt(7, Comm.getRep_depth()); //depth

			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	//湲�����
	public void Community_delete (int comm_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "delete from community where comm_num = ?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comm_num);
			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
	
	}
	
	//湲�����
	public int Community_update (CommunityBean Comm) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "update community set comm_title=?, comm_content=? where comm_num = ?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Comm.getComm_title());
			pstmt.setString(2, Comm.getComm_content());
			pstmt.setInt(3, Comm.getComm_num());
			
			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	
	}
	
	//湲�蹂닿린
	public CommunityBean Community_detailView(int comm_num) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;// 占쏙옙占쏙옙占쏙옙獵占� sql占쏙옙占쏙옙占쏙옙占쏙옙 占십울옙占싹댐옙
		CommunityBean commB = null;
		upHit(comm_num);
		String sql = "select * from community where comm_num= '" + comm_num + "'";

		try {
			
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				commB = new CommunityBean();
				commB.setComm_num(rs.getInt("comm_num"));
				commB.setComm_type(rs.getInt("comm_type"));
				commB.setComm_title(rs.getString("comm_title"));
				commB.setComm_person(rs.getString("comm_person"));
				commB.setComm_date(rs.getString("comm_date"));
				commB.setComm_hits(rs.getInt("comm_hits"));
				commB.setComm_content(rs.getString("comm_content"));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		
		return commB;
	}



	//議고����
	private void upHit(int comm_num) {
			
		Connection con =null;
		PreparedStatement ps =null;
		String sql = null;
			
		try {
			con = pool.getConnection();
			sql="update community set comm_hits = comm_hits+1 where comm_num =?";
			ps = con.prepareStatement(sql);
				
			ps.setInt(1,comm_num);
			ps.executeUpdate();
			
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	} 

	//��紐�, �댁��, ���ㅼ�� 寃���
	public ArrayList<CommunityBean> Community_list_search(int sorting_num , String str) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql="";
		
		//0=��紐�
		if(sorting_num==0) {
			sql = "select * from community WHERE comm_title LIKE '%" + str + "%'";
		}
		//1=�댁��
		else if(sorting_num==1) {
			sql = "select * from community WHERE comm_content LIKE '%" + str + "%'";
		}
		//2=���ㅼ��
		else if(sorting_num==2) {
		} 	sql = "select * from community WHERE comm_person LIKE '%" + str + "%'";
		
		ArrayList<CommunityBean> comm_arr_search = new ArrayList<CommunityBean>();
		
		try {
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				CommunityBean  commB = new CommunityBean();
				commB.setComm_num(rs.getInt("comm_num"));
				commB.setComm_type(rs.getInt("comm_type"));
				commB.setComm_title(rs.getString("comm_title"));
				commB.setComm_person(rs.getString("comm_person"));
				commB.setComm_date(rs.getString("comm_date"));
				commB.setComm_hits(rs.getInt("comm_hits"));
				commB.setComm_content(rs.getString("comm_content"));
				
				comm_arr_search.add(commB);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return comm_arr_search;
	}
	
	// 관리자 댓글 등록
	public int insertAdminReply(CommunityReplyBean bean, String id, int comm_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int re = -1;

		try {
			con = pool.getConnection();
			sql = "insert into comm_reply (rep_num, rep_comm, rep_admin, rep_date, rep_content, rep_pos, rep_ref, rep_depth) " 
							+ "values(?, ?, ?, sysdate, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getRep_num()); //번호
			pstmt.setInt(2, comm_num); //글번호
			pstmt.setString(3, id); //아이디
			pstmt.setString(4, bean.getRep_content()); //내용
			pstmt.setInt(5, bean.getRep_pos()); //pos
			pstmt.setInt(6, bean.getRep_ref()); //ref
			pstmt.setInt(7, bean.getRep_depth()); //depth
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
}
