package mySpec;

import java.sql.*;
import java.util.ArrayList;

public class CommunityMgr {
private DBConnection pool;
	
	// DB?占쎄껐
	public CommunityMgr() {
		pool = DBConnection.getInstance();
	}
	
	//湲�由ъ�ㅽ��
	public ArrayList<CommunityBean> Community_list(int startRow, int endRow, String keyField , String keyWord) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<CommunityBean> comm_arr = new ArrayList<CommunityBean>();
		
		String sql = "";	
		
		try {
			con = pool.getConnection();
			
			if(keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select c.*, p.person_nick from "
						+ "community c left outer join person_user p "
						+ "on c.comm_person = p.person_id "
						+ "order by comm_num desc) aa)"
						+ " where rn between ? and ? ";
				ps = con.prepareStatement(sql);
				ps.setInt(1, startRow);
				ps.setInt(2, endRow);
			}else {
				
				// 검색인 경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select c.*, p.person_nick from "
						+ "community c left outer join person_user p "
						+ "on c.comm_person = p.person_id "
						+ "where " + keyField + " like ? order by comm_num desc) aa)"
						+ " where rn between ? and ? ";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%" + keyWord + "%");
				ps.setInt(2, startRow);
				ps.setInt(3, endRow);
			}
				
			rs = ps.executeQuery();
			
			while (rs.next()) {
				CommunityBean commB = new CommunityBean();
				commB.setComm_num(rs.getInt("comm_num"));
				commB.setComm_type(rs.getInt("comm_type"));
				commB.setComm_title(rs.getString("comm_title"));
				commB.setComm_person(rs.getString("comm_person"));
				commB.setComm_date(rs.getString("comm_date"));
				commB.setComm_hits(rs.getInt("comm_hits"));
				commB.setComm_content(rs.getString("comm_content"));
				commB.setComm_nick(rs.getString("person_nick"));
				commB.setComm_admin(rs.getString("comm_admin"));
				comm_arr.add(commB);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, ps, rs);
		}
		return comm_arr;
	}
	
		public int community_Count(String keyField, String keyWord) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null; 
			int count = 0;

			try {
				con = pool.getConnection();
				if(keyWord.trim().equals("") || keyWord == null) {
					// 검색이 아닌경우
					sql = "select count(*) from community";
					pstmt = con.prepareStatement(sql);
				}else {
					// 검색인 경우
					sql = "select count(*) from community where " + keyField + " like ?";
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
	
	
	//湲��곌린
	public int Community_insert (CommunityBean Comm, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1; 
		                                           
		String sql = "insert into community(comm_num, comm_type, comm_title, comm_person, comm_date, comm_hits, comm_content)"
									//글번호       글타입 제목 아이디                  날짜   조회수 내용
						+ " values(community_seq.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 0, ?)";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Comm.getComm_type());
			pstmt.setString(2, Comm.getComm_title());
			pstmt.setString(3, id);
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
		String sql = "select c.*, p.person_nick from "
					+ "community c left outer join person_user p "
					+ "on c.comm_person = p.person_id "
					+ "where comm_num= '" + comm_num + "'";

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
				commB.setComm_admin(rs.getString("comm_admin"));
				commB.setComm_nick(rs.getString("person_nick"));
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
	
	// 공지글 작성
	public int insertNotice(CommunityBean bean, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into community (comm_num, comm_type, comm_title, comm_admin, comm_date, comm_hits, comm_content) "
						+ "values(community_seq.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 0, ?)";
		int re = -1;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getComm_type());
			pstmt.setString(2, bean.getComm_title());
			pstmt.setString(3, id);
			pstmt.setString(4, bean.getComm_content());
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	// 공지글 list 조회 (admin)
	public ArrayList<CommunityBean> noticeList(int startRow, int endRow, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommunityBean> notice_arr = new ArrayList<CommunityBean>();
		String sql = ""; 
		
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select * from community where comm_type='0' order by comm_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				// 검색인 경우
				sql = "select * from " 
						+ "(select rownum rn, aa.* from "
						+ "(select * from community where comm_type='0' and " + keyField + " like ? order by comm_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityBean bean = new CommunityBean();
				bean.setComm_num(rs.getInt("comm_num"));
				bean.setComm_title(rs.getString("comm_title"));
				bean.setComm_admin(rs.getString("comm_admin"));
				bean.setComm_date(rs.getString("comm_date"));
				bean.setComm_hits(rs.getInt("comm_hits"));
				bean.setComm_content(rs.getString("comm_content"));
				notice_arr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return notice_arr;
	}
	
	// 게시글 수
	public int communityCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				// 검색이 아닌경우
				sql = "select count(*) from community where comm_type='0'";
				pstmt = con.prepareStatement(sql);
			}else {
				// 검색인 경우
				sql = "select count(*) from community where comm_type='0' and " + keyField + " like ?";
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
	
	// 내가 쓴 글 검색(myPage)
	public ArrayList<CommunityBean> myCommunityList(int startRow, int endRow, String keyField, String keyWord, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<CommunityBean> mListArr = new ArrayList<CommunityBean>();

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select c.*, p.person_nick from "
						+ "community c left outer join person_user p "
						+ "on c.comm_person = p.person_id "
						+ "where comm_person=? "
						+ "order by comm_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select c.*, p.person_nick from "
						+ "community c left outer join person_user p "
						+ "on c.comm_person = p.person_id "
						+ "where comm_person=? and "
						+ keyField + " like ? "
						+ "order by comm_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%" + keyWord + "%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityBean bean = new CommunityBean();
				bean.setComm_num(rs.getInt("comm_num"));
				bean.setComm_type(rs.getInt("comm_type"));
				bean.setComm_title(rs.getString("comm_title"));
				bean.setComm_person(rs.getString("comm_person"));
				bean.setComm_date(rs.getString("comm_date"));
				bean.setComm_hits(rs.getInt("comm_hits"));
				bean.setComm_content(rs.getString("comm_content"));
				bean.setComm_admin(rs.getString("comm_admin"));
				bean.setComm_nick(rs.getString("person_nick"));
				mListArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return mListArr;
	}
	
	// 내가 쓴 글 갯수(myPage)
	public int myCommunityListCount(String keyField, String keyWord, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select count(*) from community where comm_person=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			}else {
				sql = "select count(*) from community where comm_person=? and " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%" + keyWord + "%");
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
	
	// 댓글 단 글 검색(myPage)
	public ArrayList<CommunityBean> myCommentList(int startRow, int endRow, String keyField, String keyWord, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<CommunityBean> myComArr = new ArrayList<CommunityBean>();

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select cc.*, p.person_nick from "
						+ "(select distinct c.* from "
						+ "community c left outer join comm_reply r "
						+ "on c.comm_num = r.rep_comm "
						+ "where rep_person=?) cc left outer join person_user p "
						+ "on cc.comm_person = p.person_id "
						+ "order by comm_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}else {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select cc.*, p.person_nick from "
						+ "(select distinct c.*, from "
						+ "community c left outer join comm_reply r "
						+ "on c.comm_num = r.rep_comm "
						+ "where rep_person=? and "+ keyField + "like ?) cc "
						+ "left outer join person_user p "
						+ "on cc.comm_person = p.person_id "
						+ "order by comm_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%" + keyWord + "%");
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityBean bean = new CommunityBean();
				bean.setComm_num(rs.getInt("comm_num"));
				bean.setComm_type(rs.getInt("comm_type"));
				bean.setComm_title(rs.getString("comm_title"));
				bean.setComm_person(rs.getString("comm_person"));
				bean.setComm_date(rs.getString("comm_date"));
				bean.setComm_hits(rs.getInt("comm_hits"));
				bean.setComm_content(rs.getString("comm_content"));
				bean.setComm_admin(rs.getString("comm_admin"));
				bean.setComm_nick(rs.getString("person_nick"));
				myComArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return myComArr;
	}
	
	// 댓글 단 글 수
	public int myCommentCount(String keyField, String keyWord, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select count(distinct c.comm_num) from "
						+ "community c left outer join comm_reply r "
						+ "on c.comm_num = r.rep_comm "
						+ "where rep_person=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			}else {
				sql = "select count(distinct c.comm_num) from "
						+ "community c left outer join comm_reply r "
						+ "on c.comm_num = r.rep_comm "
						+ "where rep_person=? and " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, "%" + keyWord + "%");
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