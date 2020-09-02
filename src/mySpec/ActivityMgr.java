package mySpec;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ActivityMgr {
	private DBConnection pool;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public ActivityMgr() {
		super();
		pool = DBConnection.getInstance();
	}

	public ArrayList<ActivityBean> activityList(int act_type) {
		ArrayList<ActivityBean> ret = new ArrayList<ActivityBean>();
		String sql = "select * from activity where act_type=? and act_approve=1";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, act_type);
			rs = ps.executeQuery();
			while (rs.next()) {
				ActivityBean e = new ActivityBean();
				e.setAct_num(rs.getInt("act_num"));
				e.setAct_type(rs.getInt("act_type"));
				e.setAct_thumb(rs.getString("act_thumb"));
				e.setAct_post(rs.getString("act_post"));
				e.setAct_title(rs.getString("act_title"));
				e.setAct_hits(rs.getInt("act_hits"));
				e.setAct_org(rs.getString("act_org"));
				e.setAct_target(rs.getString("act_target"));
				e.setAct_start(rs.getDate("act_start"));
				e.setAct_end(rs.getDate("act_end"));
				e.setAct_pop(rs.getInt("act_pop"));
				e.setAct_reg(rs.getInt("act_reg"));
				e.setAct_field(rs.getInt("act_field"));
				e.setAct_home(rs.getString("act_home"));
				e.setAct_content(rs.getString("act_content"));
				e.setAct_award(rs.getInt("act_award"));
				e.setAct_approve(rs.getInt("act_approve"));
				ret.add(e);
			}
			pool.closeConnection(con, ps);
			return ret;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
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
}
