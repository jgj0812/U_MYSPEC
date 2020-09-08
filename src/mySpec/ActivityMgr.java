package mySpec;

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
			tagMap = (HashMap<Integer, String>) new ObjectInputStream(new FileInputStream("tag.map")).readObject();
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

	public ArrayList<ActivityBean> getActivityList(int act_type) {
		ArrayList<ActivityBean> activityList = null;
		String sql = "select act_num, act_thumb, act_title, org_name,  trunc(act_end - sysdate) as act_dday, act_hits from activity, org_user where act_org = org_id and act_type=? and act_approve=1 order by act_num desc";
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
		pool.closeConnection(con, ps);
		return activityList;
	}
	
	public void insertActivity(ActivityBean activity) {
		String sql = "insert into activity(act_num, act_type, act_thumb, act_post, act_title, act_org, act_target, act_start, act_end, act_pop, act_reg, act_field, act_home, act_content) values(act_seq.nextval, 1, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, activity.getAct_thumb());
			ps.setString(2, activity.getAct_post());
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
			
			sql = "insert into act_reward values(act_seq.currval, ?)";
			for(int act_reward : activity.getAct_reward()) {
				ps = con.prepareStatement(sql);
				ps.setInt(1, act_reward);
				ps.executeUpdate();
			}
			
			sql = "insert into act_interest values(act_seq.currval, ?)";
			for(int act_interest : activity.getAct_interest()) {
				ps = con.prepareStatement(sql);
				ps.setInt(1, act_interest);
				ps.executeUpdate();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pool.closeConnection(con, ps);
	}
	
	public void insertContest(ActivityBean activity) {
		String sql = "insert into activity(act_num, act_type, act_thumb, act_post, act_title, act_hits, act_org, act_target, act_start, act_end, act_field, act_home, act_content, act_approve) values(ACT_SEQ, 2, ?, ?, ?, 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
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
			sql = "select act_type, act_thumb, act_post, act_title, act_hits, act_target, act_start, act_end, trunc(act_end - sysdate) as act_dday, act_pop, act_reg, act_field, act_home, act_content, act_award from activity where act_num = ? ";
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_num);
			rs = ps.executeQuery();
			rs.next();
			activity.setAct_type(rs.getInt("act_type"));
			activity.setAct_thumb(rs.getString("act_thumb"));
			activity.setAct_post(rs.getString("act_post"));
			activity.setAct_title(rs.getString("act_title"));
			activity.setAct_hits(rs.getInt("act_hits"));
			activity.setAct_target(rs.getString("act_target"));
			activity.setAct_start(rs.getDate("act_start"));
			activity.setAct_end(rs.getDate("act_end"));
			activity.setAct_dday(rs.getInt("act_dday"));
			activity.setAct_field(rs.getInt("act_field"));
			activity.setAct_home(rs.getString("act_home"));
			activity.setAct_content(rs.getString("act_content"));
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
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
}
