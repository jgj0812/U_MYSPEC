package mySpec;

import java.io.File;
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
		System.out.println(new File("tag.map").getAbsolutePath());
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

	public ArrayList<ActivityBean> getActivityList(int act_type, String where, String order) {
		ArrayList<ActivityBean> activityList = null;
		String sql = null;
		if(where.equals("")) {
			sql = "select act_num, act_thumb, act_title, org_name,  trunc(act_end - sysdate) as act_dday, act_hits from activity, org_user where act_org = org_id and act_type=? and act_approve=1";
		} else {
			sql = "select distinct act_num, act_thumb, act_title, org_name,  trunc(act_end - sysdate) as act_dday, act_hits from (select * from activity, org_user, act_interest, act_reward where act_org = org_id and act_num=interest_act and act_num=reward_act and act_type=? and act_approve=1) where" + where;
		}
		sql += " order by act_num desc";
		System.out.println(sql);
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
		String sql = "insert into activity(act_num, act_type, act_thumb, act_post, act_title, act_org, act_target, act_start, act_end, act_pop, act_reg, act_field, act_home, act_content) values(act_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, activity.getAct_type());
			ps.setString(2, activity.getAct_thumb());
			ps.setString(3, activity.getAct_post());
			ps.setString(4, activity.getAct_title());
			ps.setString(5, activity.getAct_org());
			ps.setString(6, activity.getAct_target());
			ps.setDate(7, activity.getAct_start());
			ps.setDate(8, activity.getAct_end());
			ps.setInt(9, activity.getAct_pop());
			ps.setInt(10, activity.getAct_reg());
			ps.setInt(11, activity.getAct_field());
			ps.setString(12, activity.getAct_home());
			ps.setString(13, activity.getAct_content());
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
	
	
	
//---------- 활동 댓글 기능
	
	//댓글 리스트(등록된 댓글 보기)
	public ArrayList<ActivityReplyBean> act_reply_list(int rep_act) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		String sql = "select ar.*, o.org_name from "	
						+ "(select r.*, p.person_nick from "
						+ "act_reply r left outer join person_user p "
						+ "on r.rep_person = p.person_id "
						+ "where rep_act = "+ rep_act + ") ar "
						+ "left outer join org_user o "
						+ "on ar.rep_org = o.org_id "
						+ " order by rep_ref desc, rep_pos asc";
		
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
				actB.setRep_ref(rs.getInt("rep_ref"));
				actB.setRep_nick(rs.getString("person_nick"));
				actB.setRep_pos(rs.getInt("rep_pos"));
				actB.setRep_depth(rs.getInt("rep_depth"));
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
	

	

	// 개인회원 댓글 등록
	public int act_reply_insertPerson (ActivityReplyBean actR, String id, int act_num) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1; 
		int number = 0;
		
		int rep_num = actR.getRep_num(); //글번호
		int rep_ref= actR.getRep_ref();
		int rep_pos =actR.getRep_pos();
		int rep_depth = actR.getRep_depth();
		
		String sql ="";
		
		try {
			con = pool.getConnection();
			//새댓글: ref= rep_num의 최대값+1, re_pos=0, re_depth=0
			sql="select max(rep_num) from act_reply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //최대값 구하기
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
				
			}else {//테이블에 데이터가 하나도 없을 때
				number = 1;
				
			}
			//ref re_pos re_level 결정
			
			if(rep_num!=0) { //대댓글
				sql="update act_reply set rep_pos=rep_pos+1 where rep_ref=? and rep_pos>?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rep_ref);
				pstmt.setInt(2, rep_pos);
				pstmt.executeUpdate();
				
				
				rep_pos =rep_pos+1; //부모 re_step+1
				rep_depth=rep_depth+1;//부모 re_level+1
			
			}else {//새댓글
				rep_ref=number;
				rep_pos=0;
				rep_depth=0;
			}
			
            			//번호                             글번호 아이디  날짜   내용  rep_ref rep_pos rep_depth
			sql = "insert into act_reply (rep_num, rep_act, rep_person, rep_date, rep_content, rep_ref, rep_pos, rep_depth)"
		                                       + " values(act_reply_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1, act_num); //글번호
			pstmt.setString(2, id); //아이디
			
			pstmt.setString(3, actR.getRep_content()); //내용
			pstmt.setInt(4, rep_ref); //rep_ref
			pstmt.setInt(5, rep_pos); //rep_pos
			pstmt.setInt(6, rep_depth); //rep_depth
			

			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	public int act_reply_insertOrg(ActivityReplyBean actR, String id, int act_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1; 
		int number = 0;
		
		int rep_num = actR.getRep_num(); //글번호
		int rep_ref= actR.getRep_ref();
		int rep_pos =actR.getRep_pos();
		int rep_depth = actR.getRep_depth();

		try {
			con = pool.getConnection();
			sql="select max(rep_num) from act_reply";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); //최대값 구하기
			
			if(rs.next()) {
				number=rs.getInt(1)+1;
				
			}else {//테이블에 데이터가 하나도 없을 때
				number = 1;
				
			}
			//ref re_pos re_level 결정
			
			if(rep_num!=0) { //대댓글
				sql="update act_reply set rep_pos=rep_pos+1 where rep_ref=? and rep_pos>?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, rep_ref);
				pstmt.setInt(2, rep_pos);
				pstmt.executeUpdate();
				
				
				rep_pos =rep_pos+1; //부모 re_step+1
				rep_depth=rep_depth+1;//부모 re_level+1
			
			}else {//새댓글
				rep_ref=number;
				rep_pos=0;
				rep_depth=0;
			}
			
			sql = "insert into act_reply (rep_num, rep_act, rep_org, rep_date, rep_content, rep_ref, rep_pos, rep_depth) "
					+ "values(act_reply_seq.nextval, ?, ?, sysdate, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, act_num);
			pstmt.setString(2, id);
			pstmt.setString(3, actR.getRep_content());
			pstmt.setInt(4, rep_ref);
			pstmt.setInt(5, rep_pos);
			pstmt.setInt(6, rep_depth);
			pstmt.executeUpdate();
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
		return re;
	}
	
	//댓글 삭제
	public void act_reply_delete (int actrep_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql = "delete from act_reply where rep_num = ?";
		
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, actrep_num);
			pstmt.executeUpdate();
			
			re = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.closeConnection(con, pstmt);
		}
	
	}
	
	//댓글 수정
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
	
	//댓글갯수
	public int act_reply_count (int actrep_act){
		// TODO Auto-generated method stub
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = "SELECT COUNT(rep_act) FROM act_reply where rep_act =" + actrep_act;

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

	
	
	
}
