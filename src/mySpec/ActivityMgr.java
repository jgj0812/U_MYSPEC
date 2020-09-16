package mySpec;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	
	public ArrayList<ActivityBean> getActivityList(int act_type, int length) {
		ArrayList<ActivityBean> activityList = new ArrayList<ActivityBean>();
		String sql = "select * from (select rownum as rn, act.* from (select act_num, act_thumb, act_title, org_name, trunc(act_end - sysdate) as act_dday, act_hits, nvl(scraps, 0) as scraps, nvl(reps, 0) as reps from activity, org_user, (select scrap_num, count(scrap_person) as scraps from scrap group by scrap_num), (select rep_act, count(rep_num) as reps from act_reply group by rep_act) where act_org = org_id and act_type = ? and act_approve = 1 and act_num = scrap_num(+) and act_num = rep_act(+) order by scraps desc, reps desc, act_hits desc, act_num desc)act) where rn between 1 and " + length;
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_type);
			rs = ps.executeQuery();
			while(rs.next()) {
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
	
	public int activity_scrap_count(int act_num) {
		String sql = "select count(scrap_person) as scrap_count from scrap where scrap_num=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt("scrap_count");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}

	public int activity_reply_count(int act_num) {
		String sql = "select count(rep_num) as reply_count from act_reply where rep_act=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt("reply_count");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
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
				sql = "insert into activity(act_num, act_type, act_thumb, act_title, act_org, act_target, act_start, act_end, act_field, act_award, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

	// 활동 검색
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
	
	// 검색된 활동 수
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
						+ "activity where act_type=1 a "
						+ "left outer join org_user o "
						+ "on a.act_org = o.org_id) aa) "
						+ "where rn between ? and ? "
						+ "order by act_num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name, o.org_manager from "
						+ "(select * from activity "
						+ "where " + keyField + " like ? and act_type=1) a "
						+ "left outer join org_user o "
						+ "on a.act_org = o.org_id) aa) "
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
						+ "activity where act_type=2 a "
						+ "left outer join org_user o "
						+ "on a.act_org = o.org_id) aa) "
						+ "where rn between ? and ? "
						+ "order by act_num desc";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			}else {
				sql = "select * from "
						+ "(select rownum rn, aa.* from "
						+ "(select a.*, o.org_name, o.org_manager from "
						+ "(select * from activity "
						+ "where " + keyField + " like ? and act_type=2) a "
						+ "left outer join org_user o "
						+ "on a.act_org = o.org_id) aa) "
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
	
	// 대외활동, 공모전 삭제
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
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
}
