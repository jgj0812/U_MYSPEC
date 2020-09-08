package mySpec;

public class CommunityReplyBean {

	private int rep_num;			// 댓글 번호
	private int rep_comm; 			// 댓글이 적힐 글번호
	private String rep_person;		// 개인회원 작성자
	private String rep_content;		// 댓글 내용
	private String rep_date;		// 댓글 작성일
	private String rep_admin;		// 관리자 작성자
	private String rep_nick;		// 개인회원 닉네임을 담을 변수
	private int rep_ref; 			// 댓글그룹
	private int rep_step;			// 댓글순서
	private int rep_level; 			// 들여쓰기

	public int getRep_num() {
		return rep_num;
	}
	public void setRep_num(int rep_num) {
		this.rep_num = rep_num;
	}
	public int getRep_comm() {
		return rep_comm;
	}
	public void setRep_comm(int rep_comm) {
		this.rep_comm = rep_comm;
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
	public int getRep_ref() {
		return rep_ref;
	}
	public void setRep_ref(int rep_ref) {
		this.rep_ref = rep_ref;
	}
	public int getRep_level() {
		return rep_level;
	}
	public void setRep_level(int rep_level) {
		this.rep_level = rep_level;
	}
	public int getRep_step() {
		return rep_step;
	}
	public void setRep_step(int rep_step) {
		this.rep_step = rep_step;
	}
	public String getRep_admin() {
		return rep_admin;
	}
	public void setRep_admin(String rep_admin) {
		this.rep_admin = rep_admin;
	}
	public String getRep_nick() {
		return rep_nick;
	}
	public void setRep_nick(String rep_nick) {
		this.rep_nick = rep_nick;
	}
}
	