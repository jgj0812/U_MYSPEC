package mySpec;

import java.sql.Date;

public class ActivityBean {
	private int act_num;				// 번호
	private int act_type;				// 유형(1 : 대외활동, 2 : 공모전)
	private String act_thumb;		// 썸네일
	private String act_post;			// 포스터
	private String act_title;			// 제목
	private int act_hits;					// 조회수
	private String act_org;			// 주최기관 아이디
	private String org_name;		// 주최기관명
	private String act_target;		// 참여대상
	private Date act_start;			// 기간 시작
	private Date act_end;				// 기간 마감
	private int act_dday;				// d-day
	private int act_pop;					// 모집인원
	private int act_reg;					// 모임지역
	private int[] act_reward;		// 활동혜택
	private int act_field;				// 활동분야
	private int[] act_interest;		// 관심분야
	private String act_home;		// 홈페이지
	private String act_content;	// 상세내용
	private int act_award;			// 시상규모
	private int act_approve;		// 승인여부
	
	public int getAct_num() {
		return act_num;
	}
	public void setAct_num(int act_num) {
		this.act_num = act_num;
	}
	public int getAct_type() {
		return act_type;
	}
	public void setAct_type(int act_type) {
		this.act_type = act_type;
	}
	public String getAct_thumb() {
		return act_thumb;
	}
	public void setAct_thumb(String act_thumb) {
		this.act_thumb = act_thumb;
	}
	public String getAct_post() {
		return act_post;
	}
	public void setAct_post(String act_post) {
		this.act_post = act_post;
	}
	public String getAct_title() {
		return act_title;
	}
	public void setAct_title(String act_title) {
		this.act_title = act_title;
	}
	public int getAct_hits() {
		return act_hits;
	}
	public void setAct_hits(int act_hits) {
		this.act_hits = act_hits;
	}
	public String getAct_org() {
		return act_org;
	}
	public void setAct_org(String act_org) {
		this.act_org = act_org;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
	}
	public String getAct_target() {
		return act_target;
	}
	public void setAct_target(String act_target) {
		this.act_target = act_target;
	}
	public Date getAct_start() {
		return act_start;
	}
	public void setAct_start(Date act_start) {
		this.act_start = act_start;
	}
	public Date getAct_end() {
		return act_end;
	}
	public void setAct_end(Date act_end) {
		this.act_end = act_end;
	}
	public void setAct_dday(int act_dday) {
		this.act_dday = act_dday;
	}
	public int getAct_dday() {
		return act_dday;
	}
	public int getAct_pop() {
		return act_pop;
	}
	public void setAct_pop(int act_pop) {
		this.act_pop = act_pop;
	}
	public int getAct_reg() {
		return act_reg;
	}
	public void setAct_reg(int act_reg) {
		this.act_reg = act_reg;
	}
	public int[] getAct_reward() {
		return act_reward;
	}
	public void setAct_reward(int[] act_reward) {
		this.act_reward = act_reward;
	}
	public int getAct_field() {
		return act_field;
	}
	public void setAct_field(int act_field) {
		this.act_field = act_field;
	}
	public int[] getAct_interest() {
		return act_interest;
	}
	public void setAct_interest(int[] act_interest) {
		this.act_interest = act_interest;
	}
	public String getAct_home() {
		return act_home;
	}
	public void setAct_home(String act_home) {
		this.act_home = act_home;
	}
	public String getAct_content() {
		return act_content;
	}
	public void setAct_content(String act_content) {
		this.act_content = act_content;
	}
	public int getAct_award() {
		return act_award;
	}
	public void setAct_award(int act_award) {
		this.act_award = act_award;
	}
	public int getAct_approve() {
		return act_approve;
	}
	public void setAct_approve(int act_approve) {
		this.act_approve = act_approve;
	}
}
