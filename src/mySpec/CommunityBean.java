package mySpec;

public class CommunityBean {
	private int comm_num; //글번호
	private int comm_type; //공지사항, 일반글
	private String comm_title; //글제목
	private String comm_person; //아이디를 참조하지만 닉네임 뿌려야함
	private String comm_date; // 작성일
	private int comm_hits; //조회수
	private String comm_content; //글내용
	private String comm_nick;	// 참조하는 닉네임이 담길 변수
	private String comm_admin;	// 관리자 아이디 참조용 변수
	
	public int getComm_num() {
		return comm_num;
	}
	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
	public int getComm_type() {
		return comm_type;
	}
	public void setComm_type(int comm_type) {
		this.comm_type = comm_type;
	}
	public String getComm_title() {
		return comm_title;
	}
	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}
	public String getComm_person() {
		return comm_person;
	}
	public void setComm_person(String comm_person) {
		this.comm_person = comm_person;
	}
	public String getComm_date() {
		return comm_date;
	}
	//String 받은거 스플릿(공백)
	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}
	public int getComm_hits() {
		return comm_hits;
	}
	public void setComm_hits(int comm_hits) {
		this.comm_hits = comm_hits;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public String getComm_nick() {
		return comm_nick;
	}
	public void setComm_nick(String comm_nick) {
		this.comm_nick = comm_nick;
	}
	public String getComm_admin() {
		return comm_admin;
	}
	public void setComm_admin(String comm_admin) {
		this.comm_admin = comm_admin;
	}
}
