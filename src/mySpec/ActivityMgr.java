package mySpec;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class ActivityMgr {
	private DBConnection pool;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private HashMap<Integer, String> tagMap;

	public ActivityMgr() {
		super();
		pool = DBConnection.getInstance();
		try {
			tagMap = (HashMap<Integer, String>) new ObjectInputStream(new FileInputStream("C:\\Jsp\\U_MYSPEC\\tag.map")).readObject();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public ArrayList<ActivityBean> getActivityList(int act_type, String where, int order, int startRow, int endRow) {
		ArrayList<ActivityBean> activityList = null;
		String sql = null;
		switch(order) {
		case 1:
			sql = "select act_num, act_thumb, act_title, org_name, trunc(act_end - sysdate) as act_dday, act_hits from activity, org_user where act_org = org_id and act_type = ? and act_approve = 1";
			if(where.equals("")) {
				sql += " order by act_num desc";
			} else {
				switch(act_type) {
				case 1:
					where = "select act_num from (select act_num, act_field, interest_num, reward_num, act_reg from activity, act_interest, act_reward where act_num = interest_act and act_num = reward_act) where" + where;
					break;
				case 2:
					where = "select act_num from (select act_num, act_field, act_award, reward_num, org_type from activity, act_reward, org_user where act_num = reward_act and act_org = org_id) where" + where;
					break;
				}
				sql = sql + " and act_num in (" + where + ") order by act_num desc";
			}
			break;
		case 2:
			sql = "select act_num, act_thumb, act_title, org_name, trunc(act_end - sysdate) as act_dday, act_hits from activity, org_user where act_org = org_id and act_type = ? and act_approve = 1";
			if(where.equals("")) {
				sql += " order by act_dday, act_num desc";
			} else {
				switch(act_type) {
				case 1:
					where = "select act_num from (select act_num, act_field, interest_num, reward_num, act_reg from activity, act_interest, act_reward where act_num = interest_act and act_num = reward_act) where" + where;
					break;
				case 2:
					where = "select act_num from (select act_num, act_field, act_award, reward_num, org_type from activity, act_reward, org_user where act_num = reward_act and act_org = org_id) where" + where;
					break;
				}
				sql = sql + " and act_num in (" + where + ") order by act_dday, act_num desc";
			}
			break;
		case 3:
			sql = "select act_num, act_thumb, act_title, org_name, trunc(act_end - sysdate) as act_dday, act_hits, nvl(scraps, 0) as scraps from activity, org_user, (select scrap_num, count(scrap_person) as scraps from scrap group by scrap_num) where act_org = org_id and act_type = ? and act_approve = 1 and act_num = scrap_num(+)";
			if(where.equals("")) {
				sql += " order by scraps desc, act_num desc";
			} else {
				switch(act_type) {
				case 1:
					where = "select act_num from (select act_num, act_field, interest_num, reward_num, act_reg from activity, act_interest, act_reward where act_num = interest_act and act_num = reward_act) where" + where;
					break;
				case 2:
					where = "select act_num from (select act_num, act_field, act_award, reward_num, org_type from activity, act_reward, org_user where act_num = reward_act and act_org = org_id) where" + where;
					break;
				}
				sql = sql + " and act_num in (" + where + ") order by scraps desc, act_num desc";
			}
			break;
		case 4:
			sql = "select act_num, act_thumb, act_title, org_name, trunc(act_end - sysdate) as act_dday, act_hits, nvl(reps, 0) as reps from activity, org_user, (select rep_act, count(rep_num) as reps from act_reply group by rep_act) where act_org = org_id and act_type = ? and act_approve = 1 and act_num = rep_act(+)";
			if(where.equals("")) {
				sql += " order by reps desc, act_num desc";
			} else {
				switch(act_type) {
				case 1:
					where = "select act_num from (select act_num, act_field, interest_num, reward_num, act_reg from activity, act_interest, act_reward where act_num = interest_act and act_num = reward_act) where" + where;
					break;
				case 2:
					where = "select act_num from (select act_num, act_field, act_award, reward_num, org_type from activity, act_reward, org_user where act_num = reward_act and act_org = org_id) where" + where;
					break;
				}
				sql = sql + " and act_num in (" + where + ") order by reps desc, act_num desc";
			}
			break;
		}
		sql = "select * from (select rownum as rn, act.* from (" + sql + ")act) where rn between " + startRow + " and " + endRow;
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_type);
			rs = ps.executeQuery();
			activityList = new ArrayList<ActivityBean>();
			while (rs.next()) {
				ActivityBean activity = new ActivityBean();
				activity.setAct_num(rs.getInt("act_num"));
				activity.setAct_thumb(rs.getString("act_thumb"));
				activity.setAct_title(rs.getString("act_title"));
				activity.setOrg_name(rs.getString("org_name"));
				activity.setAct_dday(rs.getInt("act_dday"));
				activity.setAct_hits(rs.getInt("act_hits"));
				activityList.add(activity);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps, rs);
		return activityList;
	}
	
	public int getActivityCount(int act_type, String where) {
		String sql = null;
		int count = 0;
		if(where.equals("")) {
			sql = "select count(act_num) from activity where act_type=? and act_approve=1";
		} else {
			switch(act_type) {
			case 1:
				sql = "select count(distinct act_num) from (select * from activity, act_interest, act_reward where act_type=? and act_approve=1 and act_num = interest_act and act_num = reward_act) where" + where;
				break;
			case 2:
				sql = "select count(distinct act_num) from (select act_num, act_field, act_award, reward_num, org_type from activity, act_reward, org_user where act_type=? and act_approve=1 and act_num = reward_act and act_org=org_id) where" + where;
				break;
			}
		}
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_type);
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps, rs);
		return count;
	}
	
	public void insertActivity(ActivityBean activity) {
		String sql = null;
		try {
			con = pool.getConnection();
			switch(activity.getAct_type()) {
			case 1:
				sql = "insert into activity(act_num, act_type, act_thumb, act_title, act_org, act_target, act_start, act_end, act_pop, act_reg, act_field, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, activity.getAct_type());
				ps.setString(2, activity.getAct_thumb());
				ps.setString(3, activity.getAct_title());
				ps.setString(4, activity.getAct_org());
				ps.setString(5, activity.getAct_target());
				ps.setDate(6, activity.getAct_start());
				ps.setDate(7, activity.getAct_end());
				ps.setInt(8, activity.getAct_pop());
				ps.setInt(9, activity.getAct_reg());
				ps.setInt(10, activity.getAct_field());
				ps.setString(11, activity.getAct_home());
				ps.setString(12, activity.getAct_content());
				ps.executeUpdate();
				
				sql = "insert into act_interest values(act_seq.currval, ?)";
				for(int act_interest : activity.getAct_interest()) {
					ps = con.prepareStatement(sql);
					ps.setInt(1, act_interest);
					ps.executeUpdate();
				}
				break;
			case 2:
				sql = "insert into activity(act_num, act_type, act_thumb, act_title, act_org, act_target, act_start, act_end, act_field, act_award, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				ps = con.prepareStatement(sql);
				ps.setInt(1, activity.getAct_type());
				ps.setString(2, activity.getAct_thumb());
				ps.setString(3, activity.getAct_title());
				ps.setString(4, activity.getAct_org());
				ps.setString(5, activity.getAct_target());
				ps.setDate(6, activity.getAct_start());
				ps.setDate(7, activity.getAct_end());
				ps.setInt(8, activity.getAct_field());
				ps.setInt(9, activity.getAct_award());
				ps.setString(10, activity.getAct_home());
				ps.setString(11, activity.getAct_content());
				ps.executeUpdate();
				break;
			}

			sql = "insert into act_reward values(act_seq.currval, ?)";
			for(int act_reward : activity.getAct_reward()) {
				ps = con.prepareStatement(sql);
				ps.setInt(1, act_reward);
				ps.executeUpdate();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps);
	}
	
	public ActivityBean getActivity(int act_num) {
		String sql;
		ActivityBean activity = new ActivityBean();
		upHit(act_num);
		try {
			sql = "select act_type, act_thumb, act_title, act_hits, act_target, act_start, act_end, trunc(act_end - sysdate) as act_dday, act_pop, act_reg, act_field, act_home, act_content, act_award, act_approve from activity where act_num = ? ";
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			rs.next();
			activity.setAct_type(rs.getInt("act_type"));
			activity.setAct_thumb(rs.getString("act_thumb"));
			activity.setAct_title(rs.getString("act_title"));
			activity.setAct_hits(rs.getInt("act_hits"));
			activity.setAct_target(rs.getString("act_target"));
			activity.setAct_start(rs.getDate("act_start"));
			activity.setAct_end(rs.getDate("act_end"));
			activity.setAct_dday(rs.getInt("act_dday"));
			activity.setAct_field(rs.getInt("act_field"));
			activity.setAct_home(rs.getString("act_home"));
			activity.setAct_content(rs.getString("act_content"));
			activity.setAct_approve(rs.getInt("act_approve"));
			switch(activity.getAct_type()) {
			case 1:
				activity.setAct_pop(rs.getInt("act_pop"));
				activity.setAct_reg(rs.getInt("act_reg"));
				break;
			case 2:
				activity.setAct_award(rs.getInt("act_award"));
				break;
			}
			
			sql = "select reward_num from act_reward where reward_act=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			ArrayList<Integer> reward_num = new ArrayList<Integer>();
			while(rs.next()) {
				reward_num.add(rs.getInt("reward_num"));
			}
			activity.setAct_reward(reward_num.stream().mapToInt(i->i).toArray());
			
			sql = "select interest_num from act_interest where interest_act=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			ArrayList<Integer> interest_num = new ArrayList<Integer>();
			while(rs.next()) {
				interest_num.add(rs.getInt("interest_num"));
			}
			activity.setAct_interest(interest_num.stream().mapToInt(i->i).toArray());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps, rs);
		return activity;
	}
	
	public OrgBean getOrg(int act_num) {
		String sql = "select org_name, org_type, org_manager, org_email, org_phone from activity, org_user where act_org = org_id and act_num=?";
		OrgBean org = new OrgBean();
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			rs.next();
			org.setName(rs.getString("org_name"));
			org.setType(rs.getInt("org_type"));
			org.setManager(rs.getString("org_manager"));
			org.setEmail(rs.getString("org_email"));
			org.setPhone(rs.getString("org_phone"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps, rs);
		return org;
	}
	
	public String getTag(int num) {
		return tagMap.get(num);
	}
	
	public void upHit(int act_num) {
		String sql = "update activity set act_hits=(select act_hits from activity where act_num=?) + 1 where act_num=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			ps.setInt(2, act_num);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps);
	}
	
	public int act_scrap(String person_id, int act_num) {
		String sql = "select count(*) from scrap where scrap_person=? and scrap_num=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, person_id);
			ps.setInt(2, act_num);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if(count == 1) {
				return 0;
			}
			sql = "insert into scrap(scrap_person, scrap_num) values(?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, person_id);
			ps.setInt(2, act_num);
			ps.executeUpdate();
			pool.closeConnection(con, ps, rs);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps, rs);
		return -1;
	}
  
	public void updateActivity(ActivityBean activity) {
		String sql = null;
		try {
			con = pool.getConnection();
			switch(activity.getAct_type()) {
			case 1:
				if(activity.getAct_thumb() == null) {
					sql = "update activity set act_title=?, act_target=?, act_start=?, act_end=?, act_pop=?, act_reg=?, act_field=?, act_home=?, act_content=? where act_num=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, activity.getAct_title());
					ps.setString(2, activity.getAct_target());
					ps.setDate(3, activity.getAct_start());
					ps.setDate(4, activity.getAct_end());
					ps.setInt(5, activity.getAct_pop());
					ps.setInt(6, activity.getAct_reg());
					ps.setInt(7, activity.getAct_field());
					ps.setString(8, activity.getAct_home());
					ps.setString(9, activity.getAct_content());
					ps.setInt(10, activity.getAct_num());
				} else {
					sql = "update activity set act_thumb=?, act_title=?, act_target=?, act_start=?, act_end=?, act_pop=?, act_reg=?, act_field=?, act_home=?, act_content=? where act_num=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, activity.getAct_thumb());
					ps.setString(2, activity.getAct_title());
					ps.setString(3, activity.getAct_target());
					ps.setDate(4, activity.getAct_start());
					ps.setDate(5, activity.getAct_end());
					ps.setInt(6, activity.getAct_pop());
					ps.setInt(7, activity.getAct_reg());
					ps.setInt(8, activity.getAct_field());
					ps.setString(9, activity.getAct_home());
					ps.setString(10, activity.getAct_content());
					ps.setInt(11, activity.getAct_num());
				}
				ps.executeUpdate();
				
				sql = "delete from act_interest where interest_act=?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, activity.getAct_num());
				ps.executeUpdate();
				
				sql = "insert into act_interest values(?, ?)";
				for(int act_interest : activity.getAct_interest()) {
					ps = con.prepareStatement(sql);
					ps.setInt(1, activity.getAct_num());
					ps.setInt(2, act_interest);
					ps.executeUpdate();
				}
				break;
			case 2:
				if(activity.getAct_thumb() == null) {
					sql = "update activity set act_title=?, act_target=?, act_start=?, act_end=?, act_field=?, act_award=?, act_home=?, act_content=? where act_num=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, activity.getAct_title());
					ps.setString(2, activity.getAct_target());
					ps.setDate(3, activity.getAct_start());
					ps.setDate(4, activity.getAct_end());
					ps.setInt(5, activity.getAct_field());
					ps.setInt(6, activity.getAct_award());
					ps.setString(7, activity.getAct_home());
					ps.setString(8, activity.getAct_content());
					ps.setInt(9, activity.getAct_num());
				} else {
					sql = "update activity set act_thumb=?, act_title=?, act_target=?, act_start=?, act_end=?, act_field=?, act_award=?, act_home=?, act_content=? where act_num=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, activity.getAct_thumb());
					ps.setString(2, activity.getAct_title());
					ps.setString(3, activity.getAct_target());
					ps.setDate(4, activity.getAct_start());
					ps.setDate(5, activity.getAct_end());
					ps.setInt(6, activity.getAct_field());
					ps.setInt(7, activity.getAct_award());
					ps.setString(8, activity.getAct_home());
					ps.setString(9, activity.getAct_content());
					ps.setInt(10, activity.getAct_num());
				} 
				ps.executeUpdate();
				break;
			}
			
			sql = "delete from act_reward where reward_act=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, activity.getAct_num());
			ps.executeUpdate();

			sql = "insert into act_reward values(?, ?)";
			for(int act_reward : activity.getAct_reward()) {
				ps = con.prepareStatement(sql);
				ps.setInt(1, activity.getAct_num());
				ps.setInt(2, act_reward);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps);
	}

	// ���� 寃���
	public ArrayList<ActivityBean> searchActivity(int startRow, int endRow, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name from "
						+ "(select * from activity where " + keyField + " like ? "
						+ "and act_approve=1) a "
						+ "left outer join org_user o "
						+ "on a.act_org = o.org_id) aa) "
						+ "where rn between ? and ? "
						+ "order by act_num desc";
		ArrayList<ActivityBean> actArr = new ArrayList<ActivityBean>();
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyWord + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_type(rs.getInt("act_type"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setAct_hits(rs.getInt("act_hits"));
				bean.setAct_org(rs.getString("act_org"));
				bean.setAct_end(rs.getDate("act_end"));
				bean.setOrg_name(rs.getString("org_name"));
				actArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return actArr;
	}
	
	// 寃����� ���� ��
	public int searchActivityCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from activity where " + keyField + " like ? and act_approve=1";
		int count = 0;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyWord + "%");
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

//---------- 댓글
	
	//댓글 리스트
	public ArrayList<ActivityReplyBean> act_reply_list(int rep_act) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select ar.*, o.org_name from "	
						+ "(select r.*, p.person_nick from "
						+ "act_reply r left outer join person_user p "
						+ "on r.rep_person = p.person_id "
						+ "where rep_parent = 0 and rep_act = "+ rep_act + ") ar "
						+ "left outer join org_user o "
						+ "on ar.rep_org = o.org_id "
						+ " order by rep_date";
		
		ArrayList<ActivityReplyBean> actreply_arr = new ArrayList<ActivityReplyBean>();
		
		try {
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				ActivityReplyBean  actB = new ActivityReplyBean();
				actB.setRep_num(rs.getInt("rep_num"));
				actB.setRep_act(rs.getInt("rep_act"));
				actB.setRep_person(rs.getString("rep_person"));
				actB.setRep_content(rs.getString("rep_content"));
				actB.setRep_date(rs.getString("rep_date"));
				actB.setRep_nick(rs.getString("person_nick"));
				actB.setRep_parent(rs.getInt("rep_parent"));
				actB.setRep_org(rs.getString("rep_org"));
				actB.setRep_orgName(rs.getString("org_name"));
				
				actreply_arr.add(actB);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return actreply_arr;
	}
	
	//답글 리스트
	public ArrayList<ActivityReplyBean> act_rereply_list(int rep_act, int rep_parent) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select ar.*, o.org_name from "	
						+ "(select r.*, p.person_nick from "
						+ "act_reply r left outer join person_user p "
						+ "on r.rep_person = p.person_id "
						+ "where rep_parent =" + rep_parent +" and rep_act = "+ rep_act + ") ar "
						+ "left outer join org_user o "
						+ "on ar.rep_org = o.org_id "
						+ " order by rep_date";
		
		ArrayList<ActivityReplyBean> actreply_arr = new ArrayList<ActivityReplyBean>();
		
		try {
			con = pool.getConnection();
			st = con.prepareStatement(sql);
			rs = st.executeQuery(sql);
			
			while (rs.next()) {
				ActivityReplyBean  actB = new ActivityReplyBean();
				actB.setRep_num(rs.getInt("rep_num"));
				actB.setRep_act(rs.getInt("rep_act"));
				actB.setRep_person(rs.getString("rep_person"));
				actB.setRep_content(rs.getString("rep_content"));
				actB.setRep_date(rs.getString("rep_date"));
				actB.setRep_nick(rs.getString("person_nick"));
				actB.setRep_parent(rs.getInt("rep_parent"));
				actB.setRep_org(rs.getString("rep_org"));
				actB.setRep_orgName(rs.getString("org_name"));
				
				actreply_arr.add(actB);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, st, rs);
		}
		return actreply_arr;
	}
	
	// 媛��명���� ��湲� �깅�
	public int act_reply_insertPerson (ActivityReplyBean actR, String id, int act_num, int rep_parent) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1; 
		
		String sql ="";
		
		try {
			con = pool.getConnection();
			
			sql = "insert into act_reply "
					+ "(rep_num, rep_act, rep_person,  rep_date, rep_content, rep_parent)"
					+ " values(act_reply_seq.nextval, ?, ?, sysdate,  ?, ?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, act_num); //글번호
			pstmt.setString(2, id); //아이디
			pstmt.setString(3, actR.getRep_content()); //내용
			pstmt.setInt(4, rep_parent); //rep_parent

			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	public int act_reply_insertOrg(ActivityReplyBean actR, String id, int act_num, int rep_parent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1; 

		try {
			con = pool.getConnection();
			sql = "insert into act_reply "
					+ "(rep_num, rep_act, rep_org,  rep_date, rep_content, rep_parent)"
					+ " values(act_reply_seq.nextval, ?, ?, sysdate,  ?, ?)";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, act_num); //글번호
			pstmt.setString(2, id); //아이디
			pstmt.setString(3, actR.getRep_content()); //내용
			pstmt.setInt(4, rep_parent); //rep_parent

			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	//��湲�媛���
	public int act_reply_count (int actrep_act){
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM act_reply where rep_act =" + actrep_act;

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
	
	public int act_rereply_count (int actrep_act, int rep_parent){
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(*) FROM act_reply where rep_parent = " + rep_parent + "and rep_act =" + actrep_act;

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
	
	
	// 댓글 삭제
	public int act_reply_delete (int actrep_num, int rep_parent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		
		String sql = "";
		
		try {
			con = pool.getConnection();
			if(rep_parent == 0) {
				//부모댓글의 경우
				sql="delete from act_reply where rep_num = ? or rep_parent = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, actrep_num);
				pstmt.setInt(2, actrep_num);
				pstmt.executeUpdate();
			}else {
				sql="delete from act_reply where rep_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, actrep_num);
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
	
	// 댓글 수정
	public int act_reply_update (ActivityReplyBean actRB) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "update act_reply set rep_content=? where rep_num = ?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, actRB.getRep_content());
			pstmt.setInt(2, actRB.getRep_num());
			
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
  
  	// 관리자 대외활동 리스트
	public ArrayList<ActivityBean> adminActivityList(int startRow, int endRow, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ActivityBean> adminActArr = new ArrayList<ActivityBean>();

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name, o.org_manager from "
						+ "activity a left outer join org_user o "
						+ "on a.act_org = o.org_id "
						+ "where act_type=1 order by act_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name, o.org_manager from "
						+ "activity a left outer join org_user o "
						+ "on a.act_org = o.org_id "
						+ "where " + keyField + " like ? and act_type=1 "
						+ "order by act_num desc) aa) "
						+ "where rn between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_type(rs.getInt("act_type"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setAct_hits(rs.getInt("act_hits"));
				bean.setAct_org(rs.getString("act_org"));
				bean.setAct_end(rs.getDate("act_end"));
				bean.setOrg_name(rs.getString("org_name"));
				bean.setAct_approve(rs.getInt("act_approve"));
				bean.setOrg_manager(rs.getString("org_manager"));
				adminActArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return adminActArr;
	}
	
	// 관리자 대외활동 수
	public int adminActivityCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select count(*) from activity where act_type=1";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(*) from activity where " + keyField + " like ? and act_type=1";
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
	
	// 관리자 공모전 리스트
	public ArrayList<ActivityBean> adminContestList(int startRow, int endRow, String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<ActivityBean> adminConArr = new ArrayList<ActivityBean>();

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name, o.org_manager from "
						+ "activity a left outer join org_user o "
						+ "on a.act_org = o.org_id "
						+ "where act_type=2) aa) "
						+ "where rn between ? and ? "
						+ "order by act_num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name, o.org_manager from "
						+ "activity a left outer join org_user o "
						+ "on a.act_org = o.org_id "
						+ "where " + keyField + " like ? and act_type=2) aa) "
						+ "where rn between ? and ? "
						+ "order by act_num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_type(rs.getInt("act_type"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setAct_hits(rs.getInt("act_hits"));
				bean.setAct_org(rs.getString("act_org"));
				bean.setAct_end(rs.getDate("act_end"));
				bean.setOrg_name(rs.getString("org_name"));
				bean.setAct_approve(rs.getInt("act_approve"));
				bean.setOrg_manager(rs.getString("org_manager"));
				adminConArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return adminConArr;
	}
	
	// 관리자 공모전 수
	public int adminContestCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;

		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord == null) {
				sql = "select count(*) from activity where act_type=2";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(*) from activity where " + keyField + " like ? and act_type=2";
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
	
	// 대외활동 공모전 삭제
	public int deleteActCon(int act_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "delete from activity where act_num=?";
		int re = 0;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, act_num);
			pstmt.executeUpdate();
      re=1;
    }catch (Exception e) {
      e.printStackTrace();
    } finally {
      pool.closeConnection(con, pstmt);
    }
    return re;
	}
	
	// 대외활동, 공모전 승인
	public int approveActCon(int act_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "update activity set act_approve=1 where act_num=?";
		int re = 0;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, act_num);
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	// 인기 대외활동 리스트
	public ArrayList<ActivityBean> popActivityList(int stratRow, int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ActivityBean> popActArr = new ArrayList<ActivityBean>();

		try {
			con = pool.getConnection();
			sql = "select * from "
					+ "(select rownum rn, aa.* from "
					+ "(select a.act_num, a.act_thumb, a.act_title, trunc(a.act_end - sysdate) as act_dday, a.act_hits, o.org_name from "
					+ "activity a left outer join org_user o "
					+ "on a.act_org = o.org_id "
					+ "where act_type=1 and act_approve=1 "
					+ "order by act_hits desc) aa) "
					+ "where rn between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, stratRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setOrg_name(rs.getString("org_name"));
				bean.setAct_dday(rs.getInt("act_dday"));
				bean.setAct_hits(rs.getInt("act_hits"));
				popActArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return popActArr;
	}
	
	// 인기 공모전 리스트
	public ArrayList<ActivityBean> popContestList(int startRow, int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ActivityBean> popConArr = new ArrayList<ActivityBean>();

		try {
			con = pool.getConnection();
			sql = "select * from "
					+ "(select rownum rn, aa.* from "
					+ "(select a.act_num, a.act_thumb, a.act_title, trunc(a.act_end - sysdate) as act_dday, a.act_hits, o.org_name from "
					+ "activity a left outer join org_user o "
					+ "on a.act_org = o.org_id "
					+ "where act_type=2 and act_approve=1 "
					+ "order by act_hits desc) aa) "
					+ "where rn between ? and ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setOrg_name(rs.getString("org_name"));
				bean.setAct_dday(rs.getInt("act_dday"));
				bean.setAct_hits(rs.getInt("act_hits"));
				popConArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return popConArr;
	}
	
	// 스크랩한 대외활동
	public ArrayList<ActivityBean> actScrapList(int startRow, int endRow, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ActivityBean> actScrapArr = new ArrayList<ActivityBean>();

		try {
			con = pool.getConnection();
			sql = "select * from "
					+ "(select rownum rn, aa.* from "
					+ "(select ab.*, o.org_name from "
					+ "(select a.*, trunc(a.act_end - sysdate) as act_dday, s.scrap_person from "
					+ "activity a left outer join scrap s "
					+ "on a.act_num = s.scrap_num) ab "
					+ "left outer join org_user o "
					+ "on ab.act_org = o.org_id "
					+ "where scrap_person=? and act_type=1) aa) "
					+ "where rn between ? and ? "
					+ "order by act_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_type(rs.getInt("act_type"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setAct_hits(rs.getInt("act_hits"));
				bean.setAct_dday(rs.getInt("act_dday"));
				bean.setOrg_name(rs.getString("org_name"));
				bean.setScrap_person(rs.getString("scrap_person"));
				actScrapArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return actScrapArr;
	}
	
	// 스크랩한 대외활동 수
	public int actScrapCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;

		try {
			con = pool.getConnection();
			sql = "select count(*) from "
					+ "(select a.*, s.scrap_person from "
					+ "activity a left outer join scrap s "
					+ "on a.act_num = s.scrap_num) "
					+ "where scrap_person=? and act_type=1";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	// 스크랩한 공모전
	public ArrayList<ActivityBean> conScrapList(int startRow, int endRow, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ActivityBean> conScrapArr = new ArrayList<ActivityBean>();

		try {
			con = pool.getConnection();
			sql = "select * from "
					+ "(select rownum rn, aa.* from "
					+ "(select ab.*, o.org_name from "
					+ "(select a.*, trunc(a.act_end - sysdate) as act_dday, s.scrap_person from "
					+ "activity a left outer join scrap s "
					+ "on a.act_num = s.scrap_num) ab "
					+ "left outer join org_user o "
					+ "on ab.act_org = o.org_id "
					+ "where scrap_person=? and act_type=2) aa) "
					+ "where rn between ? and ? "
					+ "order by act_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ActivityBean bean = new ActivityBean();
				bean.setAct_num(rs.getInt("act_num"));
				bean.setAct_type(rs.getInt("act_type"));
				bean.setAct_thumb(rs.getString("act_thumb"));
				bean.setAct_title(rs.getString("act_title"));
				bean.setAct_hits(rs.getInt("act_hits"));
				bean.setAct_dday(rs.getInt("act_dday"));
				bean.setOrg_name(rs.getString("org_name"));
				bean.setScrap_person(rs.getString("scrap_person"));
				conScrapArr.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt, rs);
		}
		return conScrapArr;
	}
	
	// 스크랩 공모전 수
	public int conScrapCount(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select count(*) from "
					+ "(select * from "
					+ "activity a left outer join scrap s "
					+ "on a.act_num = s.scrap_num) "
					+ "where scrap_person=? and act_type=2";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
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
	
	// 스크랩 제거
	public int scrapDelete(int act_num, String scrap_person) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int re = 0;

		try {
			con = pool.getConnection();
			sql = "delete from scrap where scrap_num=? and scrap_person=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, act_num);
			pstmt.setString(2, scrap_person);
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
