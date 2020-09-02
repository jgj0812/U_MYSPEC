package mySpec;

import java.sql.*;
import java.util.ArrayList;

public class CommunityMgr {
private DBConnection pool;
	
	// DB?�결
	public CommunityMgr() {
		pool = DBConnection.getInstance();
	}
	
	//글리스트
	public ArrayList<CommunityBean> Community_list() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select * from community";
		
		ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>();
		
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
				
				comm_arr.add(commB);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return comm_arr;
	}
	
	//글쓰기
	public int Community_insert (CommunityBean Comm) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "insert into community values(community_seq.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 0, ?)";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Comm.getComm_type());
			pstmt.setString(2, Comm.getComm_title());
			pstmt.setString(3, Comm.getComm_person());
			pstmt.setString(4, Comm.getComm_content());
			
			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	//글삭제
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
	
	//글수정
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
	
	//글보기
	public CommunityBean Community_detailView(int comm_num) {
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;// ������ִ� sql�������� �ʿ��ϴ�
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



	//조회수
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

	//제목, 내용, 닉네임 검색
	
	public ArrayList<CommunityBean> Community_list_search(int sorting_num , String str) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String sql="";
		
		//0=제목
		if(sorting_num==0) {
			sql = "select * from community WHERE comm_title LIKE '%" + str + "%'";
		}
		//1=내용
		else if(sorting_num==1) {
			sql = "select * from community WHERE comm_content LIKE '%" + str + "%'";
		}
		//2=닉네임
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
}
