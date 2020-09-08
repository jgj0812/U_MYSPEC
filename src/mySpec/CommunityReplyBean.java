package mySpec;

public class CommunityReplyBean {
	private int rep_num; //댓글번호
	private int rep_comm; //댓글이 속한 글번호
	private String rep_person; //댓글 단사람
	private String rep_date; //댓글 달린 날짜
	
	private String rep_content; //댓글 내용
	private int rep_ref; //댓글 그룹(댓글번호)
	private int rep_step; //그룹내의 순서
	private int rep_level; //들여쓰기 정도(답글인지 구분)

	
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
	
	
	
}
	