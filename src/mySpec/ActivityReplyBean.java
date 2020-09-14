package mySpec;

public class ActivityReplyBean {

	private int rep_num;			// 댓글 번호
	private int rep_act; 			// 댓글이 속한 글번호
	private String rep_person;		// 개인회원 댓글 작성자
	private String rep_content;		// 댓글 내용
	private String rep_date;		// 댓글 작성일	
	private String rep_admin;		// 관리자 댓글 작성자
	private String rep_nick;		// 개인회원 닉네임을 담을 변수
	private int rep_ref; 			// 댓글그룹(댓글번호)
	private int rep_pos;			// 그룹내 순서
	private int rep_depth; 			// 들여쓰기정도(답글인지 구분)
	private String act_target;		// 대댓글 대상의 닉네임
	private String rep_org;			// 단체회원 댓글
	private String rep_orgName;		// 단체회원 기업명
	
	public String getAct_target() {
		return act_target;
	}
	public void setAct_target(String act_target) {
		this.act_target = act_target;
	}
	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public int getRep_act() {
		return rep_act;
	}
	public void setRep_act(int rep_act) {
		this.rep_act = rep_act;
	}
	public String getRep_person() {
		return rep_person;
	}
	public void setRep_person(String rep_person) {
		this.rep_person = rep_person;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public String getRep_date() {
		return rep_date;
	}
	public void setRep_date(String rep_date) {
		this.rep_date = rep_date;
	}
	public String getRep_nick() {
		return rep_nick;
	}
	public void setRep_nick(String rep_nick) {
		this.rep_nick = rep_nick;
	}
	public int getRep_ref() {
		return rep_ref;
	}
	public void setRep_ref(int rep_ref) {
		this.rep_ref = rep_ref;
	}
	public int getRep_pos() {
		return rep_pos;
	}
	public void setRep_pos(int rep_pos) {
		this.rep_pos = rep_pos;
	}
	public int getRep_depth() {
		return rep_depth;
	}
	public void setRep_depth(int rep_depth) {
		this.rep_depth = rep_depth;
	}
	public String getRep_admin() {
		return rep_admin;
	}
	public void setRep_admin(String rep_admin) {
		this.rep_admin = rep_admin;
	}
	public String getRep_org() {
		return rep_org;
	}
	public void setRep_org(String rep_org) {
		this.rep_org = rep_org;
	}
	public String getRep_orgName() {
		return rep_orgName;
	}
	public void setRep_orgName(String rep_orgName) {
		this.rep_orgName = rep_orgName;
	}
}
	